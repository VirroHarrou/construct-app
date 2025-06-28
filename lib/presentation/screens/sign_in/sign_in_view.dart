import 'package:construct/core/utils/phone_digits.dart';
import 'package:construct/presentation/screens/navigation_view.dart';
import 'package:construct/presentation/screens/sign_up/sing_up_view.dart';
import 'package:construct/presentation/widgets/primary_text_field.dart';
import 'package:construct/services/api/auth_service.dart';
import 'package:construct/services/token/token_storage_service.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  static const routeName = '/sign_in';

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  String? message;

  Future<String?> login(String password, String phone) async {
    final authService = ref.read(authServiceProvider);
    final tokenService = ref.read(tokenStorageServiceProvider);
    try {
      final token = await authService.login(phone, password);
      tokenService.saveTokens(token["access_token"], token["refresh_token"]);
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              'Войти',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: colorScheme.primary,
                fontSize: 30,
              ),
            ),
            Text(
              'Введите ваш логин и пароль, чтобы войти!',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                // color: AppColors.primaryLight,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            PrimaryTextField(
              textEditingController: _phoneController,
              label: 'Номер телефона',
              hintText: '+7(999)999-99-99',
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '+7(XXX)XXX-XX-XX',
                  filter: {'X': RegExp(r'\d')},
                )
              ],
            ),
            PrimaryTextField(
              textEditingController: _passwordController,
              label: 'Пароль',
              hintText: 'Пароль',
              obscureText: true,
              textCapitalization: TextCapitalization.none,
            ),
            if (!message.isEmptyOrNull) ...[
              Text(
                message!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () async {
                final phone = extractPhoneDigits(_phoneController.text);
                final password = _passwordController.text;

                if (phone == null || password.isEmpty) {
                  setState(() => message = "Заполните все поля");
                  return;
                }

                final errorMessage = await login(password, phone);
                if (errorMessage != null) {
                  setState(() => message = errorMessage);
                } else if (context.mounted) {
                  Navigator.pushReplacementNamed(
                      context, NavigationView.routeName);
                }
              },
              child: Text(
                'Войти',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                Text('Не зарегистрирован? '),
                InkWell(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(SignUpView.routeName),
                  child: Text(
                    'Создать аккаунт',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
