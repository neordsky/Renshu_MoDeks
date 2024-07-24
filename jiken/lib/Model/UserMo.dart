class UserMo {
  int id;
  String alamat;
  String username;
  String password;

  UserMo(this.id, this.alamat, this.username, this.password);

  factory UserMo.fromJson(Map<String, dynamic> json) {
    return UserMo(
        json['Id'], json['Alamat'], json['Username'], json['Password']);
  }
}
