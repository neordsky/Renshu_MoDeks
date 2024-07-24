import 'package:absensi_pkl/NavigasiPage/Navigasi.dart';
import 'package:absensi_pkl/OptionsPage/MenulisLaporan.dart';
import 'package:absensi_pkl/Provider/LaporanProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  @override
  Widget build(BuildContext context) {
    final Li = Provider.of<LaporanProv>(context);
    final data = Li.Data;
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
              child: (data.length == 0)
                  ? Center(
                      child: Text(
                        "Tidak Ada Laporan",
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey.withOpacity(0.4),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Expanded(
                                    child: SingleChildScrollView(
                                        child: Text(data[index].IsiLaporan))),
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                "Di Buat Pada ${data[index].Datetime}")
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey.withOpacity(0.6),
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              )
                            ],
                          ),
                        );
                      }),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          color: Colors.green.withOpacity(0.4),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (contex) => NavigasiPages()),
                        (route) => false);
                  },
                  icon: Icon(Icons.arrow_back)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Center(
                  child: Text(
                "Laporan",
              ))
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (conte) => MenulisLaporanPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
