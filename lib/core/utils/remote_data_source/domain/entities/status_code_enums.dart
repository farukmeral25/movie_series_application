// ignore_for_file: constant_identifier_names

import 'package:movie_series_application/core/_core_exports.dart';

enum StatusCodeEnums {
  StatusCode200, //* OK
  StatusCode201, //* Created
  StatusCode204, //* No Content
  StatusCode400, //* Bad Request
  StatusCode401, //* Unauthorized
  StatusCode403, //* Forbidden
  StatusCode404, //* Not Found
  StatusCode500, //* Internal Exception
  StatusCode504, //* Gateway TimeOut
}

extension StatusCodeEnumsExtension on StatusCodeEnums {
  StatusCodeEnums statusCodeToEnum(int statusCode) {
    switch (statusCode) {
      case 200:
        return StatusCodeEnums.StatusCode200;
      case 201:
        return StatusCodeEnums.StatusCode201;
      case 204:
        return StatusCodeEnums.StatusCode204;
      case 400:
        return StatusCodeEnums.StatusCode400;
      case 401:
        return StatusCodeEnums.StatusCode401;
      case 403:
        return StatusCodeEnums.StatusCode403;
      case 404:
        return StatusCodeEnums.StatusCode404;
      case 500:
        return StatusCodeEnums.StatusCode500;
      case 504:
        return StatusCodeEnums.StatusCode504;
      default:
        return StatusCodeEnums.StatusCode404;
    }
  }

  Failure? stateToFailure() {
    switch (this) {
      case StatusCodeEnums.StatusCode400:
        return BadRequestFailure();
      case StatusCodeEnums.StatusCode401:
        return UnauthorizedFailure();
      case StatusCodeEnums.StatusCode403:
        return ForbiddenFailure();
      case StatusCodeEnums.StatusCode404:
        return NotFoundFailure();
      case StatusCodeEnums.StatusCode500:
        return InternalFailure();
      case StatusCodeEnums.StatusCode504:
        return GatewayTimeOutFailure();
      case StatusCodeEnums.StatusCode200:
        return null;
      case StatusCodeEnums.StatusCode204:
        return null;
      case StatusCodeEnums.StatusCode201:
        return null;
    }
  }

  bool isSuccess() {
    switch (this) {
      case StatusCodeEnums.StatusCode200:
        return true;
      case StatusCodeEnums.StatusCode201:
        return true;
      case StatusCodeEnums.StatusCode204:
        return true;
      case StatusCodeEnums.StatusCode400:
        return false;
      case StatusCodeEnums.StatusCode401:
        return false;
      case StatusCodeEnums.StatusCode403:
        return false;
      case StatusCodeEnums.StatusCode404:
        return false;
      case StatusCodeEnums.StatusCode500:
        return false;
      case StatusCodeEnums.StatusCode504:
        return false;
    }
  }
}
