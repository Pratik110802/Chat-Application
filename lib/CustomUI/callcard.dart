import 'package:chat_app/Model/callmodel.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CallCard extends StatelessWidget {
  CallCard(this.callModel, {super.key});
  CallModel callModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: callModel.isgroup
                    ? const NetworkImage(
                        "https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-group-icon-png-image_1796653.jpg")
                    : NetworkImage(callModel.image))),
      ),
      title: Text(
        callModel.name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          callModel.incoming
              ? const Icon(
                  Icons.call_received,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.call_made,
                  color: Colors.green,
                  size: 16,
                ),
          const SizedBox(
            width: 5,
          ),
          Text(callModel.time),
        ],
      ),
      trailing: Icon(
        Icons.videocam,
        color: primaryColor,
      ),
    );
  }
}
