import 'package:flutter/material.dart';
import 'package:jiken/Page%20Utama/Login.dart';
import 'package:jiken/Provider/UserPro.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    final Pro = Provider.of<UserPro>(context);
    final dap = Pro.Data;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              color: Color.fromARGB(255, 5, 44, 153),
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
              height: MediaQuery.of(context).size.height * 0.02,
              width: double.infinity,
              color: Color.fromARGB(255, 181, 240, 250),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.66,
              width: double.infinity,
              color: Color.fromARGB(255, 250, 250, 250).withOpacity(0.9),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Kompirmasi..!"),
                              content: Text("Logout Dari Account Ini?"),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("NO")),
                                    OutlinedButton(
                                        onPressed: () {
                                          Pro.deldata(dap[0].id);
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (cont) =>
                                                          LoginPage()),
                                                  (route) => false);
                                        },
                                        child: Text("YES"))
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                spreadRadius: 1,
                                blurRadius: 2)
                          ]),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: Text("Leave.."),
                      ),
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
