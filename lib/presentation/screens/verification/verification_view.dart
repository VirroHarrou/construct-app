import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationView extends ConsumerStatefulWidget {
  const VerificationView({super.key, required this.user});
  final User user;

  static const routeName = '/verifiaction';

  @override
  ConsumerState<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends ConsumerState<VerificationView> {
  final _titleController = TextEditingController();
  final _fcsController = TextEditingController();
  final _addressController = TextEditingController();
  final _innController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fcsController.text = widget.user.fio;
    _addressController.text = widget.user.address;
    _innController.text = widget.user.inn;
  }

  Future<void> submit() async {
    // final userUpdate = UserUpdate(
    //   fio: _fcsController.text,
    //   phone: widget.user.phone,
    //   address: _addressController.text,
    //   imageUrl: widget.user.imageUrl,
    //   description: widget.user.description,
    // );
    try {
      // await ref.read(userServiceProvider).updateUser(userUpdate);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Верификация',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                    fontSize: 30,
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Введите ваши данные юридического лица!',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Верификация позволит заказчикам быть уверенными в вашем профессионализме',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 10),
                PrimaryTextField(
                  textEditingController: _titleController,
                  label: 'Название организации:',
                  hintText: 'ЗАО “бещёки”',
                ),
                PrimaryTextField(
                  textEditingController: _fcsController,
                  label: S.of(context).FCs,
                  hintText: 'Жуков Максим Леонидович',
                ),
                PrimaryTextField(
                  textEditingController: _addressController,
                  label: '${S.of(context).address}:',
                  hintText: 'ул. Угличская, д. 155, г. Ярославль',
                ),
                PrimaryTextField(
                  textEditingController: _innController,
                  label: 'ИНН:',
                  hintText: '123456789000',
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: submit,
                  child: Text(
                    'Далее',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
