class UserMo {
  var Token;

  UserMo(this.Token);
}

class UserProMo {
  String Username;
  int Id;
  String Password;
  String Alamat;
  UserProMo(this.Username, this.Id, this.Password, this.Alamat);
  factory UserProMo.fromjson(Map<String, dynamic> json) {
    return UserProMo(
        json['Username'], json['Id'], json['Password'], json['Alamat']);
  }
}
