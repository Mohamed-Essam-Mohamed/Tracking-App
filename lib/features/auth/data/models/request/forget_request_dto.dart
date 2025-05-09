class ForgetRequestDto {
  const ForgetRequestDto(this.email);
  final String email;
  Map<String, dynamic> toJson() => {'email': email};
}
