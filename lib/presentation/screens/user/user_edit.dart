import 'package:construct/core/utils/user_fields_validator.dart';
import 'package:construct/domain/entities/user/user.dart';
import 'package:construct/generated/l10n.dart';
import 'package:construct/presentation/widgets/image_uploader/image_uploader.dart';
import 'package:construct/presentation/widgets/primary_text_field.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserEditView extends ConsumerStatefulWidget {
  final User user;

  static const routeName = '/user/edit';

  const UserEditView(this.user, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UserEditState();
}

class UserEditState extends ConsumerState<UserEditView> {
  final fioController = TextEditingController();
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  String? imageUrl;
  String? errorMessage;
  bool isUpdating = false;
  bool changed = false;

  @override
  void initState() {
    fioController.text = widget.user.fio;
    descriptionController.text = widget.user.description ?? '';
    addressController.text = widget.user.address;
    imageUrl = widget.user.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Column(
                  spacing: 3,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Редактор профиля',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primary,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Внесите данные о себе.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                PrimaryTextField(
                  textEditingController: fioController,
                  onChanged: (p0) => setState(() => changed = true),
                  label: S.of(context).FCs,
                  hintText: 'Жуков Максим Леонидович',
                ),
                PrimaryTextField(
                  textEditingController: descriptionController,
                  label: S.of(context).description,
                  onChanged: (p0) => setState(() => changed = true),
                  hintText:
                      'Опишите себя, то чем занимаетесь, то что хотите получить.',
                  maxLines: 5,
                  maxLength: 128,
                ),
                PrimaryTextField(
                  textEditingController: addressController,
                  onChanged: (p0) => setState(() => changed = true),
                  label: S.of(context).address,
                  hintText: 'ул. Угличская, д. 155, г. Ярославль',
                ),
                ImageUploader(
                  imageUrl: imageUrl,
                  label: S.of(context).photo,
                  height: 128,
                  onImageUploaded: (value) {
                    imageUrl = value;
                    setState(() => changed = true);
                  },
                ),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: colorScheme.error),
                  ),
                isUpdating
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          disabledBackgroundColor:
                              Theme.of(context).disabledColor,
                        ),
                        onPressed: changed
                            ? () {
                                errorMessage = userFieldsValidator(
                                  fio: fioController.text,
                                  address: addressController.text,
                                );
                                setState(() {});
                                if (errorMessage == null) _updateUser();
                              }
                            : null,
                        child: Text(
                          S.of(context).saveChanges,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  Future<void> _updateUser() async {
    setState(() => isUpdating = true);
    final userUpdate = UserUpdate(
      fio: fioController.text,
      address: addressController.text,
      description: descriptionController.text.isNotEmpty
          ? descriptionController.text
          : null,
      phone: widget.user.phone,
      imageUrl: imageUrl,
    );
    try {
      final user = await ref.read(userServiceProvider).updateUser(userUpdate);
      if (context.mounted) Navigator.of(context).pop(user);
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isUpdating = false;
      });
    }
  }
}
