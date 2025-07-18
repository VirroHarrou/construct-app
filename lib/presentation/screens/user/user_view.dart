import 'package:cached_network_image/cached_network_image.dart';
import 'package:construct/domain/entities/review/review.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/presentation/screens/user/user_edit.dart';
import 'package:construct/presentation/screens/verification/verification_view.dart';
import 'package:construct/services/api/auth_service.dart';
import 'package:construct/services/api/review_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserView extends ConsumerStatefulWidget {
  const UserView({super.key});

  static const routeName = '/user';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserViewState();
}

class _UserViewState extends ConsumerState<UserView> {
  User? user;
  final List<Review> reviews = [];
  final menuController = MenuController();

  Future<void> _init() async {
    try {
      final user = await ref.read(userServiceProvider).getMe();
      final reviews =
          await ref.read(reviewServiceProvider).getRecepientReviews(user.id);
      setState(() {
        this.user = user;
        this.reviews.addAll(reviews);
      });
    } catch (_) {}
  }

  Future<void> getReviews() async {}

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, colorScheme),
          SliverList(
            delegate: SliverChildListDelegate.fixed([_buildProfile()]),
          ),
          reviews.isEmpty
              ? SliverFillRemaining(
                  child: Center(child: Text("Пока здесь пусто")),
                )
              : SliverList.builder(
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorScheme.primaryContainer,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          _buildRatingWidget(review, colorScheme),
                          Text(
                            review.content,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: reviews.length,
                ),
        ],
      ),
    );
  }

  Row _buildRatingWidget(Review review, ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(review.rating >= 1 ? Icons.star : Icons.star_border,
            color: colorScheme.primary),
        Icon(review.rating >= 2 ? Icons.star : Icons.star_border,
            color: colorScheme.primary),
        Icon(review.rating >= 3 ? Icons.star : Icons.star_border,
            color: colorScheme.primary),
        Icon(review.rating >= 4 ? Icons.star : Icons.star_border,
            color: colorScheme.primary),
        Icon(review.rating >= 5 ? Icons.star : Icons.star_border,
            color: colorScheme.primary),
      ],
    );
  }

  SliverAppBar _buildAppBar(BuildContext context, ColorScheme colorScheme) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: colorScheme.primary,
        ),
      ),
      actions: [
        MenuAnchor(
          controller: menuController,
          style: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          builder: (context, controller, child) {
            return IconButton(
              icon: Icon(Icons.more_horiz, color: colorScheme.primary),
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
            );
          },
          menuChildren: [
            InkWell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                child: const Text(
                  'Выйти',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () => ref.read(authServiceProvider).logout(),
            ),
            InkWell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                child: const Text(
                  'Редактировать профиль',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(
                  UserEditView.routeName,
                  arguments: user!,
                );
                if (result != null) {
                  setState(() => user = result as User);
                }
              },
            ),
            InkWell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                child: const Text(
                  'Верифицировать профиль',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () async => await Navigator.of(context)
                  .pushNamed(VerificationView.routeName, arguments: user!),
            ),
          ],
        )
      ],
    );
  }

  Padding _buildProfile() {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 354,
        child: Stack(
          children: [
            Positioned.fill(
              top: 34,
              child: Container(
                padding: EdgeInsets.only(top: 66),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colorScheme.primaryContainer,
                ),
                child: user == null
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        spacing: 10,
                        children: [
                          Text(
                            user!.fio,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildInfItem('1.1K', 'Просмотры'),
                                VerticalDivider(
                                  color: colorScheme.onSurfaceVariant,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                _buildInfItem(
                                    reviews.length.toString(), 'Отзывы'),
                                VerticalDivider(
                                  color: colorScheme.onSurfaceVariant,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                _buildInfItem('65', 'Работы'),
                              ],
                            ),
                          ),
                          Text(user!.description != null
                              ? user!.description!
                              : user!.address),
                        ],
                      ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: user?.imageUrl ?? '',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) =>
                        Container(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      child: const Icon(Icons.person, size: 30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
