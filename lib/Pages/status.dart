import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {},
              child: const Icon(
                Icons.edit,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {},
              child: const Icon(Icons.camera_alt),
            )
          ],
        ),
      ),
    );
  }
}
