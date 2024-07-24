import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jiken/Model/ProdukMo.dart';
import 'package:http/http.dart' as http;
import 'package:jiken/Provider/KeranPro.dart';
import 'package:provider/provider.dart';

class ProduPage extends StatefulWidget {
  const ProduPage({super.key});

  @override
  State<ProduPage> createState() => _ProduPageState();
}

class _ProduPageState extends State<ProduPage> {
  static List<ProdukMo> LiDa = [];
  bool _load = true;
  Future<List<ProdukMo>> fetdaba() async {
    final resp =
        await http.get(Uri.parse("http://10.0.2.2:2000/api/product/get"));
    if (resp.statusCode == 200) {
      setState(() {
        _load = false;
      });
    }
    var dat = jsonDecode(resp.body);
    List<ProdukMo> Liy =
        List.from(dat['data'].map((e) => ProdukMo.fromJson(e)));
    return Liy;
  }

  void getu2() async {
    final daty = await fetdaba();
    setState(() {
      LiDa = daty;
    });
  }

  @override
  void initState() {
    fetdaba();
    getu2();
    Juba;
    print(LiDa);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int Juba = 1;
  @override
  Widget build(BuildContext context) {
    final da = Provider.of<KeranPro>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      child: (_load)
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 2),
              itemCount: LiDa.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DialogBarang(
                                LiDa[index].Kb,
                                LiDa[index].Naba,
                                LiDa[index].Juba,
                                LiDa[index].Haba,
                                LiDa[index].Jeba,
                                LiDa[index].Img);
                          });
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 2,
                                  blurRadius: 2)
                            ]),
                        child: GridTile(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "http://10.0.2.2:2000/image/${LiDa[index].Img}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          footer: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            child: GridTileBar(
                              backgroundColor: Colors.white.withOpacity(0.5),
                              title: Text(
                                LiDa[index].Naba,
                                style: TextStyle(color: Colors.purpleAccent),
                              ),
                              subtitle: Text(
                                LiDa[index].Haba.toString(),
                                style: TextStyle(
                                    color: Colors.deepPurple, fontSize: 20),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return DialogBarang(
                                                LiDa[index].Kb,
                                                LiDa[index].Naba,
                                                LiDa[index].Juba,
                                                LiDa[index].Haba,
                                                LiDa[index].Jeba,
                                                LiDa[index].Img);
                                          });
                                    });
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.purpleAccent,
                                  )),
                            ),
                          ),
                        )),
                  ),
                );
              }),
    );
  }
}

class DialogBarang extends StatefulWidget {
  int Kb;
  String Naba;
  int Jubalh;
  int Haba;
  String Jeba;
  String Img;
  DialogBarang(this.Kb, this.Naba, this.Jubalh, this.Haba, this.Jeba, this.Img);

  @override
  State<DialogBarang> createState() => _DialogBarangState();
}

class _DialogBarangState extends State<DialogBarang> {
  int Juba = 1;
  int Toba = 0;
  @override
  void initState() {
    Juba = 1;
    Toba = widget.Haba;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final da = Provider.of<KeranPro>(context);
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(offset: Offset(1, 1), spreadRadius: 1, blurRadius: 1)
            ]),
        child: Column(
          children: [
            ///Awal Card Produk
            ///
            ///
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.17,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 238, 237, 237).withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "http://10.0.2.2:2000/image/${widget.Img}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.3,
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: Column(
                      children: [
                        Text(
                          widget.Naba,
                          style:
                              TextStyle(fontSize: 18, color: Colors.deepPurple),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.Kb.toString(),
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          "Rp." + widget.Haba.toString(),
                          style:
                              TextStyle(fontSize: 20, color: Colors.deepPurple),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height * 0.3,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (Juba <= 1) {
                                      } else {
                                        Juba -= 1;
                                        Toba = widget.Haba * Juba;
                                      }
                                    });
                                    print(Juba.toString());
                                  },
                                  icon: Icon(Icons.minimize)),
                              Text(Juba.toString() + "x"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Juba += 1;
                                      Toba = widget.Haba * Juba;
                                    });
                                  },
                                  icon: Icon(Icons.plus_one))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///Akhir Card Produk
            ///
            ///
            ///Awal Button Plus MIn
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.43),
                width: MediaQuery.of(context).size.height * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Text(
                  "Total Semua Harga:" + Toba.toString(),
                  style:
                      TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),
                )

                ///akhir Button Plus MIn
                ///
                ///Awal Button Yes No
                ),
            Container(
              width: MediaQuery.of(context).size.height * 1,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close)),
                  OutlinedButton(
                      onPressed: () {
                        da.adddata(widget.Kb, widget.Naba, widget.Haba, Juba,
                            Toba, widget.Jeba, widget.Img);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Berhasil Dimasukan Ke Keranjang")));
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.shopping_cart))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
