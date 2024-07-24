import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jiken/Model/ProdukMo.dart';
import 'package:jiken/Page%20Utama/Produk.dart';
import 'package:provider/provider.dart';

class SagashuPage extends StatefulWidget {
  const SagashuPage({super.key});

  @override
  State<SagashuPage> createState() => _SagashuPageState();
}

class _SagashuPageState extends State<SagashuPage> {
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

  List<ProdukMo> Saga = List.from(LiDa);

  void onsaga(String Naba) {
    setState(() {
      Saga = List.from(LiDa.where(
          (element) => element.Naba.toString().toLowerCase().contains(Naba)));
    });
  }

  @override
  void initState() {
    fetdaba();
    getu2();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
                hintText: "Search Produk",
                labelText: "Seacrh",
                suffixIcon: Icon(Icons.search)),
            onChanged: (value) {
              onsaga(value);
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.infinity,
          child: (_load)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                )
              : (Saga.length == 0)
                  ? Center(
                      child: Text(
                        "Nothing Data Found..!",
                        style: TextStyle(color: Colors.red, fontSize: 25),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 2),
                      itemCount: Saga.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogBarang(
                                        Saga[index].Kb,
                                        Saga[index].Naba,
                                        Saga[index].Juba,
                                        Saga[index].Haba,
                                        Saga[index].Jeba,
                                        Saga[index].Img);
                                  });
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
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
                                      "http://10.0.2.2:2000/image/${Saga[index].Img}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  footer: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    child: GridTileBar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.5),
                                      title: Text(
                                        Saga[index].Naba,
                                        style: TextStyle(
                                            color: Colors.purpleAccent),
                                      ),
                                      subtitle: Text(
                                        Saga[index].Haba.toString(),
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 20),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return DialogBarang(
                                                        Saga[index].Kb,
                                                        Saga[index].Naba,
                                                        Saga[index].Juba,
                                                        Saga[index].Haba,
                                                        Saga[index].Jeba,
                                                        Saga[index].Img);
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
        ));
  }
}
