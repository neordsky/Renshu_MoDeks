import 'package:absensi_pkl/NavigasiPage/Navigasi.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.1),
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Text(
                    "Authentication",
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (username.text.isEmpty || password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Lengkapi dulu data")));
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return NavigasiPages();
                    }), (route) => false);
                  }

                  print("yeyy");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.8,
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: const Color.fromARGB(255, 149, 201, 243))
                        ]),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            spreadRadius: 1)
                      ],
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical:
                                MediaQuery.of(context).size.height * 0.04),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              label: Text("Username"),
                              hintText: "Input Your Username"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical:
                                MediaQuery.of(context).size.height * 0.04),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              label: Text("Password"),
                              hintText: "Input Your Password"),
                        ),
                      ),
                      Text("Tidak Punya Account?"),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 116, 162, 240)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
