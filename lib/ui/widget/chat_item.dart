import 'dart:io';

import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final bool isImage;
  final bool isFile;

  ChatItem({
    required this.message,
    required this.isSentByMe,
    this.isImage = false,
    this.isFile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.red : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: isImage
            ? Image.file(File(message), width: 150, height: 150, fit: BoxFit.cover)
            : isFile
                ? Text(
                    'File: ${message.split('/').last}',
                    style: TextStyle(
                      color: isSentByMe ? Colors.white : Colors.black,
                    ),
                  )
                : Text(
                    message,
                    style: TextStyle(
                      color: isSentByMe ? Colors.white : Colors.black,
                    ),
                  ),
      ),
    );
  }
}