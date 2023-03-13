class UserModel {
  String? email;
  String? password;

  UserModel({
     this.email,
     this.password,
  });

  Map<String, dynamic> toJson() => {
    'email':email,
    'password':password,
  };
}