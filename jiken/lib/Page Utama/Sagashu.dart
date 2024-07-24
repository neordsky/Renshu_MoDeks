import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jiken/Model/ProdukMo.dart';
import 'package:http/http.dart' as http;
import 'package:jiken/Page%20Utama/Produk.dart';

class SagaPage extends StatefulWidget {
  const SagaPage({super.key});

  @override
  State<SagaPage> createState() => _SagaPageState();
}

class _SagaPageState extends State<SagaPage> {
  static List<ProdukMo> LiDa = [];
  bool _load = true;

  get http => null;
  Future<List<ProdukMo>> fetdaba() async {
    final resp = await http.get();
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

  List<ProdukMo> SagaPro = List.from(LiDa);

  void sagache(String Naba) {
    setState(() {
      SagaPro = List.from(LiDa.where(
              (element) => element.Naba.toString().toLowerCase().contains(Naba))
          .toList());
    });
  }

  @override
  void initState() {
    fetdaba();
    getu2();

    print(LiDa);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration:
                InputDecoration(hintText: "Search Produk", labelText: "Seacrh"),
            onChanged: (value) {
              sagache(value);
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
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 2),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
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
                                "http://10.0.2.2:2000/image/${SagaPro[index].Img}",
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
                                  SagaPro[index].Naba,
                                  style: TextStyle(color: Colors.purpleAccent),
                                ),
                                subtitle: Text(
                                  SagaPro[index].Haba.toString(),
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
                                                  SagaPro[index].Kb,
                                                  SagaPro[index].Naba,
                                                  SagaPro[index].Juba,
                                                  SagaPro[index].Haba,
                                                  SagaPro[index].Jeba,
                                                  SagaPro[index].Img);
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
                    );
                  }),
        ));
  }
}
