import 'dart:io';

import 'package:dio/dio.dart';

final dio = Dio()
  ..interceptors.add(InterceptorsWrapper(onError: ((e, handler) {
    if (e.error is SocketException) {
      return handler.next(DioError(
          requestOptions: e.requestOptions,
          response: e.response,
          type: e.type,
          error: e.error));
    }
  })));

