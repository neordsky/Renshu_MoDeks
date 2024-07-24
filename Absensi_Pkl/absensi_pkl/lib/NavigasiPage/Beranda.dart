import 'dart:async';

import 'package:absensi_pkl/Clock.dart';
import 'package:absensi_pkl/NavigasiPage/Camera.dart';
import 'package:absensi_pkl/OptionsPage/DialogOptions/BimBinganDialog.dart';
import 'package:absensi_pkl/OptionsPage/DialogOptions/KehadiranDialog.dart';
import 'package:absensi_pkl/OptionsPage/DialogOptions/KontakDialog.dart';
import 'package:absensi_pkl/OptionsPage/DialogOptions/PengajuanIzinSakitDialog.dart';
import 'package:absensi_pkl/OptionsPage/LaporanPage.dart';
import 'package:absensi_pkl/OptionsPage/DialogOptions/ProfilePage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  String _seleCombo = " -- Pilih Jenis --";
  String _seleComboKompe = "-- Pilih Kompetensi Dasar --";
  DateTime selectDate = DateTime.now();

  TextEditingController lapor = TextEditingController();
  TextEditingController suratbox = TextEditingController();
  TextEditingController masalahbox = TextEditingController();
  TextEditingController solusibox = TextEditingController();
  TextEditingController tglIjin = TextEditingController();
  TextEditingController keteranganbox = TextEditingController();
  TextEditingController deskripsipekerjaanbox = TextEditingController();

  Position? _userposition;
  String _currentTime = '';

  void _updateTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    var now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
  }

  void _GetLocationUser() async {
    final posi = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userposition = posi;
    });
  }

  List<String> dataijin = ["Sakit", "Ijin"];

  @override
  void initState() {
    _updateTime();
    _seleCombo = "-- Pilih Jenis --";
    tglIjin.text = selectDate.toString();
    _GetLocationUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.46,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Center(
                      child: Container(
                        child: Image.asset("assets/logo.png"),
                        width: MediaQuery.of(context).size.height * 0.2,
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                    ),
                    Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 57, 134, 60),
                            ),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Center(
                                child: Text(
                              "12 RPL 3",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 149, 155, 149),
                            ),
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Center(
                                child: Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              height: MediaQuery.of(context).size.height * 0.09,
                              child: Image.asset("assets/logo.png")),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Expanded(
                              child: Text(
                                  "Dins Pendidikan \n Majalengka \n Jarak Realtime : ${_userposition != null ? 'Latitude: ${_userposition!.latitude}, Longitude: ${_userposition!.longitude}' : "Getting Location...."} \n ${DateFormat.E().format(DateTime.now()) + "," + DateFormat.yMMMd().format(DateTime.now())} | $_currentTime WIB"))
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.2),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 1,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    )
                                  ], color: Colors.white),
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Color.fromARGB(255, 66, 145, 68),
                                  child: Center(
                                    child: Text(
                                      "Masuk",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text(
                                  "07.00 WIB",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 1,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    )
                                  ], color: Colors.white),
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Color.fromARGB(255, 221, 51, 51),
                                  child: Center(
                                    child: Text(
                                      "Keluar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text(
                                  "14.00 WIB",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.38),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.01,
                color: Colors.grey.withOpacity(0.1),
              ),
              ////AKHIR APPBAR
              ///
              ///AWAL CARD OPTIONS BUTTON
              ///
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            blurRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.42),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Surat",
                                                  style:
                                                      TextStyle(fontSize: 23),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      suratbox.text = "";
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    icon: Icon(Icons.close))
                                              ],
                                            ),
                                            content: Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.45,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Judul",
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                    ],
                                                  ),
                                                  TextField(
                                                    controller: suratbox,
                                                    maxLines: null,
                                                    textInputAction:
                                                        TextInputAction.newline,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Tulis Judul Surat Anda"),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.07,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "File",
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.07,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text("Browse..."),
                                                        Text("No File selected")
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        "Maksimum 30MB, Hanya format file PDF,Doc, atau DOCX yang diizinkan."),
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {},
                                                          child:
                                                              Text("Unggah")),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: OutlinedButton(
                                                    onPressed: () {
                                                      lapor.text = "";
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Kembali")),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.email,
                                    size: 35,
                                    color: Colors.yellow,
                                  ),
                                  tooltip: "Surat",
                                ),
                                Text("Surat")
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Laporan",
                                                  style:
                                                      TextStyle(fontSize: 23),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      lapor.text = "";
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    icon: Icon(Icons.close))
                                              ],
                                            ),
                                            content: Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: TextField(
                                                controller: lapor,
                                                maxLines: null,
                                                textInputAction:
                                                    TextInputAction.newline,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Tulis Laporan Anda"),
                                              ),
                                            ),
                                            actions: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: OutlinedButton(
                                                    onPressed: () {
                                                      lapor.text = "";
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Kembali")),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.book,
                                    size: 35,
                                    color: const Color.fromARGB(
                                        255, 182, 174, 101),
                                  ),
                                  tooltip: "Laporan",
                                ),
                                Text("Laporan")
                              ],
                            ),
                            ////Awal Jurnal
                            ///
                            ///
                            ///
                            ///AWAL JURNAL
                            ///
                            ///AWAL JURNAL
                            ///
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Jurnal Harian",
                                                        style: TextStyle(
                                                            fontSize: 23),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            _seleComboKompe =
                                                                "-- Pilih Kompetensi Dasar";
                                                            deskripsipekerjaanbox
                                                                .text = "";
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          icon:
                                                              Icon(Icons.close))
                                                    ],
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                "Hari Ini :",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Colors
                                                                        .grey),
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.1,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.04,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text(
                                                                  "Semua :",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Colors
                                                                          .grey),
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.1,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.04,
                                                                )
                                                              ]),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            content: SingleChildScrollView(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Kompetensi Dasar",
                                                          style: TextStyle(
                                                              fontSize: 19),
                                                        ),
                                                      ],
                                                    ),
                                                    DropdownSearch<String>(
                                                      popupProps:
                                                          PopupProps.menu(
                                                        showSelectedItems: true,
                                                      ),
                                                      items: [
                                                        "Tekik Jaringan Komputer",
                                                        "Rekayasa Perangkat Lunak",
                                                        "Desain Komunikasi Visual",
                                                        "Teknik Kimia Industri",
                                                        "Busana",
                                                        "Produksi dan Siaran Program Televisi",
                                                        "Teknik Otomotif",
                                                        "Teknik Elektronika Industri"
                                                      ],
                                                      dropdownDecoratorProps:
                                                          DropDownDecoratorProps(
                                                        dropdownSearchDecoration:
                                                            InputDecoration(
                                                          labelText: "Menu Box",
                                                          hintText:
                                                              "-- Pilih Kompetensi Dasar --",
                                                        ),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _seleComboKompe =
                                                              value.toString();
                                                        });
                                                      },
                                                      selectedItem:
                                                          _seleComboKompe,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Deskripsi Pekerjaan",
                                                          style: TextStyle(
                                                              fontSize: 19),
                                                        ),
                                                      ],
                                                    ),
                                                    TextField(
                                                      controller:
                                                          deskripsipekerjaanbox,
                                                      maxLines: null,
                                                      textInputAction:
                                                          TextInputAction
                                                              .newline,
                                                      decoration:
                                                          InputDecoration(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  OutlinedButton(
                                                      onPressed: () {},
                                                      child:
                                                          Text("Lihat Detail")),
                                                  OutlinedButton(
                                                      onPressed: () {
                                                        masalahbox.text = "";
                                                        solusibox.text = "";
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text("Simpan")),
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.edit_document,
                                    size: 35,
                                    color:
                                        const Color.fromARGB(255, 34, 137, 221),
                                  ),
                                  tooltip: "Jurnal",
                                ),
                                Text("Jurnal")
                              ],
                            ),

                            ///AKHIR JURNAL AKHIR JURNAL
                            ///
                            ///
                            ///AKHIR JURNAL
                            ///
                            ///
                            ///AWAL BIMBINGAN
                            ///
                            ///AWAL BIMBINGAN
                            ///
                            ///
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: AlertDialog(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Bimbingan",
                                                    style:
                                                        TextStyle(fontSize: 23),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        solusibox.text = "";
                                                        masalahbox.text = "";
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: Icon(Icons.close))
                                                ],
                                              ),
                                              content: SingleChildScrollView(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.9,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Permasalahan",
                                                            style: TextStyle(
                                                                fontSize: 19),
                                                          ),
                                                        ],
                                                      ),
                                                      TextField(
                                                        controller: masalahbox,
                                                        maxLines: null,
                                                        textInputAction:
                                                            TextInputAction
                                                                .newline,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                "Tulis masalah Anda"),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Solusi/Tindak Lanjut",
                                                            style: TextStyle(
                                                                fontSize: 19),
                                                          ),
                                                        ],
                                                      ),
                                                      TextField(
                                                        controller: solusibox,
                                                        maxLines: null,
                                                        textInputAction:
                                                            TextInputAction
                                                                .newline,
                                                        decoration:
                                                            InputDecoration(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    OutlinedButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                            "Lihat Detail")),
                                                    OutlinedButton(
                                                        onPressed: () {
                                                          masalahbox.text = "";
                                                          solusibox.text = "";
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("Kembali")),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.personCircleQuestion,
                                    size: 35,
                                    color: const Color.fromARGB(
                                        255, 128, 198, 255),
                                  ),
                                  tooltip: "Bimbingan",
                                ),
                                Text("Bimbingan")
                              ],
                            ),
                          ],
                        ),
                      ),

                      ///AKHIR BIMBINGAN
                      ///
                      ///AKHIR BIMBINGAN
                      ///
                      ///
                      ///AWAL KEHADIRAN
                      ///
                      ///AWAL KEHADIRAN
                      ///
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return KehadiranDialog();
                                        });
                                  },
                                  icon: Icon(
                                    Icons.person_add_rounded,
                                    size: 35,
                                  ),
                                  tooltip: "Kehadiran",
                                ),
                                Text("Kehadiran")
                              ],
                            ),
                            /////AKHIR KEHADIRAN
                            ///
                            ///AKHIR KEHADIRAN
                            ///
                            ///
                            ///AWAL IZINN
                            ///
                            ///AWAL IZINN
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Pengajuan Izin/Sakit",
                                                  style:
                                                      TextStyle(fontSize: 23),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      _seleCombo =
                                                          "-- Pilih Jenis --";
                                                      keteranganbox.text = "";
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    icon: Icon(Icons.close))
                                              ],
                                            ),
                                            content: SingleChildScrollView(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.9,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Pilih Jenis",
                                                          style: TextStyle(
                                                              fontSize: 19),
                                                        ),
                                                      ],
                                                    ),
                                                    DropdownSearch<String>(
                                                      popupProps:
                                                          PopupProps.menu(
                                                        showSelectedItems: true,
                                                      ),
                                                      items: ["Sakit", "Ijin"],
                                                      dropdownDecoratorProps:
                                                          DropDownDecoratorProps(
                                                        dropdownSearchDecoration:
                                                            InputDecoration(
                                                          labelText: "Menu Box",
                                                          hintText:
                                                              "-- Pilih Jenis --",
                                                        ),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _seleCombo =
                                                              value.toString();
                                                        });
                                                      },
                                                      selectedItem: _seleCombo,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Tanggal",
                                                          style: TextStyle(
                                                              fontSize: 19),
                                                        ),
                                                      ],
                                                    ),
                                                    TextField(
                                                      readOnly: true,
                                                      controller: tglIjin,
                                                      decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          suffixIcon: Icon(Icons
                                                              .date_range)),
                                                      onTap: () {
                                                        showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    selectDate,
                                                                firstDate:
                                                                    DateTime(
                                                                        2023),
                                                                lastDate:
                                                                    DateTime(
                                                                        2025))
                                                            .then((value) {
                                                          if (value != null) {
                                                            tglIjin.text = value
                                                                .toString();
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Keterangan",
                                                          style: TextStyle(
                                                              fontSize: 19),
                                                        ),
                                                      ],
                                                    ),
                                                    TextField(
                                                      controller: keteranganbox,
                                                      maxLines: null,
                                                      textInputAction:
                                                          TextInputAction
                                                              .newline,
                                                      decoration:
                                                          InputDecoration(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  OutlinedButton(
                                                      onPressed: () {},
                                                      child:
                                                          Text("Lihat Detail")),
                                                  OutlinedButton(
                                                      onPressed: () {
                                                        _seleCombo =
                                                            "-- Pilih Jenis --";
                                                        keteranganbox.text = "";
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text("Kembali")),
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.person_off,
                                    color: Colors.yellow,
                                    size: 35,
                                  ),
                                  tooltip: "Izin",
                                ),
                                Text("Izin")
                              ],
                            ),
                            ////AKHIR IZIN"
                            ///
                            ///
                            ///AKHIR IZINN
                            ///
                            ///AWAL KONTAK
                            ///
                            ///AWAL KONTAKK
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return KontakDialog();
                                          });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.whatsapp,
                                      size: 35,
                                      color: const Color.fromARGB(
                                          255, 63, 155, 66),
                                    )),
                                Text("Kontak")
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => ProfilePage());
                                  },
                                  icon: FaIcon(
                                    Icons.person,
                                    color: Colors.blue,
                                    size: 35,
                                  ),
                                  tooltip: "Profile",
                                ),
                                Text("Profile")
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1), spreadRadius: 1, blurRadius: 1)
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.73),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.23,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          "Informasi",
                          style: TextStyle(color: Colors.white),
                        ))),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(1, 1),
                                            spreadRadius: 1,
                                            blurRadius: 1)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Column(
                                    children: [
                                      Text("Informasi"),
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        child: Expanded(
                                          child: SingleChildScrollView(
                                            child: Text(
                                                "97123879`18273`187362173192741928434523234134252341242354352342371920`19803`129`81728618745234123123123`123124234123236"),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
