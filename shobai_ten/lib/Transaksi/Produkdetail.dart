import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shobai_ten/Transaksi/Confir.dart';
import 'package:shobai_ten/Transaksi/TransaksiLanjut.dart';
import 'package:shobai_ten/app/Provider/KeranjangProv.dart';
import 'package:shobai_ten/app/modules/home/Models/ProdukModel.dart';
import 'package:shobai_ten/Transaksi/KeranjangPage.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/HomePage2.dart';
import 'package:shobai_ten/app/modules/home/views/home_view.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class ProdukDetail extends StatefulWidget {
  const ProdukDetail(@required this.Naba, @required this.Kode,
      @required this.Img, @required this.Haba, @required this.juba,
      {super.key});
  final String Naba;
  final String Kode;
  final String Img;
  final int Haba;
  final int juba;

  @override
  State<ProdukDetail> createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  List<ProdukMo> Lidata = [];
  bool _loadi = true;
  Future<List<ProdukMo>> Get() async {
    final res =
        await http.get(Uri.parse("http://10.0.2.2:2000/api/product/get"));
    if (res.statusCode == 200) {
      setState(() {
        _loadi = false;
      });
    }
    var data = jsonDecode(res.body);
    List<ProdukMo> Li =
        List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
    return Li;
  }

  void Getu() async {
    final datas = await Get();
    setState(() {
      Lidata = datas;
    });
  }

  int PageSuu = 0;
  late final PageController PageCon;
  @override
  void initState() {
    Get();
    Getu();
    // TODO: implement initState
    super.initState();
    PageCon = PageController(initialPage: 0, viewportFraction: 0.75);
  }

  @override
  Widget build(BuildContext context) {
    final DataKeranjang = Provider.of<KeranjangProv>(context);
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Image.network(
                  "http://10.0.2.2:2000/image/${widget.Img}",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 600,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 5,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.Naba,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Share.share(widget.Naba +
                                            "__" +
                                            'This Product is Awesom..!');
                                      },
                                      icon: Icon(Icons.share)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(widget.Kode,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.cyan)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text("Rp." + widget.Haba.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurpleAccent)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 5,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 130,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("About Produk..",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                      "0912738927398127931092839109283-012-`819823182391293`-019`0193287398192`01209`1928`179832912-0`12901`92",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 5,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),

                        ///PRODUK LAINNYAA///PRODUK LAINNYAA
                        ///
                        ///
                        ///
                        Row(
                          children: [
                            Text("Produk Lainnya..",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        (_loadi == true)
                            ? Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.deepPurple,
                                ),
                              )
                            : Container(
                                height: 150,
                                width: double.infinity,
                                child: PageView.builder(
                                    onPageChanged: (value) {
                                      PageSuu = value;
                                      setState(() {});
                                    },
                                    controller: PageCon,
                                    itemCount: 9,
                                    itemBuilder: (context, index) {
                                      int Yi = Random().nextInt(Lidata.length);

                                      return Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            child: OutlinedButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                    return ProdukDetail(
                                                        Lidata[Yi].Nama_Barang,
                                                        Lidata[Yi]
                                                            .Kode_Barang
                                                            .toString(),
                                                        Lidata[Yi].Image,
                                                        Lidata[Yi].Harga_Barang,
                                                        Lidata[Yi]
                                                            .Jumlah_Barang);
                                                  }), (route) => false);
                                                },
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(3),
                                                      child: Container(
                                                        height: 100,
                                                        width: 70,
                                                        color: Colors.grey,
                                                        child: Image.network(
                                                          'http://10.0.2.2:2000/image/${Lidata[Yi].Image}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(Lidata[Yi]
                                                            .Nama_Barang),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          Lidata[Yi]
                                                              .Kode_Barang
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.cyan,
                                                              fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                            Lidata[Yi]
                                                                .Harga_Barang
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepPurple,
                                                                fontSize: 20))
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ));
                                    }),
                              )
                      ],
                    ),
                  )),
            ],
          ),
        ),
        Container(
          height: 70,
          width: double.infinity,
          child: ListTile(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return NavigasiPage(0);
                  }), (route) => false);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.white,
                )),
            subtitle: Center(
              child: Text(
                "Detail Produk",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return KeranjangPage();
                  }));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.white,
                )),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0), blurRadius: 1, spreadRadius: 1)
                  ]),
              margin: EdgeInsets.only(top: 720),
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton.icon(
                        onPressed: () {
                          DataKeranjang.Adddata(widget.Naba, widget.Kode,
                              widget.Img, widget.Haba, 1);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Berhasil Ditambahkan Ke Keranjang")));
                        },
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text("Add To Cart")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  int quan = 1;
                                  return Confir(widget.Kode, widget.Naba,
                                      widget.Img, widget.Haba, widget.juba);
                                });
                          });
                        },
                        child: Text("Buy Now..!"))
                  ],
                ),
              )),
        )
      ],
    ));
  }
}
