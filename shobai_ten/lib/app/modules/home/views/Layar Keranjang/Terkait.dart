import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shobai_ten/app/modules/home/Models/ProdukModel.dart';
import 'package:http/http.dart' as http;

class PageTerkait extends StatefulWidget {
  String naba;
  PageTerkait(this.naba);

  @override
  State<PageTerkait> createState() => _PageTerkaitState();
}

class _PageTerkaitState extends State<PageTerkait> {
  static List<ProdukMo> Data = [];
  bool _loadi = true;

  Future<List<ProdukMo>> Get() async {
    final res =
        await http.get(Uri.parse("http://10.0.2.2:2000/api/product/get"));
    if (res.statusCode == 200) {
      setState(() {});
    }
    var data = jsonDecode(res.body);
    List<ProdukMo> Li =
        List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
    return Li;
  }

  void Getu() async {
    final datas = await Get();
    setState(() {
      Data = datas;
    });
  }

  List<ProdukMo> Us = List.from(Data);
  void check(String Naba) {
    setState(() {
      _loadi = false;
      Us = Data.where((element) =>
          element.Nama_Barang.toString().toLowerCase() == widget.naba).toList();
    });
  }

  @override
  void initState() {
    Get();
    Getu();
    check(widget.naba);
    print(Us.length);
    print(widget.naba);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: (_loadi == true)
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                ),
              )
            : GridView.builder(
                itemCount: Us.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return OutlinedButton(
                      onPressed: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.grey,
                        child: GridTile(
                          child: Text(Us[index].Nama_Barang),
                          footer: GridTileBar(
                            backgroundColor: Colors.purpleAccent,
                          ),
                        ),
                      ));
                }),
      ),
    );
  }
}
