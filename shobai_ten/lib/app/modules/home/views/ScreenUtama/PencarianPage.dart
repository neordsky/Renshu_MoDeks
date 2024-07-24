import 'dart:convert';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shobai_ten/app/modules/home/Models/ProdukModel.dart';
import 'package:shobai_ten/JenisPro/Alat.dart';
import 'package:shobai_ten/JenisPro/Allpro.dart';
import 'package:shobai_ten/JenisPro/BukuPage.dart';
import 'package:shobai_ten/Transaksi/KeranjangPage.dart';
import 'package:shobai_ten/JenisPro/MakananPage.dart';
import 'package:shobai_ten/JenisPro/Minuman.dart';
import 'package:shobai_ten/Transaksi/Produkdetail.dart';
import 'package:shobai_ten/Transaksi/Sagashu.dart';
import 'package:http/http.dart' as http;

class PencarianPage extends StatefulWidget {
  const PencarianPage({super.key});

  @override
  State<PencarianPage> createState() => _PencarianPageState();
}

class _PencarianPageState extends State<PencarianPage> {
  bool kai = false;
  bool load = true;
  List GridPro = [];
  List<ProdukMo> LiD = [];
  int inde = 0;
  Future<List<ProdukMo>> Get() async {
    final resp =
        await http.get(Uri.parse('http://10.0.2.2:2000/api/product/get'));
    if (resp.statusCode == 200) {
      setState(() {
        load = false;
      });
    }
    var data = jsonDecode(resp.body);
    List<ProdukMo> li =
        List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
    return li;
  }

  void Get2() async {
    final datas = await Get();
    setState(() {
      LiD = datas;
    });
  }

  int Yi = 0;
  int er = 0;
  int san = 0;
  int shi = 0;
  List Recomended = [
    "Tereleye -Bulan",
    "Mahou Dougu",
    "Takoyaki Misame",
    "Ocha Cola"
  ];
  List img = [
    "assets/gam2.jpg",
    "assets/gam3.jpg",
    "assets/gam4.jpg",
    "assets/gam5.jpg"
  ];
  @override
  void initState() {
    Get();
    Get2();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ///LAYAR UTAMA
        ///
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.3,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "O Susume",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                ///PILIHAN PENCARIAN
                ///
                ///
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: Colors.white12,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: Recomended.length,
                      itemBuilder: (context, index) {
                        print(Recomended.length);

                        return Padding(
                            padding: EdgeInsets.only(
                                top: 5, right: 5, left: 5, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Sagashu(Recomended[index]);
                                }));
                              },
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: const Color.fromARGB(26, 95, 93, 93),
                                  child: ListTile(
                                      title: Text(
                                    Recomended[index],
                                  ))),
                            ));
                      }),
                ),
                SizedBox(
                  height: 20,
                ),

                ///PRODUK RANDOM
                ///
                ///
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Hokano Sakuhin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                (load == true)
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.deepPurple,
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 13,
                                      mainAxisExtent: 90,
                                      mainAxisSpacing: 13),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                Yi = Random().nextInt(LiD.length);
                                return OutlinedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                const Color.fromARGB(
                                                    255, 214, 211, 211))),
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (context) {
                                        return ProdukDetail(
                                            LiD[Yi].Nama_Barang,
                                            LiD[Yi].Kode_Barang.toString(),
                                            LiD[Yi].Image,
                                            LiD[Yi].Harga_Barang,
                                            LiD[Yi].Jumlah_Barang);
                                      }), (route) => false);
                                    },
                                    child: Container(
                                        height: 100,
                                        width: 200,
                                        child: GridTileBar(
                                          title: Text(
                                            LiD[Yi].Nama_Barang,
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          subtitle: Text(
                                            LiD[Yi].Harga_Barang.toString(),
                                            style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15),
                                          ),
                                          leading: Container(
                                            height: 100,
                                            width: 70,
                                            color: Colors.grey,
                                            child: Image.network(
                                              'http://10.0.2.2:2000/image/${LiD[Yi].Image}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )));
                              }),
                        )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "O Shumi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: Column(
                    children: [
                      CardTwo("Makanan", "assets/gam12.jpg", MakananPage(),
                          "Minuman", "assets/gam11.jpg", MinumanPage()),
                      CardTwo("Alat", "assets/gam14.jpg", AlatPage(), "Buku",
                          "assets/gam13.jpg", BukuPage())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        ///APP BAR PENCARIAN///APPBAR PENCARIAN
        ///
        ///
        Container(
            margin: EdgeInsets.only(top: 40),
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 280,
                  child: TextFormField(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (cont) {
                        return Sagashu('');
                      }));
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Sagashu",
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (cont) {
                        return KeranjangPage();
                      }));
                    },
                    icon: Icon(Icons.shopping_cart))
              ],
            ))
      ],
    ));
  }
}

class CardTwo extends StatelessWidget {
  String NaCard;
  String Imag;
  Widget naur;
  String NaCard2;
  String Imag2;
  Widget Ur2;
  CardTwo(@required this.NaCard, @required this.Imag, @required this.naur,
      @required this.NaCard2, @required this.Imag2, @required this.Ur2);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return naur;
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.blueAccent,
                child: GridTile(
                    child: Image.asset(
                      Imag,
                      fit: BoxFit.cover,
                    ),
                    footer: Center(
                      child: GridTileBar(
                        title: Text(NaCard,
                            style: TextStyle(color: Colors.deepPurpleAccent)),
                        backgroundColor: Color.fromARGB(255, 224, 214, 226),
                      ),
                    )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Ur2;
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors.blueAccent,
                child: GridTile(
                    child: Image.asset(
                      Imag2,
                      fit: BoxFit.cover,
                    ),
                    footer: GridTileBar(
                      backgroundColor: Color.fromARGB(255, 206, 190, 209),
                      title: Center(
                          child: Text(
                        NaCard2,
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      )),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
