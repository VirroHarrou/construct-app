import 'package:construct/services/api/api_service.dart';
import 'package:construct/services/api/review_service.dart';
import 'package:construct/services/dio_provider.dart';
import 'package:construct/services/token/token_storage_service.dart';
import 'package:construct/services/api/auth_service.dart';
import 'package:construct/services/api/user_service.dart';
import 'package:construct/services/api/order_service.dart';

final providers = [
  dioProvider,
  tokenStorageServiceProvider,
  apiServiceProvider,
  authServiceProvider,
  userServiceProvider,
  orderServiceProvider,
  reviewServiceProvider,
];
