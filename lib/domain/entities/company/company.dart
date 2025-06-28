import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.g.dart';
part 'company.freezed.dart';

@freezed
sealed class Company with _$Company {
  factory Company({
    String? id,
    String? title,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
