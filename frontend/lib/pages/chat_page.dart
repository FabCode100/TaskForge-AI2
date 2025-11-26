import 'package:flutter/material.dart';
import '../models/agent.dart';
import '../models/message.dart';
import '../core/api.dart';
import '../widgets/message_bubble.dart';

class ChatPage extends StatefulWidget {
  final Agent agent;

  const ChatPage({super.key, required this.agent});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = TextEditingController();
  final List<Message> messages = [];

  Future<void> sendMessage() async {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(Message(text: text, fromUser: true));
    });

    controller.clear();

    final response = await Api.sendMessage(
      agentId: widget.agent.id,
      prompt: text,
    );

    setState(() {
      messages.add(Message(text: response, fromUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.agent.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            color: Colors.grey[900],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Digite aqui...",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.orange),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
