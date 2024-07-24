import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shobai_ten/app/Provider/PesananProv.dart';
import 'package:shobai_ten/app/Provider/TerpesanProv.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({super.key});

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  @override
  Widget build(BuildContext context) {
    final Iny = Provider.of<TerpesProv>(context);
    final In = Provider.of<PeProv>(context);
    final data = In.Data;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 239, 239),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: (data.length == 0)
                ? Center(
                    child: Text(
                      "No Data...",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      int kek = data[index].Haba * data[index].quanty;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ]),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      color: Colors.brown,
                                      child: Image.network(
                                        'http://10.0.2.2:2000/image/${data[index].Img}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.height * 0.3,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [Text(data[index].Naba)],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            data[index].Kode,
                                            style: TextStyle(
                                                color: Colors.cyan,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Rp." + data[index].Haba.toString(),
                                            style: TextStyle(
                                                color: Colors.purple,
                                                fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            data[index].quanty.toString() + "x")
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        children: [
                                          Text("Total:" + kek.toString())
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: FittedBox(
                                        child: Row(
                                          children: [
                                            Text("Id Transaksi:" +
                                                data[index].IdTran)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (cont) {
                                                    return AlertDialog(
                                                      title: Text("Confirm"),
                                                      content: Text(
                                                          "Anda Yakin Telah Menerima Barang Nya?"),
                                                      actions: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            OutlinedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    "No ")),
                                                            OutlinedButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    Iny.AddData(
                                                                        data[index]
                                                                            .Kode,
                                                                        data[index]
                                                                            .Naba,
                                                                        data[index]
                                                                            .Img,
                                                                        data[index]
                                                                            .Haba,
                                                                        data[index]
                                                                            .quanty,
                                                                        data[index]
                                                                            .IdTran);
                                                                    In.DelData(data[
                                                                            index]
                                                                        .IdTran);
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(SnackBar(
                                                                            content:
                                                                                Text("Data Telah Berhasil Dihapus")));
                                                                  });
                                                                },
                                                                child:
                                                                    Text("Yes"))
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Text("DIterima"))
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: double.infinity,
            child: ListTile(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                  )),
              subtitle: Center(
                child: Text(
                  "Pesanan Saya",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
