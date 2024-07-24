import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shobai_ten/ProfileProperties/EditAccount.dart';
import 'package:shobai_ten/ProfileProperties/Pesanan.dart';
import 'package:shobai_ten/ProfileProperties/Terpesan.dart';
import 'package:shobai_ten/Transaksi/KeranjangPage.dart';
import 'package:shobai_ten/Transaksi/Produkdetail.dart';
import 'package:shobai_ten/app/Provider/UserProv.dart';
import 'package:shobai_ten/app/modules/home/Models/ProdukModel.dart';
import 'package:http/http.dart' as http;
import 'package:shobai_ten/app/modules/home/Models/UserMo.dart';
import 'package:provider/provider.dart';
import 'package:shobai_ten/app/modules/home/views/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  List<ProdukMo> Data = [];
  bool _loa = true;
  List<UserProMo> UserData = [];
  Future<List<UserProMo>> Gt(toke) async {
    final resp = await http.get(
        Uri.parse('http://10.0.2.2:2000/api/users/konget?where=Token=$toke'));
    if (resp.statusCode == 200) {
      setState(() {
        _loa = false;
      });
    }
    var data = jsonDecode(resp.body);
    List<UserProMo> LiU =
        List.from(data['data'].map((e) => UserProMo.fromjson(e)));
    return LiU;
  }

  void GetU(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var Toke = pref.getString('Token');
    final dasa = await Gt(Toke);
    setState(() {
      UserData = dasa;
    });
  }

  Future<List<ProdukMo>> Get() async {
    final resp =
        await http.get(Uri.parse('http://10.0.2.2:2000/api/product/get'));
    if (resp.statusCode == 200) {
      setState(() {
        _loa = false;
      });
    }
    var data = jsonDecode(resp.body);
    List<ProdukMo> Li =
        List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
    return Li;
  }

  void Get2() async {
    final da = await Get();
    setState(() {
      Data = da;
    });
  }

  int Yi = 0;
  @override
  void initState() {
    Get();
    Get2();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final da = Provider.of<UserProv>(context);
    final alldata = da.alldata;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 231, 231),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: (UserData.length == 0)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 1.2,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.24,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 201, 142, 211),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.09),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                title: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            alldata.values.toList()[0].Username,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                alldata.values
                                                    .toList()[0]
                                                    .Id
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.deepPurple,
                                                    fontWeight:
                                                        FontWeight.w200)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Member classic",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.cyan,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: Icon(Icons.note),
                                      title: Text("Pesanan Saya"),
                                      trailing: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (cont) {
                                            return Terpesan();
                                          }));
                                        },
                                        child: Text(
                                          "Lihat riwayat pesanan >>>",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.13,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (cont) {
                                                      return Pesanan();
                                                    }));
                                                  },
                                                  icon: Icon(Icons.car_crash)),
                                              Text("Pesanan")
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (cont) {
                                                      return Terpesan();
                                                    }));
                                                  },
                                                  icon: Icon(
                                                      Icons.gpp_good_sharp)),
                                              Text("Terpesan")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Text("Beli Lagi.."),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.14,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: (_loa == true)
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor:
                                                  Colors.deepPurple,
                                            ),
                                          )
                                        : GridView.builder(
                                            scrollDirection: Axis.horizontal,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 1,
                                                    mainAxisSpacing: 5,
                                                    crossAxisSpacing: 5),
                                            itemCount: 8,
                                            itemBuilder: (context, index) {
                                              Yi =
                                                  Random().nextInt(Data.length);
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (cont) {
                                                    return ProdukDetail(
                                                        Data[Yi].Nama_Barang,
                                                        Data[Yi]
                                                            .Kode_Barang
                                                            .toString(),
                                                        Data[Yi].Image,
                                                        Data[Yi].Harga_Barang,
                                                        Data[Yi].Jumlah_Barang);
                                                  }), (route) => false);
                                                },
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  color: Colors.cyan,
                                                  child: GridTile(
                                                    child: Image.network(
                                                      "http://10.0.2.2:2000/image/${Data[Yi].Image}",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    footer: GridTileBar(
                                                      title: Text(
                                                          Data[Yi].Nama_Barang),
                                                      subtitle: Text(
                                                        Data[Yi]
                                                            .Harga_Barang
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepPurple,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (cont) {
                                return EdithAcount(
                                    alldata.values.toList()[0].Id,
                                    alldata.values.toList()[0].Username,
                                    alldata.values.toList()[0].Password,
                                    alldata.values.toList()[0].Alamat);
                              }));
                            },
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: double.infinity,
                                color: Colors.white,
                                child: ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text("Pengaturan akun"),
                                  trailing: Icon(Icons.arrow_right),
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (cont) {
                                    return AlertDialog(
                                      title: Text("Confirm"),
                                      content: Text("Keluar Account?"),
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
                                                  da.DeData(alldata.values
                                                      .toList()[0]
                                                      .Id);
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (cont) {
                                                    return LoginPage();
                                                  }), (route) => false);
                                                },
                                                child: Text("Yes"))
                                          ],
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: double.infinity,
                              color: Colors.red,
                              child: ListTile(
                                leading: Icon(Icons.logout),
                                title: Text("Log Out"),
                                trailing: Icon(Icons.arrow_right),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              child: ListTile(
                  subtitle: Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (cont) {
                          return KeranjangPage();
                        }));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ))),
            )
          ],
        ));
  }
}
