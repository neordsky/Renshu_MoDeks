import 'package:absensi_pkl/Provider/LaporanProv.dart';
import 'package:absensi_pkl/Provider/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenulisLaporanPage extends StatefulWidget {
  const MenulisLaporanPage({super.key});

  @override
  State<MenulisLaporanPage> createState() => _MenulisLaporanPageState();
}

class _MenulisLaporanPageState extends State<MenulisLaporanPage> {
  TextEditingController lapor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ins = Provider.of<LaporanProv>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.4),
        title: Center(
          child: Text("Tambah Laporan"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            children: [
              Container(
                  color: Colors.grey.withOpacity(0.4),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (lapor.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Tulis Dulu Laporan Anda")));
                            } else {
                              ins.AddData(ins.IndLap, lapor.text,
                                  DateTime.now().toString());
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Save Berhasil")));
                              Navigator.of(context).pop();
                            }
                          },
                          icon: Icon(
                            Icons.save,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {
                            if (lapor.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Tidak ada yang bisa di hapus")));
                            } else {
                              lapor.text = "";
                            }
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  )),
              Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: TextField(
                    controller: lapor,
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(hintText: "Tulis Laporan Anda"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
