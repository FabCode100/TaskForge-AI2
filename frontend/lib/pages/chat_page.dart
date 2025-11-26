import 'package:flutter/material.dart';
import '../models/agent.dart';
import '../models/chat_message.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/api.dart';
import '../widgets/message_bubble.dart';

class ChatPage extends StatefulWidget {
  final Agent agent;

  const ChatPage({super.key, required this.agent});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = TextEditingController();
  late Box<ChatMessage> box;
  List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    final sanitized = widget.agent.name.replaceAll(
      RegExp(r'[^a-zA-Z0-9_]'),
      '',
    );
    final shortName = sanitized.length > 3
        ? sanitized.substring(0, 3)
        : sanitized;
    final boxName = 'chat_${shortName.toLowerCase()}';
    box = await Hive.openBox<ChatMessage>(boxName);
    setState(() {
      messages = box.values.toList();
    });
  }

  Future<void> sendMessage() async {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    final userMessage = ChatMessage(
      sender: 'user',
      text: text,
      timestamp: DateTime.now(),
    );

    setState(() {
      messages.add(userMessage);
    });
    box.add(userMessage);

    controller.clear();

    final response = await Api.sendMessage(
      agentId: widget.agent.id,
      prompt: text,
    );

    final botMessage = ChatMessage(
      sender: 'agent',
      text: response,
      timestamp: DateTime.now(),
    );

    setState(() {
      messages.add(botMessage);
    });
    box.add(botMessage);
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
