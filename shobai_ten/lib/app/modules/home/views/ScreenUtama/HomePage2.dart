import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
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

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int Pageindex = 0;
  int buttomindex = 0;
  List<Widget> _Page = [
    new AllPro(),
    new MakananPage(),
    new MinumanPage(),
    new BukuPage(),
    new AlatPage(),
  ];
  bool _load = true;
  int PageSuu = 0;
  late final PageController PageCon;
  late final Timer caroul;
  Timer gettime() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (PageSuu == 4) {
        PageSuu = 0;
      }
      PageCon.animateToPage(PageSuu,
          duration: const Duration(seconds: 1), curve: Curves.bounceInOut);
      PageSuu++;
    });
  }

  List<ProdukMo> Product = [];
  Future<List<ProdukMo>> getapi2() async {
    try {
      final respo =
          await http.get(Uri.parse("http://10.0.2.2:2000/api/product/get"));
      if (respo.statusCode == 200) {
        setState(() {
          _load = false;
        });
      }
      var data = jsonDecode(respo.body);
      print(data.toString());

      List<ProdukMo> roduct =
          List<ProdukMo>.from(data['data'].map((e) => ProdukMo.fromjson(e)));

      return roduct;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void tsu() async {
    final res = await getapi2();
    setState(() {
      Product = res;
    });
  }

  int lengh = 14;

  @override
  void initState() {
    PageCon = PageController();
    caroul = gettime();
    tsu();
    getapi2();
    print(Product.length);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    PageCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Aplication'),
          centerTitle: true,
        ),
        body: (_load == true)
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 180),
                      height: MediaQuery.of(context).size.height * 3,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Tokubetsu",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            child: (_load == true)
                                ? Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.deepPurple,
                                    ),
                                  )
                                : PageView.builder(
                                    controller: PageCon,
                                    onPageChanged: (value) {
                                      PageSuu = value;
                                      setState(() {});
                                    },
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return AnimatedBuilder(
                                          animation: PageCon,
                                          builder: (context, child) {
                                            return child!;
                                          },
                                          child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                    return ProdukDetail(
                                                        Product[index]
                                                            .Nama_Barang,
                                                        Product[index]
                                                            .Kode_Barang
                                                            .toString(),
                                                        Product[index].Image,
                                                        Product[index]
                                                            .Harga_Barang,
                                                        Product[index]
                                                            .Jumlah_Barang);
                                                  }), (route) => false);
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Container(
                                                      height: 100,
                                                      width: 200,
                                                      color: Colors.amber,
                                                      child: GridTile(
                                                        child: Image.network(
                                                          "http://10.0.2.2:2000/image/${Product[index].Image}",
                                                          fit: BoxFit.cover,
                                                        ),
                                                        footer: Container(
                                                          width: 200,
                                                          height: 30,
                                                          color: Colors.black26,
                                                          child: Center(
                                                            child: Text(Product[
                                                                    index]
                                                                .Nama_Barang),
                                                          ),
                                                        ),
                                                      )),
                                                ),
                                              )));
                                    }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                5,
                                (index) => Container(
                                      margin: EdgeInsets.all(7),
                                      width: 8.0,
                                      child: Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: (PageSuu == index)
                                            ? Colors.deepPurple
                                            : Colors.white,
                                      ),
                                    )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Erabu Sakuhin",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),

                          ///BUTTON PILIHAN PRODUK///BUTTON PILIHAN PRODUK
                          ///
                          ///!!!
                          Container(
                              width: double.infinity,
                              height: 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                            height: 30,
                                            width: 150,
                                            color: Colors.white,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: OutlinedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return AllPro();
                                                    }));
                                                  },
                                                  icon: Icon(Icons.all_inbox),
                                                  label: Text("Zenbu")),
                                            )),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Container(
                                                height: 30,
                                                width: 150,
                                                color: Colors.white,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: OutlinedButton.icon(
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return MakananPage();
                                                          }));
                                                        },
                                                        icon: Icon(
                                                            Icons.food_bank),
                                                        label: Text(
                                                            "Tabemono")))))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Container(
                                                height: 30,
                                                width: 150,
                                                color: (buttomindex == 2)
                                                    ? Colors.purpleAccent
                                                    : Colors.white,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: OutlinedButton.icon(
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return MinumanPage();
                                                          }));
                                                        },
                                                        icon: Icon(
                                                            Icons.food_bank),
                                                        label: Text(
                                                            "Nomimono")))))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Container(
                                                height: 30,
                                                width: 150,
                                                color: Colors.white,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: OutlinedButton.icon(
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return BukuPage();
                                                          }));
                                                        },
                                                        icon: Icon(
                                                            Icons.food_bank),
                                                        label: Text("Hon")))))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Container(
                                                height: 30,
                                                width: 150,
                                                color: Colors.white,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: OutlinedButton.icon(
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return AlatPage();
                                                          }));
                                                        },
                                                        icon: Icon(
                                                            Icons.food_bank),
                                                        label:
                                                            Text("Dougu")))))),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),

                          ///RECOM PRODUK ///RECOM PRODUK
                          ///
                          ///
                          Container(
                              height: MediaQuery.of(context).size.height * 1.27,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      width: double.infinity,
                                      color: const Color.fromARGB(
                                          255, 192, 173, 173),
                                      child: Row(
                                        children: [
                                          Text(
                                            "O Susume No Sakuhin",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.2,
                                      width: double.infinity,
                                      child: Column(
                                          children: List.generate(5, (index) {
                                        int Yi = 1;
                                        Yi += 1;
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  CardProduk(
                                                      Product[index + Yi]
                                                          .Nama_Barang,
                                                      Product[index + Yi]
                                                          .Harga_Barang,
                                                      Product[index + Yi]
                                                          .Jumlah_Barang,
                                                      Product[index + Yi].Image,
                                                      Product[index + Yi]
                                                          .Kode_Barang
                                                          .toString()),
                                                  CardProduk(
                                                      Product[index + Yi + Yi]
                                                          .Nama_Barang,
                                                      Product[index + Yi + Yi]
                                                          .Harga_Barang,
                                                      Product[index + Yi + Yi]
                                                          .Jumlah_Barang,
                                                      Product[index + Yi + Yi]
                                                          .Image,
                                                      Product[index + Yi + Yi]
                                                          .Kode_Barang
                                                          .toString())
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }))),
                                ],
                              )),

                          ///RECOM PRODUK POPULER///RECOM PRODUK POPULER
                          ///
                          ///
                          Container(
                            color: Colors.redAccent,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Saikin Ninki Na Sakuhin",
                                  style: TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Motto Miru..",
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                            return ProdukDetail(
                                                Product[index].Nama_Barang,
                                                Product[index]
                                                    .Kode_Barang
                                                    .toString(),
                                                Product[index].Image,
                                                Product[index].Harga_Barang,
                                                Product[index].Jumlah_Barang);
                                          }), (route) => false);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            color: Colors.redAccent,
                                            child: GridTile(
                                              child: Image.network(
                                                "http://10.0.2.2:2000/image/${Product[index].Image}",
                                                fit: BoxFit.cover,
                                              ),
                                              footer: GridTileBar(
                                                title: Text(
                                                    Product[index].Nama_Barang),
                                                subtitle: Text(
                                                  Product[index]
                                                      .Harga_Barang
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),

                          ///RECOM PRODUK TERKENAL///RECOM PRODUK TERKENAL
                          ///
                          ///
                          Container(
                            color: Colors.purpleAccent,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Yumei Na Sakuhin",
                                  style: TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Motto Miru..",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 199, 185, 223)),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return ProdukDetail(
                                                  Product[index].Nama_Barang,
                                                  Product[index]
                                                      .Kode_Barang
                                                      .toString(),
                                                  Product[index].Image,
                                                  Product[index].Harga_Barang,
                                                  Product[index].Jumlah_Barang);
                                            }), (route) => false);
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              color: const Color.fromARGB(
                                                  255, 191, 144, 199),
                                              child: GridTile(
                                                child: Image.network(
                                                  "http://10.0.2.2:2000/image/${Product[index].Image}",
                                                  fit: BoxFit.cover,
                                                ),
                                                footer: GridTileBar(
                                                  title: Text(Product[index]
                                                      .Nama_Barang),
                                                  subtitle: Text(
                                                    Product[index]
                                                        .Harga_Barang
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors
                                                            .deepPurpleAccent),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ),

                  ///APP BAR WIDGET//APP BAR WIDGET
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Container(
                      width: double.infinity,
                      height: 170,
                      color: Colors.purpleAccent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: 240,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "Welcome To My App",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ))),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white30,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return KeranjangPage();
                                          }));
                                        },
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        )),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 270,
                                height: 50,
                                child: TextFormField(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Sagashu('');
                                      }));
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: "Sagashu",
                                        prefixIcon: Icon(Icons.search),
                                        fillColor: Colors.white,
                                        filled: true)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
