import 'package:construct/domain/entities/company/company.dart';
import 'package:construct/domain/failures/api_failure.dart';
import 'package:construct/services/api/api_service.dart';
import 'package:construct/services/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final companyServiceProvider = Provider<CompanyService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return CompanyService(apiService);
});

class CompanyService {
  final ApiService _api;

  CompanyService(this._api);

  Future<Company> createCompany(CompanyCreate company) async {
    try {
      final response = await _api.post('/companies/', data: company.toJson());
      return Company.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  Future<Company> updateCompany(CompanyUpdate company, String companyId) async {
    try {
      final response =
          await _api.put('/companies/$companyId', data: company.toJson());
      return Company.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleApiError(e);
    }
  }

  ApiFailure _handleApiError(DioException e) {
    if (e.error is ApiFailure) return e.error as ApiFailure;
    return ApiErrorHandler.handleDioError(e);
  }
}
