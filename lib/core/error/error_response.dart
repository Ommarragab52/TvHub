class ErrorResponse {
  final String? statusMessage;

  ErrorResponse({this.statusMessage});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusMessage: json['status_message'],
    );
  }
}
