class ResetPasswordRequest {
  String email;
  String password;
  ResetPasswordRequest({required this.email, required this.password});
  Map<String, dynamic> toJson() => {"email": email, "newPassword": password};
}
