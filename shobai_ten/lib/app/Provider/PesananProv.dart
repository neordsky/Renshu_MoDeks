import 'package:flutter/material.dart';
import 'package:shobai_ten/app/modules/home/Models/Model1.dart';
import 'package:shobai_ten/app/modules/home/Models/NotiProModel.dart';

class PeProv extends ChangeNotifier {
  List<NoProMo> Da = [];
  List<NoProMo> get Data => Da;

  void AddData(String Kb, String Naba, String Img, int Haba, int Quan,
      String IdTra) {
    Da.add(NoProMo(Naba, Kb, Img, Haba, Quan, IdTra));
  }

  void DelData(String IdTra) {
    Da.removeWhere((element) => element.IdTran == IdTra);
  }
}
