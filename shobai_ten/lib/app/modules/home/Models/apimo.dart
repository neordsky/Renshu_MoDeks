class apimo {
  String Id;
  String User;
  String Passsword;
  String Ava;
  String Ema;
  apimo(this.Id, this.User, this.Passsword, this.Ava, this.Ema);
  factory apimo.fromJson(Map<String, dynamic> json) {
    return apimo(json['id'], json['last_name'], json['first_name'],
        json['avatar'], json['email']);
  }
}
