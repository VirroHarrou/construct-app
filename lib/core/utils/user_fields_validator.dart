String? userFieldsValidator({
  String? inn,
  String? fio,
  String? address,
}) {
  if (fio != null &&
      !RegExp(r'^[А-ЯЁ][а-яё]+ [А-ЯЁ][а-яё]+ [А-ЯЁ][а-яё]+$').hasMatch(fio)) {
    return 'Заполните ФИО в соотвествии с подсказкой!';
  }
  if (address != null && address.isEmpty) {
    return 'Адресс не должен быть пустым!';
  }
  if (inn != null && !RegExp(r'^[0-9]{12,12}').hasMatch(inn)) {
    return 'ИНН должен быть длинной 12 цифр!';
  }
  return null;
}
