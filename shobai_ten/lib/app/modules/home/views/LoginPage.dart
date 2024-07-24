import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shobai_ten/app/Provider/UserProv.dart';
import 'package:shobai_ten/app/modules/home/Models/UserMo.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shobai_ten/app/modules/home/views/home_view.dart';
import 'package:intl/intl.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController Username = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController Alamat = new TextEditingController();
  static List<UserMo> Data = [];
  bool _loadi = true;
  static String token = '';

  var neid = int.parse(DateFormat.m().format(DateTime.now()) +
      DateFormat.s().format(DateTime.now()));

  Future Ins(BuildContext context) async {
    final logi = Provider.of<UserProv>(context);
    try {
      assert(neid is int);
      final resp =
          await http.post(Uri.parse('http://10.0.2.2:2000/api/users/post'),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body: jsonEncode({
                'Id': neid,
                "Username": Username.text,
                "Password": Password.text,
                "Alamat": Alamat.text
              }));
      if (resp.statusCode == 200) {
        logi.adddata(Username.text, neid, Password.text, Alamat.text);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Create new account succes")));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (cont) {
          return NavigasiPage(0);
        }), (route) => false);
        return true;
      } else {
        showDialog(
            context: context,
            builder: (cont) {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Stack(children: [
                    Container(
                      color: Color.fromARGB(255, 165, 188, 229),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.6),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Container(
                      color: Color.fromARGB(255, 165, 188, 229),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.3),
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Color.fromARGB(255, 165, 188, 229),
                            child: Text(
                              "Error..!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.27,
                          left: MediaQuery.of(context).size.width * 0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Color.fromARGB(255, 165, 188, 229),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 5,
                            color: Color.fromARGB(255, 200, 220, 253))
                      ]),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          FittedBox(
                            child: Text(
                              "Server Error Periksama Username agar tidak sama atau Riset aplikasi",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Oke"))
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            });
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future GetUser(String Usna, String Pass, BuildContext context) async {
    // var quer = {'where': 'Username =  $Usna AND Password = $Pass'};
    // var url = Uri.parse("http://10.0.2.2:2000/api/users/login");
    // url = Uri.https(url.authority, url.path, quer);
    // final res = await http.get(url);

    final res = await http.get(Uri.parse(
        "http://10.0.2.2:2000/api/users/login?where=Username=$Usna&Password=$Pass"));

    if (res.statusCode == 200) {
      setState(() {
        _loadi = false;
      });
    }
    var data = jsonDecode(res.body);
    token = data.toString();
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('Token', token);

    if (Username.text.isEmpty && Password.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Lengkapi dulu data anda"),
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
      if (token == '') {
        showDialog(
            context: context,
            builder: (cont) {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 5,
                            color: Color.fromARGB(255, 200, 220, 253))
                      ]),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Text(
                            "Data tidak dikenali",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Oke"))
                        ],
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 165, 188, 229),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.6),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Container(
                      color: Color.fromARGB(255, 165, 188, 229),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.3),
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Color.fromARGB(255, 165, 188, 229),
                            child: Text(
                              "Not Found..!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.27,
                          left: MediaQuery.of(context).size.width * 0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Color.fromARGB(255, 165, 188, 229),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login success")));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (cont) {
          return NavigasiPage(0);
        }), (route) => false);
      }
    }

    return token;
  }

  bool Pass = true;

  // List<UserMo> Us = List.from(Data);
  // void check(String Username) {
  //   setState(() {
  //     Us = Data.where((element) => element.Username == Username).toList();
  //   });
  // }

  bool kai = false;
  @override
  void initState() {
    assert(neid is int);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final log = Provider.of<UserProv>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 206, 206),
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
              if (kai == true) {
                if (Username.text.isEmpty && Password.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Lengkapi dulu data anda"),
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
                  GetUser(Username.text, Password.text, context);
                  print(Username.text);
                  print(Password.text);
                  print(Alamat.text);
                }
              } else {
                if (Username.text.isEmpty &&
                    Password.text.isEmpty &&
                    Alamat.text.isEmpty) {
                } else {
                  GetUser(Username.text, Password.text, context);
                }
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              color: (kai == true) ? Colors.yellowAccent : Colors.blueAccent,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.78,
                  left: MediaQuery.of(context).size.width * 0.3),
              child: Center(
                child: Text(
                  (kai == true) ? "Create " : "Login",
                  style: TextStyle(
                      fontSize: 23,
                      color: (kai == true)
                          ? const Color.fromARGB(255, 140, 228, 143)
                          : Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.deepPurpleAccent,
              child: Center(
                child: Text(
                  "Shobai Ten App",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.14,
                left: MediaQuery.of(context).size.width * 0.2),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.6,
            color: Colors.deepPurpleAccent,
            child: Center(
              child: Text(
                "Authentication",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: (kai == true)
                    ? MediaQuery.of(context).size.height * 0.5
                    : MediaQuery.of(context).size.height * 0.5,
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
                          (kai == true) ? "Create" : "Login",
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
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: Password,
                              obscureText: Pass,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (Pass == false) {
                                    Pass = true;
                                  } else {
                                    Pass = false;
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
                    (kai == true)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [Text("Alamat")],
                            ),
                          )
                        : Container(),
                    (kai == true)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: TextField(
                                    controller: Alamat,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          kai = true;
                                        });
                                      },
                                      child: Text(
                                        "Create new account..",
                                        style: TextStyle(color: Colors.cyan),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                    (kai == true)
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            kai = false;
                                          });
                                        },
                                        icon: Icon(Icons.arrow_back))
                                  ],
                                )
                              ],
                            ),
                          )
                        : Container()
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

class Clippa extends CustomClipper<Path> {
  BuildContext get context => context;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(0, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
