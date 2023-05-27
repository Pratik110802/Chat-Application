import 'package:chat_app/Pages/calls.dart';
import 'package:chat_app/Pages/camera.dart';
import 'package:chat_app/Pages/chats.dart';
import 'package:chat_app/Pages/status.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Hola Amigo',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (() {}),
          ),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    value: "New group",
                    child: Text("New group"),
                  ),
                  PopupMenuItem(
                    value: "New Broadcast",
                    child: Text("New broadcast"),
                  ),
                  PopupMenuItem(
                    value: "Webchat",
                    child: Text("Talk on Web"),
                  ),
                  PopupMenuItem(
                    value: "Starred messages",
                    child: Text("Starred messages"),
                  ),
                  PopupMenuItem(
                    value: "Settings",
                    child: Text("Settings"),
                  )
                ];
              })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
          controller: _controller,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [Camera(), Chats(), Status(), Calls()],
      ),
    );
  }
}
