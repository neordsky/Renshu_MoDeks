import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        color: const Color.fromARGB(255, 247, 243, 243),
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
                  "Absensi Pkl",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  left: MediaQuery.of(context).size.width * 0.2),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
