import 'package:flutter/material.dart';
import '../models/agent.dart';
import 'chat_page.dart';
import '../widgets/agent_card.dart';

class HomePage extends StatelessWidget {
  final agents = [
    Agent(id: "vendedor", name: "Vendedor", description: "Persuasão e vendas."),
    Agent(
      id: "estagiario",
      name: "Estagiário",
      description: "Tarefas simples.",
    ),
    Agent(
      id: "copywriter",
      name: "Copywriter",
      description: "Textos persuasivos.",
    ),
    Agent(
      id: "suporte",
      name: "Suporte Técnico",
      description: "Ajuda técnica.",
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("TaskForge-AI"),
      ),
      body: ListView.builder(
        itemCount: agents.length,
        itemBuilder: (context, index) {
          final agent = agents[index];
          return AgentCard(
            agent: agent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatPage(agent: agent)),
              );
            },
          );
        },
      ),
    );
  }
}
