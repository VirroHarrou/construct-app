import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';
part 'api_failure.g.dart';

@freezed
sealed class ApiFailure with _$ApiFailure {
  const factory ApiFailure.serverError([String? message]) = ServerError;
  const factory ApiFailure.validationErrors(
      List<ValidationErrorDetail> errors) = ValidationErrors;
  const factory ApiFailure.unauthorized() = Unauthorized;
  const factory ApiFailure.forbidden() = Forbidden;
  const factory ApiFailure.notFound() = NotFound;
  const factory ApiFailure.networkError() = NetworkError;
  const factory ApiFailure.conflict() = Conflict;
  const factory ApiFailure.other([String? message]) = Other;
}

@freezed
sealed class ValidationErrorDetail with _$ValidationErrorDetail {
  const factory ValidationErrorDetail({
    required List<String> loc,
    required String msg,
    required String type,
  }) = _ValidationErrorDetail;

  factory ValidationErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorDetailFromJson(json);
}
