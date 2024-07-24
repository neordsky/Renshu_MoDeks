import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jiken/Page%20Utama/TransaksiLanjut.dart';
import 'package:jiken/Provider/KeranPro.dart';
import 'package:jiken/Provider/ShikePro.dart';
import 'package:provider/provider.dart';

class Keranpa extends StatefulWidget {
  const Keranpa({super.key});

  @override
  State<Keranpa> createState() => _KeranpaState();
}

class _KeranpaState extends State<Keranpa> {
  bool zenkai = false;
  @override
  void initState() {
    zenkai = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tes = Provider.of<KeranPro>(context);
    final DataPro = tes.Data;
    final test = Provider.of<ShikePro>(context);
    final DataPr = tes.Data;
    return Stack(children: [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        child: ListView(
          children: [
            ...tes.Data.map((e) => ChangeNotifierProvider.value(
                  value: e,
                  builder: (context, child) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ],
                            color: const Color.fromARGB(255, 240, 235, 235)
                                .withOpacity(1),
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: Column(
                          children: [
                            CheckboxListTile(
                              value: e.chec,
                              onChanged: (value) {
                                setState(() {
                                  e.Sitw();
                                  if (e.chec) {
                                    test.adddata(e.Kb, e.Naba, e.Haba,
                                        e.quantity, e.totaba, e.Jebba, e.Img);
                                  } else {
                                    test.delda(e.Kb);
                                  }
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              subtitle: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.24,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.21,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              "http://10.0.2.2:2000/image/${e.Img}",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),

                                    ////Tulisan Barang
                                    ///
                                    ///
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.14,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        child: Column(
                                          children: [
                                            Text(
                                              e.Naba,
                                              style: TextStyle(
                                                  color: Colors.purpleAccent,
                                                  fontSize: 18),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(e.Kb.toString()),
                                            ),
                                            Text("Rp." + e.Haba.toString(),
                                                style: TextStyle(
                                                    color: Colors.deepPurple,
                                                    fontSize: 20))
                                          ],
                                        ),
                                      ),
                                    ),
                                    //AKhir Tulisan Barang

                                    //Button Min Plus

                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.12,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.28,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (e.quantity <= 1) {
                                                        } else {
                                                          e.quantity -= 1;
                                                          e.totaba =
                                                              e.quantity *
                                                                  e.Haba;
                                                        }
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.minimize,
                                                      size: 15,
                                                    )),
                                                Text(
                                                  e.quantity.toString() + "X",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        e.quantity += 1;
                                                        e.totaba =
                                                            e.quantity * e.Haba;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.plus_one_sharp,
                                                      size: 15,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [Text("Total Harga:")],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("Rp." + e.totaba.toString())
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(1, 1), spreadRadius: 1, blurRadius: 2),
          ],
          color: Colors.white,
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: zenkai,
          onChanged: (value) {
            setState(() {
              if (zenkai == true) {
                zenkai = false;
                DataPro.forEach((element) {
                  element.chec = false;
                });
                DataPr.forEach((element) {
                  test.delda(element.Kb);
                });
              } else {
                zenkai = true;
                DataPro.forEach((element) {
                  element.chec = true;
                  test.adddata(
                      element.Kb,
                      element.Naba,
                      element.Haba,
                      element.quantity,
                      element.totaba,
                      element.Jebba,
                      element.Img);
                });
              }
            });
          },
          subtitle: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.04,
            child: Text("Checkout Semua Barang"),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.48),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(offset: Offset(1, 1), spreadRadius: 1, blurRadius: 2),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
                onPressed: () {
                  if (DataPr.length == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Pilih Dulu Barang Yang mau di checkout")));
                  } else {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (cont) {
                      return TranLan();
                    }));
                  }
                },
                child: Text("Checkout")),
            Text(
              "Total Semua Harga:" + "Rp." + test.JumTol.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )
          ],
        ),
      )
    ]);
  }
}
