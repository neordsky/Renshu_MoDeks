import 'package:flutter/material.dart';
import 'package:jiken/Model/KeranjaMo.dart';

class KeranPro extends ChangeNotifier {
  List<KeranMo> Da = [];
  List<KeranMo> get Data => Da;

  int get JumTol {
    var kesan = 0;
    Da.forEach((element) {
      kesan += element.Haba * element.quantity;
    });
    return kesan;
  }

  void adddata(int Kb, String Naba, int Haba, int quantity, int totaba,
      String Jebba, String Img) {
    Da.add(KeranMo(Kb, Naba, Haba, quantity, totaba, Jebba, Img));
    notifyListeners();
  }

  void delda(int Kb) {
    Da.removeWhere((element) => element.Kb == Kb);
    notifyListeners();
  }
}
