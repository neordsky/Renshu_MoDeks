import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/retry.dart';
import 'package:jiken/Model/UserMo.dart';
import 'package:http/http.dart' as http;
import 'package:jiken/Page%20Utama/Navi.dart';
import 'package:jiken/Provider/UserPro.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController notelp = TextEditingController();

  bool Me = true;
  bool kai = true;
  FocusNode fn1 = FocusNode();
  FocusNode fn2 = FocusNode();
  FocusNode fn3 = FocusNode();
  FocusNode fn4 = FocusNode();
  static List<UserMo> _Lit = [];
  bool load = true;

  static get DateFormat => null;
  Future<List<UserMo>> fetda() async {
    final respo =
        await http.get(Uri.parse("http://10.0.2.2:2000/api/users/get"));

    if (respo.statusCode == 200) {
      setState(() {
        load = false;
      });
    }
    var data = jsonDecode(respo.body);
    List<UserMo> LIu = List.from(data['data'].map((e) => UserMo.fromJson(e)));
    return LIu;
  }

  Future Ins(BuildContext context) async {
    final Resp =
        await http.post(Uri.parse("http://10.0.2.2:2000/api/users/post"),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              "Id": _Lit.last.id + 1,
              "Username": username.text,
              "Password": password.text,
              "Alamat": alamat.text
            }));
    if (Resp.statusCode == 200) {
      username.text = "";
      password.text = "";
      alamat.text = "";
      notelp.text = "";

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Create Account Success..!")));
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Informasi"),
              content: Text(
                  "Create account Succes Silahkan Masukan Account Yang Telah anda Buat"),
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
      fetda();
      getu();
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Create Account Failed..!")));
      return false;
    }
  }

  void getu() async {
    final day = await fetda();
    setState(() {
      _Lit = day;
    });
  }

  List<UserMo> Log = List.from(_Lit);
  void che(String Userna) {
    setState(() {
      Log = _Lit.where((element) => element.username == Userna).toList();
    });
  }

  @override
  void initState() {
    fetda();
    getu();
    print(kai);
    kai;
    Me;

    super.initState();
    fn1.addListener(() {
      if (!fn1.hasFocus) {
        FocusScope.of(context).requestFocus(fn2);
      }
    });
    fn2.addListener(() {
      if (!fn2.hasFocus) {
        FocusScope.of(context).requestFocus(fn3);
      }
    });
    fn3.addListener(() {
      if (!fn3.hasFocus) {
        FocusScope.of(context).requestFocus(fn4);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(fn1);
    });

    // TODO: implement in
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final da = Provider.of<UserPro>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ////APPBAR BAGIAN AWAL
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.1),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.05,
              color: Colors.purple,
              child: Center(
                child: Text(
                  "Authentication",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            ////APPPBARRR BAGIAN AKHIR
            ///
            ///
            ///BUTTON ACTION LOGIN BAGIAN AWAL
            InkWell(
              onTap: () {
                if (kai) {
                  if (username.text.isEmpty || password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Lengkapi dulu data")));
                  } else {
                    che(username.text);
                    if (Log.length == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Data Not Found..!")));
                    } else {
                      da.addata(Log[0].id, Log[0].alamat, Log[0].username,
                          Log[0].password);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return NaviPage();
                      }), (route) => false);
                    }
                  }
                } else {
                  if (username.text.isEmpty ||
                      alamat.text.isEmpty ||
                      password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Lengkapi dulu data")));
                  } else {
                    Ins(context);
                    setState(() {
                      kai = true;
                    });
                  }
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: (kai == true)
                        ? MediaQuery.of(context).size.height * 0.8
                        : MediaQuery.of(context).size.height * 0.88,
                    left: MediaQuery.of(context).size.width * 0.2),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.05,
                color: (kai == true) ? Colors.yellow : Colors.blueAccent,
                child: Center(child: Text((kai == true) ? "Login" : "Create")),
              ),
            ),

            ///////BUTTON ACTION LOGIN BAGIAN AKHIRRR
            ///
            ///
            ///
            ///

            /////CONTAINER FOR TEXTFILD INPUTAN USERSS BAGIAN AWAL
            ///
            ///
            Container(
              margin: EdgeInsets.only(
                  top: (kai == true)
                      ? MediaQuery.of(context).size.height * 0.2
                      : MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width * 0.1),
              width: MediaQuery.of(context).size.width * 0.8,
              height: (kai == true)
                  ? MediaQuery.of(context).size.height * 0.55
                  : MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1), blurRadius: 1, spreadRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        (kai == true) ? "Login" : "Create ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: TextField(
                        focusNode: fn1,
                        controller: username,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          FocusScope.of(context).requestFocus(fn2);
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            FocusScope.of(context).requestFocus(fn2);
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Input Your Username"),
                      )),

                  Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextField(
                              controller: password,
                              obscureText: Me,
                              focusNode: fn2,
                              textInputAction: TextInputAction.next,
                              onSubmitted: (_) {
                                if (kai == true) {
                                  FocusScope.of(context).requestFocus(fn3);
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    FocusScope.of(context).requestFocus(fn3);
                                  });
                                } else {}
                              },
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "Input Your Password"),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                if (Me) {
                                  setState(() {
                                    Me = false;
                                  });
                                } else {
                                  setState(() {
                                    Me = true;
                                  });
                                }
                              },
                              icon: Icon(Icons.remove_red_eye))
                        ],
                      )),

                  /////CONTAINER FOR TEXTFILD INPUTAN USERSS BAGIAN AKHIR
                  ///
                  ///

                  /// /////TEXTFILD INPUTAN USERSS FOR NEW ACCOUNT BAGIAN AWAL
                  ///
                  ///
                  ///

                  (kai == true)
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  kai = false;
                                  print(kai);
                                });
                              },
                              child: Text(
                                "Create New Account?",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [],
                          ),
                        ),
                  (kai == true)
                      ? Container()
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: alamat,
                            focusNode: fn3,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) {
                              FocusScope.of(context).requestFocus(fn4);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                FocusScope.of(context).requestFocus(fn4);
                              });
                            },
                            decoration: InputDecoration(
                                labelText: "Alamat",
                                hintText: "Input Your Alamat"),
                          )),

                  (kai == true)
                      ? Container()
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextField(
                            controller: notelp,
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            focusNode: fn4,
                            decoration: InputDecoration(
                                labelText: "No Telp",
                                hintText: "Input Your No Telepon"),
                          )),
                  (kai == true)
                      ? Container()
                      : Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  kai = true;
                                  kai = true;
                                });
                              },
                              child: Icon(Icons.arrow_back),
                            )
                          ],
                        ),

                  /// /////TEXTFILD INPUTAN USERSS FOR NEW ACCOUNT BAGIAN AKHIR
                ],
              ),
            ),

            ///Button Login Action////////
            ///
            ///
          ],
        ),
      ),
    );
  }
}
