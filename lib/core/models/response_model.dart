class ResponseModel {
  final bool status;
  final String message;

  ResponseModel({required this.status, required this.message});

  factory ResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return ResponseModel(
      status: jsonData["status"] ?? false,
      message: jsonData["message"] ?? '',
    );
  }
}
