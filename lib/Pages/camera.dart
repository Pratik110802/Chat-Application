import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? _imagegallery;
  File? _imagecamera;
  Uint8List webImagegallery = Uint8List(0);
  Uint8List webImagecamera = Uint8List(0);

  Future getImagegallery() async {
    if (!kIsWeb) {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 6);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        _imagegallery = imageTemporary;
        log(imageTemporary.lengthSync().toString());
      });
    } else if (kIsWeb) {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
      if (image == null) return;

      var f = await image.readAsBytes();
      setState(() {
        webImagegallery = f;
        log(f.lengthInBytes.toString());
      });
    }
  }

  Future getImageCamera() async {
    if (!kIsWeb) {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 6);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        _imagecamera = imageTemporary;

        log(imageTemporary.lengthSync().toString());
      });
    } else if (kIsWeb) {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
      if (image == null) return;

      var f = await image.readAsBytes();
      setState(() {
        webImagecamera = f;
        log(f.lengthInBytes.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: getImagegallery,
              child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: kIsWeb
                        ? webImagegallery.isEmpty
                            ? const Align(
                                alignment: Alignment.center,
                                child: Text('Click Here'),
                              )
                            : Image.memory(
                                webImagegallery,
                                height: 250,
                                width: 250,
                                fit: BoxFit.contain,
                              )
                        : _imagegallery != null
                            ? Image.file(
                                _imagegallery!,
                                width: 250,
                                height: 250,
                                fit: BoxFit.fill,
                              )
                            : const Align(
                                alignment: Alignment.center,
                                child: Text(
                                    'Click Here to Load Image from Gallery'),
                              ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
                onTap: getImageCamera,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: kIsWeb
                          ? webImagecamera.isEmpty
                              ? const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      'Click Here to Load Image from Gallery'),
                                )
                              : Image.memory(
                                  webImagecamera,
                                  height: 250,
                                  width: 250,
                                  fit: BoxFit.contain,
                                )
                          : _imagecamera != null
                              ? Image.file(
                                  _imagecamera!,
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      'Click Here to load Image from Camera'),
                                )),
                )),
          ),
        ]),
      ),
    );
  }
}
