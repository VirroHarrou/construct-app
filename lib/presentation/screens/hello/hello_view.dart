import 'package:construct/presentation/screens/sign_in/sign_in_view.dart';
import 'package:construct/presentation/screens/sign_up/sing_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelloView extends StatelessWidget {
  const HelloView({super.key});

  static const routeName = '/hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                width: MediaQuery.of(context).size.width,
                'assets/images/top_background.svg',
                fit: BoxFit.contain,
              ),
              SvgPicture.asset(
                width: MediaQuery.of(context).size.width,
                'assets/images/bottom_background.svg',
                fit: BoxFit.contain,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  'КОНСТРАКТ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 130),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(SignUpView.routeName),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Регистрация',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(SignInView.routeName),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 30,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Войти',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
