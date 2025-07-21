import 'package:construct/domain/entities/company/company.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/widgets/primary_text_field.dart';
import 'package:construct/services/api/company_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fcsController.text = widget.user.fio;
    _addressController.text = widget.user.address;
    _titleController.text = widget.user.company?.name ?? '';
    _innController.text = widget.user.company?.inn ?? '';
  }

  Future<void> submit() async {
    if (_innController.text.length != 10) {
      setState(() {
        errorMessage = 'ИНН должен быть длинной 10 символов';
      });
      return;
    }

    if (!_titleController.text.isNotBlank) {
      setState(() {
        errorMessage = 'Название организации не должно быть пустым';
      });
      return;
    }

    final userUpdate = UserUpdate(
      fio: _fcsController.text,
      phone: widget.user.phone,
      address: _addressController.text,
      imageUrl: widget.user.imageUrl,
      description: widget.user.description,
    );

    try {
      await ref.read(userServiceProvider).updateUser(userUpdate);
      if (widget.user.company == null) {
        final company = CompanyCreate(
            name: _titleController.text.trim(), inn: _innController.text);
        await ref.read(companyServiceProvider).createCompany(company);
      } else {
        final company = CompanyUpdate(
            name: _titleController.text, inn: _innController.text);
        await ref
            .read(companyServiceProvider)
            .updateCompany(company, widget.user.company!.id);
      }
      final user = ref.read(userServiceProvider).getUser(widget.user.id);
      if (context.mounted) Navigator.of(context).pop(user);
    } catch (e) {
      setState(() => errorMessage = e.toString());
    }
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
                  maxLines: 3,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(255),
                  ],
                ),
                PrimaryTextField(
                  textEditingController: _fcsController,
                  label: 'Руководитель ${S.of(context).FCs}',
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
                  hintText: '1234567890',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                if (errorMessage != null) ...[
                  SelectableText(
                    errorMessage!,
                    style: TextStyle(color: colorScheme.error),
                  ),
                ],
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
