import 'package:flutter/material.dart';
import 'package:jiken/Model/UserMo.dart';

class UserPro extends ChangeNotifier {
  List<UserMo> li = [];
  List<UserMo> get Data => li;

  void addata(int Id, String Alamat, String Username, String Password) {
    li.add(UserMo(Id, Alamat, Username, Password));
    notifyListeners();
  }

  void deldata(int id) {
    li.removeWhere((element) => element.id == id);
  }
}
