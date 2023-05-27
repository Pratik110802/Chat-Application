import 'package:chat_app/Model/chatmodel.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({required this.chat, super.key});
  final ChatModel chat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leadingWidth: 85,
        leading: Row(
          children: [
            InkWell(
                onTap: (() => Navigator.pop(context)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.arrow_back),
                )),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.chat.isgroup
                          ? const NetworkImage(
                              "https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-group-icon-png-image_1796653.jpg")
                          : NetworkImage(widget.chat.image))),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chat.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              "last seen today at ${widget.chat.time}",
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "View Contact",
                    child: Text("View Contact"),
                  ),
                  const PopupMenuItem(
                    value: "Media,links and docs",
                    child: Text("Media,links and docs"),
                  ),
                  const PopupMenuItem(
                    value: "Search",
                    child: Text("search"),
                  ),
                  const PopupMenuItem(
                    value: "Mute Notifications",
                    child: Text("Mute Notifications"),
                  ),
                  const PopupMenuItem(
                    value: "Disappearing messages",
                    child: Text("Disappearing messages"),
                  ),
                  const PopupMenuItem(
                    value: "Wallpaper",
                    child: Text("Wallpaper"),
                  ),
                  const PopupMenuItem(
                    value: "More",
                    child: Text("More"),
                  ),
                ];
              })
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 70,
                        child: Card(
                            margin: const EdgeInsets.only(
                                left: 10, right: 5, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              focusNode: focusNode,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              cursorHeight: 20,
                              cursorWidth: 1,
                              cursorColor: primaryColor,
                              controller: _controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: const TextStyle(fontSize: 14),
                                  hintText: 'Type a message',
                                  contentPadding:
                                      const EdgeInsets.only(top: 15),
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        emojiShowing = !emojiShowing;
                                      });
                                    },
                                    icon: emojiShowing
                                        ? Icon(
                                            Icons.emoji_emotions,
                                            color: primaryColor,
                                          )
                                        : Icon(
                                            Icons.emoji_emotions_outlined,
                                            color: primaryColor,
                                          ),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.attach_file,
                                            color: primaryColor,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: primaryColor,
                                          ))
                                    ],
                                  )),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: primaryColor,
                          child: const Icon(Icons.mic),
                        ),
                      )
                    ],
                  ),
                  Offstage(
                      offstage: !emojiShowing,
                      child: SizedBox(
                        height: 250,
                        child: EmojiPicker(
                          textEditingController: _controller,
                        ),
                      )),
                ],
              ),
            ),
          ]),
          onWillPop: () {
            if (emojiShowing) {
              setState(() {
                emojiShowing = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
