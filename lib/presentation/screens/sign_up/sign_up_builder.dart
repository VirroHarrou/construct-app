import 'package:construct/core/utils/phone_digits.dart';
import 'package:construct/core/utils/user_fields_validator.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/screens/sign_in/sign_in_view.dart';
import 'package:construct/presentation/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpBuilder extends ConsumerStatefulWidget {
  final String? Function(UserCreate) onSubmit;

  const SignUpBuilder({super.key, required this.onSubmit});

  @override
  ConsumerState<SignUpBuilder> createState() => _SignUpBuilderState();
}

class _SignUpBuilderState extends ConsumerState<SignUpBuilder> {
  late UserCreate newUser;
  int state = 0;
  String? errorMessage;

  final fioController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final addressController = TextEditingController();
  final innController = TextEditingController();

  bool validateUser(UserCreate user) {
    switch (state) {
      case 0:
        if (user.phone.length == 11 && user.password.isNotEmpty) return true;
        break;
      case 1:
        if (user.address.isNotEmpty &&
            user.fio.isNotEmpty &&
            user.inn.isNotEmpty) {
          return true;
        }
        break;
      case 2:
        break;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case 0:
        return buildFirstPart(context);
      case 1:
        return buildSecondPart(context);
      default:
        return Center();
    }
  }

  Widget buildFirstPart(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          'Регистрация',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
            fontSize: 30,
          ),
        ),
        Text(
          'Введите ваш логин и пароль, для регистрации!',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: colorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        PrimaryTextField(
          textEditingController: phoneController,
          label: S.of(context).phoneNumber,
          hintText: '+7(999)531-43-14',
          inputFormatters: [
            MaskTextInputFormatter(
              mask: '+7(XXX)XXX-XX-XX',
              filter: {'X': RegExp(r'\d')},
            )
          ],
        ),
        PrimaryTextField(
          textEditingController: passwordController,
          label: S.of(context).password,
          hintText: 'Пароль',
          textCapitalization: TextCapitalization.none,
        ),
        PrimaryTextField(
          textEditingController: repeatPasswordController,
          label: S.of(context).repeatPassword,
          hintText: 'Пароль',
          textCapitalization: TextCapitalization.none,
        ),
        if (errorMessage != null) ...[
          Text(
            errorMessage!,
            style: TextStyle(
              color: colorScheme.error,
            ),
          ),
        ],
        SizedBox(height: 14),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            errorMessage = null;
            final phone = phoneController.text;
            final password = passwordController.text;
            if (password.length < 6) {
              errorMessage = 'Пароль слишком короткий!';
            } else if (password != repeatPasswordController.text) {
              errorMessage = 'Введеные пароли должны совпадать!';
            } else if (extractPhoneDigits(phone) == null) {
              errorMessage = 'Введите полный номер телефона!';
            }
            setState(() {});
            if (errorMessage != null) return;
            final initUser = UserCreate(
              fio: '',
              phone: extractPhoneDigits(phone)!,
              address: '',
              inn: '',
              password: password,
            );
            if (validateUser(initUser)) {
              setState(() => state++);
              newUser = initUser;
            }
          },
          child: Text(
            'Далее',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          children: [
            Text('Уже есть аккаунт? '),
            InkWell(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(SignInView.routeName),
              child: Text(
                'Войти',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildSecondPart(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          'Регистрация',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
            fontSize: 30,
          ),
        ),
        Text(
          'Введите ваши данные для регистрации!',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: colorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        PrimaryTextField(
          textEditingController: fioController,
          label: S.of(context).FCs,
          hintText: 'Жуков Максим Леонидович',
        ),
        PrimaryTextField(
          textEditingController: addressController,
          label: S.of(context).address,
          hintText: 'ул. Угличская, д. 155, г. Ярославль',
        ),
        PrimaryTextField(
          textEditingController: innController,
          label: 'ИНН',
          hintText: '123456789000',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(12),
          ],
        ),
        if (errorMessage != null) ...[
          Text(
            errorMessage!,
            style: TextStyle(
              color: colorScheme.error,
            ),
          ),
        ],
        const SizedBox(
          height: 14,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            errorMessage = null;
            final fio = fioController.text;
            final address = addressController.text;
            final inn = innController.text;
            errorMessage =
                userFieldsValidator(inn: inn, fio: fio, address: address);
            setState(() {});
            final initUser = UserCreate(
              fio: fio,
              phone: '',
              address: address,
              inn: inn,
              password: '',
            );
            if (validateUser(initUser)) {
              setState(() => state++);
              newUser = UserCreate(
                fio: fio,
                phone: newUser.phone,
                address: address,
                inn: inn,
                password: newUser.password,
              );
              errorMessage = widget.onSubmit(newUser);
            }
          },
          child: Text(
            'Далее',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          children: [
            Text('Уже есть аккаунт? '),
            InkWell(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(SignInView.routeName),
              child: Text(
                'Войти',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
