import 'package:flutter/foundation.dart';
import 'package:shobai_ten/app/modules/home/Models/Model1.dart';

class KeranjangProv extends ChangeNotifier {
  List<KeranjangModel> DataKeranjang = [];
  List<KeranjangModel> get Alldata => DataKeranjang;

  void Adddata(String Naba, String Kode, String Img, int Haba, int quanty) {
    DataKeranjang.add(KeranjangModel(Naba, Kode, Img, Haba, quanty));
  }

  void DeleteData(String Kode) {
    DataKeranjang.removeWhere((element) => element.Kode == Kode);
  }
}
