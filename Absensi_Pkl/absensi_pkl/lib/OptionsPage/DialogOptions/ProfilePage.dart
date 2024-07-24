import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController userBox = TextEditingController();
  TextEditingController passBox = TextEditingController();
  TextEditingController passconBox = TextEditingController();
  TextEditingController kompetensiBox = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: TextStyle(fontSize: 23),
          ),
          IconButton(
              onPressed: () {
                userBox.text = "";
                passBox.text = "";
                passconBox.text = "";
                kompetensiBox.text = "";
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close))
        ],
      ),
      content: Container(
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("Username"),
                  ],
                ),
                TextField(
                  controller: userBox,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Username"),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text("Password"),
                  ],
                ),
                TextField(
                  controller: passBox,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Password"),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text("Konfirmasi Password"),
                  ],
                ),
                TextField(
                  controller: passconBox,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Konfirmasi Password"),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text("Kompetensi"),
                  ],
                ),
                TextField(
                  controller: kompetensiBox,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Kompetensi Anda"),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.bottomRight,
          child: OutlinedButton(
              onPressed: () {
                userBox.text = "";
                passBox.text = "";
                passconBox.text = "";
                kompetensiBox.text = "";
                Navigator.of(context).pop();
              },
              child: Text("Kembali")),
        )
      ],
    );
  }
}
