class SignUpUser {
  final int? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? image;
  final bool? isVerified;

  const SignUpUser({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.isVerified,
  });

  factory SignUpUser.fromJson(Map<String, dynamic> json) => SignUpUser(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    mobile: json['mobile'] as String?,
    image: json['image'] as String?,
    isVerified: json['is_verified'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'image': image,
    'is_verified': isVerified,
  };
}
