import 'dart:ffi';

class ProdukMo {
  int Kode_Barang;
  String Nama_Barang;
  int Harga_Barang;
  int Jumlah_Barang;
  String Image;
  ProdukMo(this.Kode_Barang, this.Nama_Barang, this.Harga_Barang,
      this.Jumlah_Barang, this.Image);
  factory ProdukMo.fromjson(Map<String, dynamic> json) {
    return ProdukMo(json['Kode_Barang'], json['Nama_Barang'],
        json['Harga_Barang'], json['Jumlah_Barang'], json['Image']);
  }
}

class ProMo2 {
  int Kode_Barang;
  String Nama_Barang;
  int Harga_Barang;
  int Jumlah_Barang;
  String Image;
  ProMo2(this.Kode_Barang, this.Nama_Barang, this.Harga_Barang,
      this.Jumlah_Barang, this.Image);
  factory ProMo2.fromjson(Map<String, dynamic> json) {
    return ProMo2(json['Kode_Barang'], json['Nama_Barang'],
        json['Harga_Barang'], json['Jumlah_Barang'], json['Image']);
  }
}
