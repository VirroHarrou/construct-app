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
  User? user;

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
    user = await ref.read(userServiceProvider).getMe();
    setState(() {});
  }

  List<Chat> sortChats(List<Chat> chats, String sort) {
    final newChats = List<Chat>.from(chats);
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

  @override
  void initState() {
    super.initState();
    getMe();
    getChats(ref);
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
                  horizontal: 18,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed(UserView.routeName),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Spacer(),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 276),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white, height: 0.2, fontSize: 16),
                        controller: TextEditingController(),
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
                      final newData = sortChats(chats, value);
                      setState(() {
                        sortedChats.clear();
                        sortedChats.addAll(newData);
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
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: ChatItem(message: sortedChats[index]),
                ),
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
