import 'dart:convert';

class ProdukMo {
  int Kb;
  String Naba;
  int Haba;
  int Juba;
  String Jeba;
  String Img;
  ProdukMo(this.Kb, this.Naba, this.Haba, this.Juba, this.Jeba, this.Img);

  factory ProdukMo.fromJson(Map<String, dynamic> json) {
    return ProdukMo(
        json['Kode_Barang'],
        json['Nama_Barang'],
        json['Harga_Barang'],
        json['Jumlah_Barang'],
        json['Jenis'],
        json['Image']);
  }
}
