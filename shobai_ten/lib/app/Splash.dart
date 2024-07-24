import 'package:flutter/material.dart';

class Waiting extends StatefulWidget {
  const Waiting({super.key});

  @override
  State<Waiting> createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: Center(
                  child: Container(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/gam6.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ),
            Container(
              height: 240,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create By @NeordSky",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
