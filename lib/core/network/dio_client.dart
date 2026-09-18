import 'package:dio/dio.dart';


class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options
          .baseUrl = 'https://dummyjson.com/' // Replace with your base URL
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.responseType = ResponseType.json
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  }

  Future<Response> get(String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /**
   * Comparison: Why use AsyncNotifierProvider then?
      If you don't use AsyncNotifierProvider, you have to manually manage the "Loading" state of the button yourself
      (e.g., with a local isLoading variable or a StateProvider).

      Without AsyncNotifier (Manual):

      1.You call ref.read(repositoryProvider).addCategory().
      2.You manually ref.invalidate(fetchProvider) to refresh the list.
      3.You manually handle the loading spinner state.


      With AsyncNotifier (Automated):

      1.The Notifier manages the AsyncValue of the mutation itself.
      2.The UI can "watch" the Notifier to show a loading state on the button automatically.
      3.The Notifier can internalize the ref.invalidate logic.

      Summary:
      •Reading: Use FutureProvider.
      •Mutations (Simple): Call the Repository directly from the UI + ref.invalidate.
      •Mutations (Robust): Use AsyncNotifierProvider to manage the lifecycle of the "Write" operation.
   *
   */

  // POST
  Future<Response> post(String url, {
    dynamic data, // The body of the request
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      rethrow;
    }
  }

  // PUT
  Future<Response> put(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      rethrow;
    }
  }

  // DELETE
  Future<Response> delete(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      rethrow;
    }
  }
}