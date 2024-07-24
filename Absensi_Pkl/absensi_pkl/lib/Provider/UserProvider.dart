import 'package:absensi_pkl/Model/modeluser.dart';
import 'package:flutter/material.dart';

class UserProv extends ChangeNotifier {
  List<UserModel> Li = [];
  List<UserModel> get Data => Li;

  void Adddata(String username, int id, String alamat, String password) {
    Li.add(UserModel(id, alamat, username, password));
  }
}
