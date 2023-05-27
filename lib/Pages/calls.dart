import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../CustomUI/callcard.dart';
import '../Model/callmodel.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  List<CallModel> calls = [
    CallModel(
        name: "Tara",
        image:
            "https://filmfare.wwmindia.com/content/2020/oct/tarasutaria41603281812.jpg",
        isgroup: false,
        time: "12:04",
        incoming: true),
    CallModel(
        name: "RD Jr.",
        image:
            "https://phantom-marca.unidadeditorial.es/38d327959012f4d1955e77a9a34d5d2c/resize/660/f/webp/assets/multimedia/imagenes/2023/01/12/16735402991293.jpg",
        isgroup: false,
        time: "10:01",
        incoming: false),
    CallModel(
        name: "Ozge Yagiz",
        image:
            "https://e0.pxfuel.com/wallpapers/665/58/desktop-wallpaper-ozge-ya%C4%9F%C4%B1z.jpg",
        isgroup: false,
        time: "09:11",
        incoming: true),
    CallModel(
        name: "Chris Evans",
        image:
            "https://e1.pxfuel.com/desktop-wallpaper/502/843/desktop-wallpaper-captain-america-the-winter-soldier-chris-evans-chris-evans.jpg",
        isgroup: false,
        time: "08:01",
        incoming: false),
    CallModel(
        name: "THE BOYS",
        image:
            "https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-group-icon-png-image_1796653.jpg",
        isgroup: true,
        time: "08:01",
        incoming: false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: calls.length,
            itemBuilder: ((context, index) => CallCard(calls[index]))),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {},
          child: const Icon(Icons.add_call),
        ));
  }
}
