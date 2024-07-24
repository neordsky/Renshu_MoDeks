import 'dart:io';

import 'package:absensi_pkl/Authentication/LoginPage.dart';
import 'package:absensi_pkl/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Camera")),
          backgroundColor: Colors.green.withOpacity(0.4),
        ),
        body: CameraPreview(controller),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
              child: Icon(Icons.camera),
              onPressed: () async {
                final Directory extdir =
                    await getApplicationDocumentsDirectory();
                final String dirpath = "${extdir.path}/Pictures/flutter_test";
                await Directory(dirpath).create(recursive: true);
                final String filepath = "$dirpath/${DateTime.now()}.jpg";
                try {
                  final XFile pat = await controller.takePicture();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Berhasil Ambil Gambar")));
                  pat.path;
                } catch (e) {
                  print(e);
                }
              }),
        ),
      );
    }
  }
}
