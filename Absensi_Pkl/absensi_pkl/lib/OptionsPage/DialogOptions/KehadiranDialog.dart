import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KehadiranDialog extends StatefulWidget {
  const KehadiranDialog({super.key});

  @override
  State<KehadiranDialog> createState() => _KehadiranDialogState();
}

class _KehadiranDialogState extends State<KehadiranDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.3,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(offset: Offset(1, 1), spreadRadius: 1, blurRadius: 1)
          ]),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person_add_alt_sharp,
                        size: 45,
                        color: Color.fromARGB(255, 28, 141, 31),
                      ),
                      Text(
                        "Hadir",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 28, 141, 31),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown, child: Text("0"))),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.person_off,
                        size: 45,
                        color: const Color.fromARGB(255, 128, 198, 255),
                      ),
                      Text(
                        "Izin",
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 128, 198, 255),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown, child: Text("0"))),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.personal_injury_rounded,
                        size: 45,
                        color: const Color.fromARGB(255, 196, 179, 33),
                      ),
                      Text(
                        "Sakit",
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 196, 179, 33),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown, child: Text("0"))),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.person_add_disabled_outlined,
                        size: 45,
                        color: Colors.red,
                      ),
                      Text(
                        "Alpa",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        width: MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown, child: Text("0"))),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(onPressed: () {}, child: Text("Lihat Detail")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Kembali'))
            ],
          )
        ],
      ),
    );
  }
}
