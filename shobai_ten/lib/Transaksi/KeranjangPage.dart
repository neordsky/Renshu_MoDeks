import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shobai_ten/Transaksi/TranKeran.dart';
import 'package:shobai_ten/app/Provider/KeranjangProv.dart';
import 'package:shobai_ten/app/Provider/ShikeProv.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    final DataKeranjang = Provider.of<KeranjangProv>(context);
    final DataShike = Provider.of<ShikeProv>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Keranjang"),
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Stack(
          children: [
            (DataKeranjang.Alldata.length == 0)
                ? Center(
                    child: ClipPath(
                      clipper: PathKer(),
                      child: Container(
                        height: 400,
                        width: 400,
                        color: const Color.fromARGB(255, 216, 213, 212),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              child: Image.asset(
                                "assets/haoru.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Nothing Data..",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: double.infinity,
                    child: ListView(
                      children: [
                        ...DataKeranjang.Alldata.map(
                            (e) => ChangeNotifierProvider.value(
                                  value: e,
                                  builder: (context, child) {
                                    return Container(
                                        height: 150,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            CheckboxListTile(
                                              value: e.check,
                                              onChanged: (value) {
                                                setState(() {
                                                  e.Switch();
                                                  if (e.check) {
                                                    DataShike.Adddata(
                                                        e.Naba,
                                                        e.Kode,
                                                        e.Img,
                                                        e.Haba,
                                                        e.quanty);
                                                  } else {
                                                    DataShike.DeleteData(
                                                        e.Kode);
                                                  }
                                                });
                                              },
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              subtitle: Container(
                                                height: 140,
                                                width: 110,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Container(
                                                        height: 90,
                                                        width: 90,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Image.network(
                                                            'http://10.0.2.2:2000/image/${e.Img}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Container(
                                                        height: 140,
                                                        width: 190,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 7,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(e.Naba,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15)),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 7,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(e.Kode,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w200,
                                                                        fontSize:
                                                                            15)),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 7,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Rp." +
                                                                      e.Haba
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 14,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 80,
                                                                    color: Colors
                                                                        .grey,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              if (e.quanty == 1) {
                                                                              } else {
                                                                                e.quanty--;
                                                                              }
                                                                            });
                                                                          },
                                                                          child: ClipRRect(
                                                                              borderRadius: BorderRadius.circular(100),
                                                                              child: Container(
                                                                                height: 20,
                                                                                width: 20,
                                                                                color: Colors.redAccent,
                                                                                child: Center(
                                                                                  child: Icon(
                                                                                    Icons.minimize,
                                                                                    size: 20,
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                        Text(e
                                                                            .quanty
                                                                            .toString()),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              e.quanty++;
                                                                            });
                                                                          },
                                                                          child: ClipRRect(
                                                                              borderRadius: BorderRadius.circular(100),
                                                                              child: Container(
                                                                                  height: 20,
                                                                                  width: 20,
                                                                                  color: Colors.greenAccent,
                                                                                  child: Center(
                                                                                    child: Icon(
                                                                                      Icons.add,
                                                                                      size: 20,
                                                                                    ),
                                                                                  ))),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                ))
                      ],
                    ),
                  ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0), blurRadius: 1, spreadRadius: 1)
                    ]),
                margin: EdgeInsets.only(top: 630),
                height: 70,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 1,
                                spreadRadius: 1)
                          ],
                        ),
                        height: 50,
                        width: 170,
                        child: Column(
                          children: [
                            Text("Total Harga :"),
                            SizedBox(
                              height: 5,
                            ),
                            (DataShike.Alldata.length == 0)
                                ? Text("....")
                                : Text(DataShike.Jumlah.toString())
                          ],
                        ),
                      ),
                      OutlinedButton.icon(
                          onPressed: () {
                            if (DataShike.Alldata.length == 0) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Pilih dulu Produk Yang mau di checkout"),
                                      actions: [
                                        Center(
                                          child: OutlinedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Oke")),
                                        )
                                      ],
                                    );
                                  });
                            } else {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (cont) {
                                return TranKera();
                              }));
                            }
                          },
                          icon: Icon(Icons.shopping_cart_checkout),
                          label: Text("Chekout Now..!")),
                    ],
                  ),
                )),
          ],
        ));
  }
}

class PathKer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height * 0.3)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.3)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
