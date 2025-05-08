class VerifyCodeRequest {
  String resetCode;

  VerifyCodeRequest({required this.resetCode});

  Map<String, dynamic> toJson() => {"resetCode": resetCode};
}
