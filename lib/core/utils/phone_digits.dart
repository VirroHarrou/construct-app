String? extractPhoneDigits(String input) {
  final formatRegExp = RegExp(r'^\+7\(\d{3}\)\d{3}-\d{2}-\d{2}$');

  if (!formatRegExp.hasMatch(input)) {
    return null;
  }
  final digits = input.replaceAll(RegExp(r'\D'), '');
  return digits;
}
