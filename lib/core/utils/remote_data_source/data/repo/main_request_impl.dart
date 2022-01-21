import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_series_application/core/_core_exports.dart';

class MainRequestImpl implements BaseRequestRepository {
  late final Dio _client;
  final String domainUrl = DomainResourceEnum.GOOGLEMAP.getUrlByState();

  MainRequestImpl(
    this._client,
  ) {
    _client.options.baseUrl = domainUrl;
  }

  @override
  Future<Either<Failure, String>> basePost({
    required Map<String, dynamic> requestBody,
    required MainEndpoints endPoint,
  }) async {
    Map<String, String> headers = {};

    return await _errorHandler(
      _client.post(
        endPoint.stateToEndpoint(),
        data: jsonEncode(requestBody),
        options: Options(
          headers: headers,
          responseType: ResponseType.plain,
          contentType: "application/json",
          method: "POST",
          validateStatus: (_) => true,
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, String>> baseGet({
    required MainEndpoints endPoint,
  }) async {
    Map<String, String> headers = {};
    headers["Content-Type"] = "application/json";
    return await _errorHandler(
      _client.get(
        endPoint.stateToEndpoint(),
        options: Options(
          headers: headers,
          responseType: ResponseType.plain,
          contentType: "application/json",
          validateStatus: (_) => true,
        ),
      ),
    );
  }

  Future<Either<Failure, String>> _errorHandler(Future<Response> requestFunction) async {
    Response response;
    try {
      response = await requestFunction;
    } on SocketException {
      throw NoInternetConnectionException();
    }

    return await _handleResponse(response);
  }

  Future<Either<Failure, String>> _handleResponse(Response response) async {
    StatusCodeEnums statusCodeEnum = StatusCodeEnums.StatusCode200;
    statusCodeEnum = statusCodeEnum.statusCodeToEnum(response.statusCode!);

    if (statusCodeEnum.isSuccess()) {
      return Right(response.data);
    } else {
      throw statusCodeEnum.stateToFailure()!;
    }
  }
}
