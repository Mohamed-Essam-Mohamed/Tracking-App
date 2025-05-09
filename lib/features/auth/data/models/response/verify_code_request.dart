class VerifyCodeRequest {
  const VerifyCodeRequest({required this.resetCode});
  final String resetCode;

  Map<String, dynamic> toJson() => {"resetCode": resetCode};
}
