import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:construct/domain/entities/chat/chat_item/chat.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/chat/chat_item.dart';
import 'package:construct/presentation/screens/user/user_view.dart';
import 'package:construct/presentation/widgets/radio_widget.dart';
import 'package:construct/services/api/chat/chat_api_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key});

  static const routeName = '/chats';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final List<Chat> chats = [];
  final List<Chat> sortedChats = [];
  final searchFilter = TextEditingController();
  User? user;
  Timer? _debounce; // Таймер для задержки поиска
  String currentSort = 'Все';

  Future<void> getChats(WidgetRef ref) async {
    try {
      final res = await ref.read(chatApiServiceProvider).getUserChats();
      chats.clear;
      sortedChats.clear;
      setState(() {
        chats.addAll(res);
        sortedChats.addAll(sortChats(chats, 'Все'));
      });
    } catch (_) {}
  }

  Future<void> getMe() async {
    try {
      user = await ref.read(userServiceProvider).getMe();
      setState(() {});
    } catch (_) {}
  }

  List<Chat> sortChats(List<Chat> chats, String sort) {
    final newChats = List<Chat>.from(chats);
    if (searchFilter.text.isNotEmpty) {}
    switch (sort) {
      case "Я заказчик":
        newChats.removeWhere((chat) => chat.id != user?.id);
        return newChats;
      case "Я исполнитель":
        newChats.removeWhere((chat) => chat.id == user?.id);
        return newChats;
      default:
        break;
    }
    return newChats;
  }

  List<Chat> filterAndSortChats(List<Chat> chats, String query) {
    if (query.isEmpty) {
      return sortChats(chats, currentSort);
    }

    final lowerQuery = query.toLowerCase();
    final exactMatches = <Chat>[];
    final partialMatches = <Chat>[];

    for (final chat in chats) {
      final username = chat.username.toLowerCase();
      if (username == lowerQuery) {
        exactMatches.add(chat);
      } else if (username.contains(lowerQuery)) {
        partialMatches.add(chat);
      }
    }

    return [...exactMatches, ...partialMatches];
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        sortedChats.clear();
        sortedChats.addAll(filterAndSortChats(chats, searchFilter.text));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMe();
    getChats(ref);
    searchFilter.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchFilter.removeListener(_onSearchChanged);
    searchFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 18.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed(UserView.routeName),
                      child: CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: user?.imageUrl ?? '',
                            width: 44,
                            height: 44,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, progress) => Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              child: const Icon(Icons.person, size: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 276),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white, height: 0.2, fontSize: 16),
                        controller: searchFilter,
                        onEditingComplete: () {
                          setState(() {
                            sortedChats.clear();
                            sortedChats.addAll(
                              filterAndSortChats(chats, searchFilter.text),
                            );
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Поиск',
                          labelStyle:
                              TextStyle(color: Colors.white, height: 2.0),
                          contentPadding: EdgeInsets.only(left: 18),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 93,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RadioWidget(
                    onChanged: (value) {
                      setState(() {
                        currentSort = value;
                        sortedChats.clear();
                        sortedChats.addAll(
                          filterAndSortChats(chats, searchFilter.text),
                        );
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        sortedChats.isNotEmpty
            ? SliverList.builder(
                itemBuilder: (context, index) {
                  final chatItem = ChatItem(chat: sortedChats[index]);
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                    child: chatItem,
                  );
                },
                itemCount: sortedChats.length,
              )
            : SliverFillRemaining(
                child: Center(
                  child: Text('Пока здесь нет чатов'),
                ),
              ),
      ],
    );
  }
}
