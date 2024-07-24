import 'package:flutter/material.dart';

class KeranMo extends ChangeNotifier {
  int Kb;
  String Naba;
  int Haba;
  int quantity;
  int totaba;
  String Jebba;
  String Img;
  bool chec = false;
  KeranMo(this.Kb, this.Naba, this.Haba, this.quantity, this.totaba, this.Jebba,
      this.Img);
  void Sitw() {
    chec = !chec;
  }
}
