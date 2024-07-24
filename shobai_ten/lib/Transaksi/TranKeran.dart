import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shobai_ten/app/Provider/NotiPro.dart';
import 'package:shobai_ten/app/Provider/PesananProv.dart';
import 'package:shobai_ten/app/Provider/ShikeProv.dart';
import 'package:shobai_ten/app/modules/home/Models/ModelShike.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/HomePage2.dart';
import 'package:shobai_ten/app/modules/home/views/home_view.dart';

class TranKera extends StatefulWidget {
  @override
  State<TranKera> createState() => _TranKeraState();
}

class _TranKeraState extends State<TranKera> {
  int Quan = 1;
  int kekka = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Prov = Provider.of<ShikeProv>(context);
    final Datapro = Prov.Alldata;
    final Ins = Provider.of<NotiPro>(context);
    final Iny = Provider.of<PeProv>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Transaksi Lanjut"),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height:
                    MediaQuery.of(context).size.height * 0.6 * Datapro.length,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: double.infinity,
                      color: Colors.deepPurpleAccent,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      color: Color.fromARGB(255, 231, 227, 227),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [Text("Username :")],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [Text("Id :")],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [Text("Alamat :")],
                            ),
                          )
                        ],
                      ),
                    ),

                    //TAMPILAN PRODUK CHEKOUT
                    ///
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height *
                              0.25 *
                              Datapro.length,
                          width: double.infinity,
                          child: Column(
                              children: List.generate(
                            Datapro.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: double.infinity,
                                color: const Color.fromARGB(255, 230, 225, 225),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Image.network(
                                          "http://10.0.2.2:2000/image/${Datapro[index].Img}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(Datapro[index].Naba),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(Datapro[index].Kode),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Rp" +
                                                      Datapro[index]
                                                          .Haba
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.deepPurple,
                                                      fontSize: 20),
                                                ),
                                                Text(Quan.toString() + "x"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 218, 216, 216),
                        child: Row(
                          children: [
                            Text("Total Semua Harga :" +
                                "Rp." +
                                Prov.Jumlah.toString())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.82,
              ),
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0), blurRadius: 1, spreadRadius: 1)
                ],
                color: const Color.fromARGB(255, 209, 220, 221),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Total Semua Harga : "),
                          ),
                          Text(Prov.Jumlah.toString())
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: (context),
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Confirm"),
                                  content: Text(
                                      "Apakah Anda Yakin ingin memesan Barang ini?"),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("No")),
                                        OutlinedButton(
                                            onPressed: () {
                                              Datapro.forEach((element) {
                                                String IdTra =
                                                    DateTime.now().toString();
                                                Ins.AddData(
                                                    element.Kode,
                                                    element.Naba,
                                                    element.Img,
                                                    element.Haba,
                                                    element.quanty,
                                                    IdTra);
                                                Iny.AddData(
                                                    element.Kode,
                                                    element.Naba,
                                                    element.Img,
                                                    element.Haba,
                                                    element.quanty,
                                                    IdTra);
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Pesanan Anda Telah Di pesan")));
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                return NavigasiPage(3);
                                              }), (route) => false);
                                            },
                                            child: Text("Yes"))
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: Text("Buy This...."))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
