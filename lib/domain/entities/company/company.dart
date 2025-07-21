import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.g.dart';
part 'company.freezed.dart';

@freezed
sealed class Company with _$Company {
  factory Company({
    required String id,
    required String name,
    required String inn,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@freezed
sealed class CompanyCreate with _$CompanyCreate {
  factory CompanyCreate({
    required String name,
    required String inn,
  }) = _CompanyCreate;

  factory CompanyCreate.fromJson(Map<String, dynamic> json) =>
      _$CompanyCreateFromJson(json);
}

@freezed
sealed class CompanyUpdate with _$CompanyUpdate {
  factory CompanyUpdate({
    String? name,
    String? inn,
  }) = _CompanyUpdate;

  factory CompanyUpdate.fromJson(Map<String, dynamic> json) =>
      _$CompanyUpdateFromJson(json);
}
