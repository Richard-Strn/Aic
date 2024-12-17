import 'package:flutter/material.dart';
import 'package:mencao/routes.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {"sender": "User", "message": "Oi, tudo bem?"},
    {"sender": "User", "message": "Como você está?"},
    {"sender": "Friend", "message": "Olá! Estou bem, e você?"}
  ]; // Exemplo de mensagens

  // Função para adicionar nova mensagem
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({"sender": "User", "message": _controller.text});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300], // Fundo da tela
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text("Conversa", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.feed);
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Lista de mensagens
          Expanded(
            child: ListView.builder(
              reverse: true, // Para exibir a mensagem mais recente em baixo
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message["sender"] == "User";
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? Colors.brown[600]
                            : Colors.brown[700],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        message["message"]!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Campo de entrada de mensagem
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Campo para digitar a mensagem
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.brown[700],
                      hintText: "Digite uma mensagem...",
                      hintStyle: TextStyle(color: Colors.white70),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.brown[900]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.brown[900]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // Ícone de envio
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
