import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shobai_ten/Transaksi/Produkdetail.dart';
import 'package:shobai_ten/app/modules/home/Models/ProdukModel.dart';
import 'package:http/http.dart' as http;
import 'package:shobai_ten/JenisPro/Allpro.dart';

class MakananPage extends StatefulWidget {
  const MakananPage({super.key});

  @override
  State<MakananPage> createState() => _MakananPageState();
}

class _MakananPageState extends State<MakananPage> {
  List<ProdukMo> DataLI = [];
  bool Load = true;
  Future<List<ProdukMo>> Get() async {
    final resp = await http
        .get(Uri.parse("http://10.0.2.2:2000/api/product/get/tabemono"));
    if (resp.statusCode == 200) {
      setState(() {
        Load = false;
      });
    }
    var data = jsonDecode(resp.body);
    List<ProdukMo> Li =
        List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
    return Li;
  }

  void Get2() async {
    final Dataas = await Get();
    setState(() {
      DataLI = Dataas;
    });
  }

  int PageSuu = 0;
  late final PageController PageCon;
  @override
  void initState() {
    Get();
    Get2();
    super.initState();
    PageCon = PageController(initialPage: 0, viewportFraction: 0.75);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Food"),
          backgroundColor: Colors.deepPurple,
        ),
        body: (Load == true)
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                ),
              )
            : (DataLI.length == 0)
                ? Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Image.asset(
                            "../Images/haoru.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                            "Moshiwake Arimasen Data Ga Mada Arimasen Deshita Douka Hokano Sakuhin O Mite Kudasai")
                      ]),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Container(
                                  height: 70,
                                  width: 100,
                                  child: Center(
                                    child: Text("Food"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.77,
                            width: double.infinity,
                            child: GridView.builder(
                                itemCount: DataLI.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5),
                                itemBuilder: (contex, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (cont) {
                                        return ProdukDetail(
                                            DataLI[index].Nama_Barang,
                                            DataLI[index]
                                                .Kode_Barang
                                                .toString(),
                                            DataLI[index].Image,
                                            DataLI[index].Harga_Barang,
                                            DataLI[index].Jumlah_Barang);
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
                                              0.03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.grey,
                                          child: GridTile(
                                            child: Image.network(
                                              'http://10.0.2.2:2000/image/${DataLI[index].Image}',
                                              fit: BoxFit.cover,
                                            ),
                                            footer: GridTileBar(
                                              title: Text(
                                                  DataLI[index].Nama_Barang),
                                              subtitle: Text(
                                                "Rp." +
                                                    DataLI[index]
                                                        .Harga_Barang
                                                        .toString(),
                                                style: TextStyle(
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }))
                      ],
                    ),
                  ));
  }
}
