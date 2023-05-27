import 'package:chat_app/CustomUI/chatcard.dart';
import 'package:chat_app/Model/chatmodel.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Tara",
        image:
            "https://filmfare.wwmindia.com/content/2020/oct/tarasutaria41603281812.jpg",
        isgroup: false,
        time: "12:04",
        currentMessage: "Hi Pratik!"),
    ChatModel(
        name: "RD Jr.",
        image:
            "https://phantom-marca.unidadeditorial.es/38d327959012f4d1955e77a9a34d5d2c/resize/660/f/webp/assets/multimedia/imagenes/2023/01/12/16735402991293.jpg",
        isgroup: false,
        time: "10:01",
        currentMessage: "Hello Bro! "),
    ChatModel(
        name: "Ozge Yagiz",
        image:
            "https://e0.pxfuel.com/wallpapers/665/58/desktop-wallpaper-ozge-ya%C4%9F%C4%B1z.jpg",
        isgroup: false,
        time: "09:11",
        currentMessage: "Hi..."),
    ChatModel(
        name: "Chris Evans",
        image:
            "https://e1.pxfuel.com/desktop-wallpaper/502/843/desktop-wallpaper-captain-america-the-winter-soldier-chris-evans-chris-evans.jpg",
        isgroup: false,
        time: "08:01",
        currentMessage: "Its just Begun!"),
    ChatModel(
        name: "THE BOYS",
        image:
            "https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-group-icon-png-image_1796653.jpg",
        isgroup: true,
        time: "08:01",
        currentMessage: "Nobody does it! better")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: ((context, index) => ChatCard(chats[index]))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: const Icon(Icons.message_outlined),
      ),
    );
  }
}
