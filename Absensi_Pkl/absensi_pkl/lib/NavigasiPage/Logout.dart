import 'package:absensi_pkl/Authentication/LoginPage.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  void logact(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Log Out?"),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }), (route) => false);
                  },
                  child: Text("Yes"))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    logact(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
      ),
    );
  }
}
