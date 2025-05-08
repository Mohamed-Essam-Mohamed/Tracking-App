class ForgetRequestDto {
  String emial;
  ForgetRequestDto(this.emial);
  Map<String, dynamic> toJson() => {'email': emial};
}
