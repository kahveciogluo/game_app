import 'dart:io';
import 'package:dio/dio.dart';
import 'package:game_app/models/base_model.dart';

enum RequestType { get, post, put, delete }

/// MARK: Servis isteklerinin yönetileceği generic network katmanı
class ServiceManager {
  static ServiceManager? _instance;
  static ServiceManager get instance {
    if (_instance != null) return _instance!;
    _instance = ServiceManager._init();
    return _instance!;
  }

  // Base Url
  final String _baseUrl = 'https://api.rawg.io/api/';

  // Api Key
  final String _apiKey = 'aa4d9b529449462ea854261e8e20f430';

  late final Dio _dio;

  ServiceManager._init() {
    final baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        return handler.next(e);
      },
    ));
  }

  Future<dynamic> apiCall<T extends IBaseModel>(
      String path, T model, RequestType requestType) async {
    late Response response;
    final String url = '$path?key=$_apiKey';

    try {
      switch (requestType) {
        case RequestType.get:
          {
            response = await _dio.get(url);

            switch (response.statusCode) {
              case HttpStatus.ok:
                final responseBody = response.data;

                if (responseBody is List) {
                  return responseBody.map((e) => model.fromJson(e)).toList();
                } else if (responseBody is Map) {
                  return model.fromJson(responseBody.map((key, value) =>
                      MapEntry<String, dynamic>(key.toString(), value)));
                }
                return responseBody;

              default:
            }
          }

        /// MARK: Uygulamada post, put, delete olmamasına karşın tanımlamalar yapılmıştır.
        case RequestType.post:
          {
            response = await _dio.post(url);
            break;
          }

        case RequestType.put:
          {
            response = await _dio.put(url);
            break;
          }
        case RequestType.delete:
          {
            response = await _dio.delete(url);
            break;
          }

        default:
      }
    } catch (e) {
      return e.toString();
    }
  }
}
