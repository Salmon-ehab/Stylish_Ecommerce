abstract class ApiConsumer {
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
    bool isFormData = true,
    required bool isProtected,
  });
  post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false});
  get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isProtected = false});
  patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
    bool isFormData = true,
  });

  Future<dynamic> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false});
}

