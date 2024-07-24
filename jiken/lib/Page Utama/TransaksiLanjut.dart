import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:jiken/Provider/ShikePro.dart';
import 'package:jiken/Provider/UserPro.dart';
import 'package:jiken/noticontrol.dart';
import 'package:provider/provider.dart';

class TranLan extends StatefulWidget {
  const TranLan({super.key});

  @override
  State<TranLan> createState() => _TranLanState();
}

class _TranLanState extends State<TranLan> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: noticontrol.onactionreceivedmethod,
        onNotificationCreatedMethod: noticontrol.onnoticred,
        onDismissActionReceivedMethod: noticontrol.ondismissmethod,
        onNotificationDisplayedMethod: noticontrol.onnotidisplaymethod);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pr = Provider.of<UserPro>(context);
    final dap = pr.Data;
    final pri = Provider.of<ShikePro>(context);
    final dapri = pri.Data;
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout Barang"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              color: Color.fromARGB(255, 166, 185, 238),
              child: Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Icon(
                    Icons.person,
                    size: 85,
                    color: Colors.white,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Username::" + dap[0].username,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Id::" + dap[0].id.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Alamat::" + dap[0].alamat,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
              width: double.infinity,
              color: Color.fromARGB(255, 3, 39, 138),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.73,
              width: double.infinity,
              color: Color.fromARGB(255, 231, 231, 233).withOpacity(0.9),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Daftar Barang Checkout"),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.62,
                      width: double.infinity,
                      child: ListView(
                        children: List.generate(
                            dapri.length,
                            (index) => Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: double.infinity,
                                  color:
                                      const Color.fromARGB(255, 224, 218, 218)
                                          .withOpacity(0.9),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              "http://10.0.2.2:2000/image/${dapri[index].Img}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        child: Column(children: [
                                          Row(
                                            children: [
                                              Text(
                                                dapri[index].Naba,
                                                style: TextStyle(
                                                    color: Colors.purpleAccent,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(dapri[index].Kb.toString()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "Rp." +
                                                      dapri[index]
                                                          .Haba
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.deepPurple,
                                                      fontSize: 20)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(dapri[index]
                                                      .quantity
                                                      .toString() +
                                                  "X"),
                                            ],
                                          ),
                                          Text("Total Harga:: Rp." +
                                              dapri[index].totaba.toString())
                                        ]),
                                      )
                                    ],
                                  ),
                                )),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              spreadRadius: 1,
                              blurRadius: 2)
                        ],
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Semua Harga::" +
                            "Rp." +
                            pri.JumTol.toString()),
                        OutlinedButton(
                            onPressed: () {
                              AwesomeNotifications().createNotification(
                                  content: NotificationContent(
                                      id: int.parse(DateTime.now()
                                          .microsecond
                                          .toString()),
                                      channelKey: "Basic_Channel",
                                      title: "Notification",
                                      body:
                                          "You Have Transaksi Product ${dapri[1].Naba}"));
                            },
                            child: Text("Bayar Now..!"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
