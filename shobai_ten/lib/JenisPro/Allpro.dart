import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shobai_ten/app/modules/home/Models/ProdukModel.dart';
import 'package:http/http.dart' as http;
import 'package:shobai_ten/Transaksi/Produkdetail.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AllPro extends StatefulWidget {
  const AllPro({super.key});

  @override
  State<AllPro> createState() => _AllProState();
}

bool _loadi = true;

class _AllProState extends State<AllPro> {
  List<ProdukMo> Lidata = [];
  int pageSuu = 0;
  late final PageController PageCon;
  Future<List<ProdukMo>> Get() async {
    final res =
        await http.get(Uri.parse("http://10.0.2.2:2000/api/product/get"));
    if (res.statusCode == 200) {
      setState(() {
        _loadi = false;
      });
    }
    var data = jsonDecode(res.body);
    List<ProdukMo> Li =
        List.from(data['data'].map((e) => ProdukMo.fromjson(e)));
    return Li;
  }

  void Getu() async {
    final datas = await Get();
    setState(() {
      Lidata = datas;
    });
  }

  FlutterLocalNotificationsPlugin localnoti = FlutterLocalNotificationsPlugin();
  Future<void> noti() async {
    var initsett = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    await localnoti.initialize(initsett);
  }

  Future<void> shownoti(String title, String body, int id) async {
    var andplatspec = AndroidNotificationDetails("channelId", "channelName",
        importance: Importance.max, priority: Priority.high);

    var platchanspec = NotificationDetails(
      android: andplatspec,
    );
    await localnoti.show(id, title, body, platchanspec);
  }

  @override
  void initState() {
    super.initState();
    PageCon = PageController();
    Get();
    Getu();
  }

  @override
  Widget build(BuildContext context) {
    noti();
    return Scaffold(
        appBar: AppBar(
          title: Text("Zen Sakuhing"),
          backgroundColor: Colors.deepPurple,
        ),
        body: (_loadi == true)
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                ),
              )
            : (Lidata.length == 0)
                ? Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Image.asset(
                            "../Images/haoru.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                            "Moshiwake Arimasen Data Ga Mada Arimasen Deshita Douka Hokano Sakuhin O Mite Kudasai")
                      ]),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: OutlinedButton(
                                onPressed: () {
                                  shownoti(
                                      "ijsajs",
                                      "ljdanska",
                                      int.parse(DateTime.now()
                                          .microsecond
                                          .toString()));
                                },
                                child: Container(
                                  height: 70,
                                  width: 100,
                                  child: Center(
                                    child: Text("Zen Sakuhin"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.77,
                            width: double.infinity,
                            child: GridView.builder(
                                itemCount: Lidata.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5),
                                itemBuilder: (contex, index) {
                                  return InkWell(
                                    onTap: () {
                                      shownoti(
                                          "lsjaks",
                                          "ksjaks",
                                          int.parse(DateTime.now()
                                              .microsecond
                                              .toString()));
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (cont) {
                                        return ProdukDetail(
                                            Lidata[index].Nama_Barang,
                                            Lidata[index]
                                                .Kode_Barang
                                                .toString(),
                                            Lidata[index].Image,
                                            Lidata[index].Harga_Barang,
                                            Lidata[index].Jumlah_Barang);
                                      }), (route) => false);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.grey,
                                          child: GridTile(
                                            child: Image.network(
                                              'http://10.0.2.2:2000/image/${Lidata[index].Image}',
                                              fit: BoxFit.cover,
                                            ),
                                            footer: GridTileBar(
                                              title: Text(
                                                  Lidata[index].Nama_Barang),
                                              subtitle: Text(
                                                "Rp." +
                                                    Lidata[index]
                                                        .Harga_Barang
                                                        .toString(),
                                                style: TextStyle(
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }))
                      ],
                    ),
                  ));
  }
}

class CardProduk extends StatelessWidget {
  String Naba;
  int Haba;
  int Juba;
  String Img;
  String Kode;
  CardProduk(@required this.Naba, @required this.Haba, @required this.Juba,
      @required this.Img, @required this.Kode);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (cont) {
            return ProdukDetail(Naba, Kode, Img, Haba, Juba);
          }), (route) => false);
        },
        child: Container(
          height: 150,
          width: 150,
          color: Colors.grey,
          child: GridTile(
            child: Image.network(
              'http://10.0.2.2:2000/image/${Img}',
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              title: Text(Naba),
              subtitle: Text(Haba.toString()),
            ),
          ),
        ));
  }
}
