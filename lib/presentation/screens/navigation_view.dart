import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/chat/chat_view.dart';
import 'package:construct/presentation/screens/main/main_view.dart';
import 'package:construct/presentation/screens/orders/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key, this.index});
  final int? index;
  static const routeName = '/';

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late int currentIndex;
  final List<Widget> screens = [
    OrdersView(),
    MainView(),
    ChatView(),
  ];

  @override
  void initState() {
    currentIndex = widget.index ?? 1;
    super.initState();
  }

  Alignment get _activeAlignment {
    switch (currentIndex) {
      case 0:
        return Alignment.topLeft;
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      default:
        return Alignment.topCenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: FloatingActionButton(
              onPressed: () async {
                if (await canLaunchUrlString('https://t.me/opaantoha')) {
                  await launchUrlString('https://t.me/opaantoha');
                }
              },
              shape: CircleBorder(),
              backgroundColor: colorScheme.primary,
              child: Icon(
                Icons.question_mark,
                size: 32,
              ),
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .1),
                          blurRadius: 12,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 7,
                  child: AnimatedAlign(
                    alignment: _activeAlignment,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButton(
                          0, Icons.shopping_cart, S.of(context).orders),
                      _buildButton(1, Icons.house, S.of(context).main),
                      _buildButton(2, Icons.messenger, S.of(context).chats),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildButton(int index, IconData icon, String label) {
    final isActive = currentIndex == index;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: SizedBox(
        width: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Иконка с анимацией цвета
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.transparent : null,
              ),
              child: Icon(
                icon,
                size: 24,
                color: isActive ? Colors.white : colorScheme.primary,
              ),
            ),
            SizedBox(height: isActive ? 12 : 8),
            // Текст
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              ),
              child: Text(
                label,
                style: TextStyle(color: colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool active;
  final VoidCallback onClick;

  const CircleButton({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.active,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onClick,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 3,
        children: [
          active
              ? CircleAvatar(
                  backgroundColor: colorScheme.primary,
                  radius: 27,
                  child: Icon(
                    icon,
                    color: colorScheme.surface,
                  ),
                )
              : Icon(
                  icon,
                  color: colorScheme.primary,
                ),
          Text(
            label,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
