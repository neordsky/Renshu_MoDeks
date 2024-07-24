import 'package:flutter/material.dart';
import 'package:jiken/Page%20Utama/Keranpa.dart';
import 'package:jiken/Page%20Utama/Produk.dart';
import 'package:jiken/Page%20Utama/SagashPage.dart';
import 'package:jiken/Page%20Utama/Sagashu.dart';

class Berandapage extends StatefulWidget {
  const Berandapage({super.key});

  @override
  State<Berandapage> createState() => _BerandapageState();
}

class _BerandapageState extends State<Berandapage> {
  int op = 0;

  List<Widget> pa = [ProduPage(), Keranpa()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colors.purpleAccent,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Welcome to YoTen",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.08),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SagashuPage();
                                }));
                              },
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    hintText: "Seacrh Produk",
                                    labelText: "Search",
                                    enabled: false),
                              ),
                            ),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.search))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.22),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            op = 0;
                          });
                        },
                        child: Text(
                          "Produk",
                          style: TextStyle(
                              fontSize: (op == 0) ? 18 : 14,
                              color:
                                  (op == 0) ? Colors.deepPurple : Colors.grey),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            setState(() {
                              op = 1;
                            });
                          },
                          child: Text(
                            "Keranjang",
                            style: TextStyle(
                                fontSize: (op == 1) ? 18 : 14,
                                color: (op == 1)
                                    ? Colors.deepPurple
                                    : Colors.grey),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: MediaQuery.of(context).size.height * 0.5,
                    height: MediaQuery.of(context).size.height * 0.01,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SingleChildScrollView(
                    child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.57,
                        child: pa[op]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
