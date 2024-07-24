import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shobai_ten/app/Provider/TerpesanProv.dart';

class Terpesan extends StatefulWidget {
  const Terpesan({super.key});

  @override
  State<Terpesan> createState() => _TerpesanState();
}

class _TerpesanState extends State<Terpesan> {
  @override
  Widget build(BuildContext context) {
    final In = Provider.of<TerpesProv>(context);
    final data = In.Data;
    return Scaffold(
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (cont) {
                                                    return AlertDialog(
                                                      title: Text("Confirm"),
                                                      content: Text(
                                                          "Hapus Riwayat Pesanan ini?"),
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
                                                                    In.DelData(data[
                                                                            index]
                                                                        .IdTran);
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(SnackBar(
                                                                          content:
                                                                              Text("Data Telah Berhasil Dihapus")));
                                                                },
                                                                child:
                                                                    Text("Yes"))
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: Icon(Icons.close))
                                      ],
                                    ),
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
                  "Terpesan",
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
