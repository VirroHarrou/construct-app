// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiFailure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApiFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiFailure()';
  }
}

/// @nodoc

class ServerError implements ApiFailure {
  const ServerError([this.message]);

  final String? message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ApiFailure.serverError(message: $message)';
  }
}

/// @nodoc

class ValidationErrors implements ApiFailure {
  const ValidationErrors(final List<ValidationErrorDetail> errors)
      : _errors = errors;

  final List<ValidationErrorDetail> _errors;
  List<ValidationErrorDetail> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationErrors &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'ApiFailure.validationErrors(errors: $errors)';
  }
}

/// @nodoc

class Unauthorized implements ApiFailure {
  const Unauthorized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiFailure.unauthorized()';
  }
}

/// @nodoc

class Forbidden implements ApiFailure {
  const Forbidden();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Forbidden);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiFailure.forbidden()';
  }
}

/// @nodoc

class NotFound implements ApiFailure {
  const NotFound();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiFailure.notFound()';
  }
}

/// @nodoc

class NetworkError implements ApiFailure {
  const NetworkError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiFailure.networkError()';
  }
}

/// @nodoc

class Conflict implements ApiFailure {
  const Conflict();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Conflict);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiFailure.conflict()';
  }
}

/// @nodoc

class Other implements ApiFailure {
  const Other([this.message]);

  final String? message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Other &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ApiFailure.other(message: $message)';
  }
}

/// @nodoc
mixin _$ValidationErrorDetail {
  List<String> get loc;
  String get msg;
  String get type;

  /// Serializes this ValidationErrorDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationErrorDetail &&
            const DeepCollectionEquality().equals(other.loc, loc) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loc), msg, type);

  @override
  String toString() {
    return 'ValidationErrorDetail(loc: $loc, msg: $msg, type: $type)';
  }
}

/// @nodoc
@JsonSerializable()
class _ValidationErrorDetail implements ValidationErrorDetail {
  const _ValidationErrorDetail(
      {required final List<String> loc, required this.msg, required this.type})
      : _loc = loc;
  factory _ValidationErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorDetailFromJson(json);

  final List<String> _loc;
  @override
  List<String> get loc {
    if (_loc is EqualUnmodifiableListView) return _loc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loc);
  }

  @override
  final String msg;
  @override
  final String type;

  @override
  Map<String, dynamic> toJson() {
    return _$ValidationErrorDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValidationErrorDetail &&
            const DeepCollectionEquality().equals(other._loc, _loc) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_loc), msg, type);

  @override
  String toString() {
    return 'ValidationErrorDetail(loc: $loc, msg: $msg, type: $type)';
  }
}

// dart format on
