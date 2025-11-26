import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.fromUser;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isMe ? Colors.orange : Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: isMe ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
