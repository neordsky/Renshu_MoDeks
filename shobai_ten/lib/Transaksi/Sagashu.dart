import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shobai_ten/Transaksi/KeranjangPage.dart';
import 'package:shobai_ten/Transaksi/Produkdetail.dart';
import 'package:shobai_ten/app/modules/home/Models/ProdukModel.dart';
import 'package:shobai_ten/app/modules/home/Models/UserMo.dart';
import 'package:shobai_ten/app/modules/home/views/Layar%20Keranjang/Populer.dart';
import 'package:shobai_ten/app/modules/home/views/Layar%20Keranjang/Terbaru.dart';
import 'package:shobai_ten/app/modules/home/views/Layar%20Keranjang/Terkait.dart';
import 'package:http/http.dart' as http;

class Sagashu extends StatefulWidget {
  Sagashu(this.Recoen);
  String Recoen;
  @override
  State<Sagashu> createState() => _SagashuState();
}

TextEditingController kotoba = TextEditingController();

class _SagashuState extends State<Sagashu> {
  static List<ProdukMo> LIDA = [];
  bool _loadi = true;
  Future<List<ProdukMo>> Yi() async {
    final resp =
        await http.get(Uri.parse('http://10.0.2.2:2000/api/product/get'));
    var data = jsonDecode(resp.body);
    List<ProdukMo> Lis =
        List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
    return Lis;
  }

  void Er() async {
    final dat = await Yi();
    setState(() {
      LIDA = dat;
    });
  }

  // Future<List<ProdukMo>> Get() async {
  //   final res =
  //       await http.get(Uri.parse("http://10.0.2.2:2000/api/product/get"));
  //   if (res.statusCode == 200) {
  //     setState(() {});
  //   }
  //   var data = jsonDecode(res.body);
  //   List<ProdukMo> Li =
  //       List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
  //   return Li;
  // }

  // void Getu() async {
  //   final datas = await Get();
  //   setState(() {
  //     Data = datas;
  //   });
  //}

  List<ProdukMo> Us = List.from(LIDA);
  void check(String Naba) {
    setState(() {
      Us = LIDA
          .where((element) =>
              element.Nama_Barang.toString().toLowerCase().contains(Naba))
          .toList();

      _loadi = false;
    });
  }

  List<String> Recom = [
    'Tereleye -Hoshi',
    'Nuclear of power',
    'Tereleye -Rain',
    'Partikel of mind'
  ];
  int ind = 0;
  // List<Widget> Kai = [
  //   new PageTerkait(kotoba.text),
  //   new PageTerbaru(kotoba.text),
  //   new PagePopuler(kotoba.text),
  // ];
  @override
  void initState() {
    Yi();
    Er();

    check(widget.Recoen);
    // TODO: implement initState
    super.initState();
    kotoba.text = widget.Recoen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
              )),
            ],
          ),
          (kotoba.text.isEmpty)
              ? ClipPath(
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    height: MediaQuery.of(context).size.height * 1,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: Recom.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              subtitle: InkWell(
                            onTap: () {
                              setState(() {
                                kotoba.text = Recom[index];
                                check(Recom[index]);
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: double.infinity,
                              color: const Color.fromARGB(255, 206, 202, 202),
                              child: Row(
                                children: [Text(Recom[index])],
                              ),
                            ),
                          ));
                        }),
                  ),
                )
              : Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                  ),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: (_loadi == true)
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.deepPurple,
                          ),
                        )
                      : (Us.length == 0)
                          ? Center(
                              child: Text(
                                "Data Not Found..!",
                                style: TextStyle(fontSize: 25),
                              ),
                            )
                          : GridView.builder(
                              itemCount: Us.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 2,
                                      crossAxisSpacing: 2),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (contr) {
                                        return ProdukDetail(
                                            Us[index].Nama_Barang,
                                            Us[index].Kode_Barang.toString(),
                                            Us[index].Image,
                                            Us[index].Harga_Barang,
                                            Us[index].Jumlah_Barang);
                                      }), (route) => false);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.28,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          color: Colors.grey,
                                          child: GridTile(
                                            child: Image.network(
                                              "http://10.0.2.2:2000/image/${Us[index].Image}",
                                              fit: BoxFit.cover,
                                            ),
                                            footer: GridTileBar(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 212, 206, 206),
                                              title:
                                                  Text(Us[index].Nama_Barang),
                                              subtitle: Text(
                                                "Rp." +
                                                    Us[index]
                                                        .Harga_Barang
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors
                                                        .deepPurpleAccent),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                ),
          Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: ListTile(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back)),
              subtitle: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: TextField(
                  onChanged: (value) => check(value),
                  onEditingComplete: () {
                    print(Us.length);
                    check(kotoba.text);
                  },
                  controller: kotoba,
                  decoration: InputDecoration(hintText: 'Search..'),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return KeranjangPage();
                    }));
                  },
                  icon: Icon(Icons.shopping_cart)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 255, 255),
          )
        ],
      ),
    );
  }
}
