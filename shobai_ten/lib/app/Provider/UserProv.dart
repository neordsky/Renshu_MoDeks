import 'package:flutter/material.dart';
import 'package:shobai_ten/app/modules/home/Models/UserMo.dart';

class UserProv extends ChangeNotifier {
  Map<String, UserProMo> Data = {};
  Map<String, UserProMo> get alldata => Data;

  void adddata(String Username, int Id, String Password, String Alamat) {
    Data.putIfAbsent(
        Id.toString(), () => UserProMo(Username, Id, Password, Alamat));
    notifyListeners();
  }

  void Upda(int Id, String Username, String Password, String Alamat) {
    Data.update(Id.toString(),
        (value) => UserProMo(Username, value.Id, Password, Alamat));
    notifyListeners();
  }

  void DeData(int Id) {
    Data.removeWhere((key, value) => value.Id == Id);
  }
}

class UserTo extends ChangeNotifier {
  List<UserMo> Li = [];
  List<UserMo> get Data => Li;

  void adddata(var Tokens) {
    Li.add(UserMo(Tokens));
    notifyListeners();
  }
}
