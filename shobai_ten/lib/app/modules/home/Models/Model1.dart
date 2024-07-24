import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class KeranjangModel extends ChangeNotifier {
  String Naba;
  String Kode;
  String Img;
  int Haba;
  int quanty;
  bool check = false;

  KeranjangModel(
    this.Naba,
    this.Kode,
    this.Img,
    this.Haba,
    this.quanty,
  );
  void Switch() {
    check = !check;
  }
}
