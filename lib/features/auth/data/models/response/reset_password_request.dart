class ResetPasswordRequest {
  const ResetPasswordRequest({required this.email, required this.password});
  final String email;
  final String password;
  Map<String, dynamic> toJson() => {"email": email, "newPassword": password};
}
