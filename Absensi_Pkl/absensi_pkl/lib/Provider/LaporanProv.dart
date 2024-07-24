import 'package:absensi_pkl/Model/ModelLaporan.dart';
import 'package:flutter/material.dart';

class LaporanProv extends ChangeNotifier {
  List<ModelLaporan> Li = [];
  List<ModelLaporan> get Data => Li;

  int get IndLap {
    var kesan = 0;
    Li.forEach((element) {
      kesan += element.IndexLaporan + 1;
    });
    return kesan;
  }

  void AddData(int IndexLaporan, String IsiLaporan, String Datetime) {
    Li.add(ModelLaporan(IndexLaporan, IsiLaporan, Datetime));
  }

  void DeleteData(int IndexLaporan) {
    Li.removeWhere((element) => element.IndexLaporan == IndexLaporan);
  }
}
