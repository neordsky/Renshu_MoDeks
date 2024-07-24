import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shobai_ten/app/Provider/UserProv.dart';
import 'package:shobai_ten/app/modules/home/Models/UserMo.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shobai_ten/app/modules/home/views/home_view.dart';

class EdithAcount extends StatefulWidget {
  int Id;
  String Username;
  String Password;
  String Alamat;
  EdithAcount(this.Id, this.Username, this.Password, this.Alamat);

  @override
  State<EdithAcount> createState() => _EdithAcountState();
}

class _EdithAcountState extends State<EdithAcount> {
  TextEditingController Username = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController Alamat = new TextEditingController();
  static List<UserProMo> Data = [];
  bool _loadi = true;
  bool ki = true;
  Future Upda(BuildContext context) async {
    final ins = Provider.of<UserProv>(context, listen: false);
    try {
      final Resp =
          await http.put(Uri.parse('http://10.0.2.2:2000/api/users/put'),
              headers: {"Content-Type": "application/json; Charset=UTF-8"},
              body: jsonEncode({
                "Id": widget.Id,
                "Username": Username.text,
                "Password": Password.text,
                "Alamat": Alamat.text
              }));
      if (Resp.statusCode == 200) {
        ins.Upda(widget.Id, Username.text, Password.text, Alamat.text);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Data Berhasil di Ubah")));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (cont) {
          return NavigasiPage(3);
        }), (route) => false);
        return true;
      } else {
        showDialog(
            context: context,
            builder: (cont) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(Resp.statusCode.toString() +
                    "Server Error Periksa Username Agar tidak sama atau Reset aplikasi"),
                actions: [
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text("Oke"),
                    ),
                  )
                ],
              );
            });
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<UserProMo>> Get() async {
    final res = await http.get(Uri.parse("http://10.0.2.2:2000/api/users/get"));
    if (res.statusCode == 200) {
      setState(() {
        _loadi = false;
      });
    }
    var data = jsonDecode(res.body);
    List<UserProMo> Li = List.from(data['data'].map((e) => UserProMo.fromjson(e)));
    return Li;
  }

  void Getu() async {
    final datas = await Get();
    setState(() {
      Data = datas;
    });
  }

  List<UserProMo> Us = List.from(Data);
  void check(String Username) {
    setState(() {
      Us = Data.where((element) => element.Username == Username).toList();
    });
  }

  @override
  void initState() {
    Get();
    Getu();
    Username.text = widget.Username;
    Password.text = widget.Password;
    Alamat.text = widget.Alamat;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
            color: const Color.fromARGB(255, 199, 185, 185),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.8,
                left: MediaQuery.of(context).size.width * 0.77),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (cont) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: Text("Ubah Data Account?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No")),
                            OutlinedButton(
                                onPressed: () {
                                  Upda(context);

                                  Navigator.of(context).pop();
                                },
                                child: Text("Yes"))
                          ],
                        )
                      ],
                    );
                  });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              color: Colors.yellowAccent,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.78,
                  left: MediaQuery.of(context).size.width * 0.3),
              child: Center(
                child: Text(
                  "Edit",
                  style: TextStyle(
                      fontSize: 23,
                      color: const Color.fromARGB(255, 136, 186, 226),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              color: const Color.fromARGB(255, 179, 217, 248),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.8,
                  left: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 1,
              color: const Color.fromARGB(255, 190, 171, 241),
              child: ListTile(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20,
                    )),
                subtitle: Center(
                  child: Text(
                    "Edit account",
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              )),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14,
                  left: MediaQuery.of(context).size.width * 0.2),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.deepPurpleAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person,
                    size: 23,
                  ),
                  Center(
                    child: Text(
                      widget.Username,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Text(
                    widget.Id.toString(),
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              )),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1), spreadRadius: 5, blurRadius: 5)
                ]),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: double.infinity,
                      color: Colors.deepPurple,
                      child: Center(
                        child: Text(
                          "Edith Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [Text("Username")],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: Username,
                              onChanged: (value) => check(value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [Text("Password")],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: Password,
                              obscureText: ki,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (ki == false) {
                                    ki = true;
                                  } else {
                                    ki = false;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_red_eye_sharp))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [Text("Alamat")],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: Alamat,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
