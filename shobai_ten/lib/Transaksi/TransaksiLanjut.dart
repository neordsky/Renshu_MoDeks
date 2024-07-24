import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shobai_ten/app/Provider/NotiPro.dart';
import 'package:shobai_ten/app/Provider/PesananProv.dart';
import 'package:shobai_ten/app/Provider/UserProv.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/HomePage2.dart';
import 'package:shobai_ten/app/modules/home/views/home_view.dart';
import 'package:shobai_ten/settings%20App/Notifications.dart';

class TranLan extends StatefulWidget {
  String Naba;
  String Kode;
  int Haba;
  int Juba;
  String Img;
  int quanty;
  TranLan(@required this.Naba, @required this.Kode, @required this.Haba,
      @required this.Juba, @required this.Img, @required this.quanty);

  @override
  State<TranLan> createState() => _TranLanState();
}

class _TranLanState extends State<TranLan> {
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

  int Quan = 1;
  int kekka = 0;
  @override
  void initState() {
    kekka = widget.Haba * widget.quanty;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    noti();
    final da = Provider.of<UserProv>(context);
    final daus = da.alldata;

    final In = Provider.of<NotiPro>(context);
    final Iny = Provider.of<PeProv>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Transaksi Lanjut"),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
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
                            children: [
                              Text("Username :" +
                                  daus.values.toList()[0].Username)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Id :" +
                                  daus.values.toList()[0].Id.toString())
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Alamat :" + daus.values.toList()[0].Alamat)
                            ],
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
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 230, 225, 225),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Image.network(
                                  "http://10.0.2.2:2000/image/${widget.Img}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(widget.Naba),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(widget.Kode),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rp" + widget.Haba.toString(),
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontSize: 20),
                                        ),
                                        Text(widget.quanty.toString() + "x"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 218, 216, 216),
                      child: Row(
                        children: [
                          Text("Total Semua Harga :" + "Rp." + kekka.toString())
                        ],
                      ),
                    ),
                  )
                ],
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Comfirm"),
                                  content:
                                      Text("Apakah Anda Yakin ingin untu?"),
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
                                              String IdTra =
                                                  DateTime.now().toString();
                                              In.AddData(
                                                  widget.Kode,
                                                  widget.Naba,
                                                  widget.Img,
                                                  widget.Haba,
                                                  Quan,
                                                  IdTra);
                                              Iny.AddData(
                                                  widget.Kode,
                                                  widget.Naba,
                                                  widget.Img,
                                                  widget.Haba,
                                                  Quan,
                                                  IdTra);

                                              shownoti(
                                                  "Transaksi",
                                                  "You Have Transaksi Product ${widget.Naba}",
                                                  int.parse(DateTime.now()
                                                      .microsecond
                                                      .toString()));

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Pesanan Anda Telah Di pesan")));
                                              // Navigator.of(context)
                                              //     .pushAndRemoveUntil(
                                              //         MaterialPageRoute(
                                              //             builder: (context) {
                                              //   return NavigasiPage();
                                              // }), (route) => false);
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
