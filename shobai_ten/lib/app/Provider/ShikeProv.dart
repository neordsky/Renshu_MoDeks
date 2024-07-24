import 'package:flutter/foundation.dart';
import 'package:shobai_ten/app/modules/home/Models/ModelShike.dart';

class ShikeProv extends ChangeNotifier {
  List<Shike> DataShike = [];
  List<Shike> get Alldata => DataShike;
  int get Jumlah {
    var Kesan = 0;
    DataShike.forEach((element) {
      Kesan += element.Haba * element.quanty;
    });
    return Kesan;
  }

  void Adddata(String Naba, String Kode, String Img, int Haba, int quanty) {
    DataShike.add(Shike(Naba, Kode, Img, Haba, quanty));
  }

  void DeleteData(String Kode) {
    DataShike.removeWhere((element) => element.Kode == Kode);
  }
}
