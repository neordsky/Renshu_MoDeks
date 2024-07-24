import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shobai_ten/app/Provider/NotiPro.dart';
import 'package:shobai_ten/app/modules/home/Models/apimo.dart';
import 'package:shobai_ten/Transaksi/KeranjangPage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  List<apimo> Datas = [];

  void tsuru() async {
    final res = await Getdata.Get();
    setState(() {
      Datas = res;
    });
  }

  void getapi2() async {
    try {
      final respo =
          await http.get(Uri.parse("http://10.0.2.2:2000/api/product/get"));
      if (respo.statusCode >= 200 && respo.statusCode <= 300) {
        var data = jsonDecode(respo.body);
        print(data);
        print("object");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    getapi2();
    // TODO: implement initState
    super.initState();
    getapi2();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NotiPro>(context);
    final allda = data.Data;
    return Scaffold(
        body: Stack(
      children: [
        (allda.length == 0)
            ? Center(
                child: Text(
                  "Nothing Data....",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30),
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 80),
                height: 700,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: allda.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.startToEnd,
                        confirmDismiss: (direction) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Confirrm"),
                                  content: Text("Hapus Pesan Ini?"),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text("No")),
                                        OutlinedButton(
                                            onPressed: () {
                                              data.DelData(allda[index].IdTran);
                                              Navigator.of(context).pop(true);
                                            },
                                            child: Text("Yes"))
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Color.fromARGB(255, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ]),
                            child: ListTile(
                              leading: CircleAvatar(child: Icon(Icons.wallet)),
                              title: Text(
                                "Infomasi..!",
                                style: TextStyle(fontSize: 16),
                              ),
                              subtitle: Text("Nama Barang:" +
                                  allda[index].Naba +
                                  ",Kode Barang :" +
                                  allda[index].Kode +
                                  "Harga Barang :" +
                                  allda[index].Haba.toString() +
                                  ",Jumlah Barang:" +
                                  allda[index].quanty.toString() +
                                  ",Id Transaksi:" +
                                  allda[index].IdTran),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
        Container(
          height: 70,
          width: double.infinity,
          child: ListTile(
            subtitle: Center(
              child: Text(
                "Notifikasi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                )),
          ),
        ),
      ],
    ));
  }
}

class Getdata {
  static const String URL = 'https://reqres.in/api/users?page=2';
  static Future<List<apimo>> Get() async {
    try {
      final respon = await http.get(Uri.parse(URL));
      final body = respon.body;
      final data = jsonDecode(body);
      print(data);
      List<apimo> tes =
          List<apimo>.from(data['data'].map((e) => apimo.fromJson(e)));
      print(tes);
      return tes;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
