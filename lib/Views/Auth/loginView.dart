import 'package:flutter/material.dart';
import 'package:mencao/routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300], // Mesma cor de fundo da FeedScreen
      appBar: AppBar(
        backgroundColor: Colors.brown[800], // Mesma cor da AppBar da FeedScreen
        title: Text(
          "AgroShare",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Banner de imagem
              Container(
                width: double.infinity,
                height: 200, // Tamanho do banner
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/600x200/0000FF/808080?Text=Banner+Image'), // Nova URL de banner
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 20), // Espaço entre o banner e o título de login

              // Título de Login
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Título em branco para contraste
                ),
              ),
              SizedBox(height: 20),

              // Campo de Email
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.brown[700],
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
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),

              // Campo de Senha
              TextField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.brown[700],
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
                style: TextStyle(color: Colors.white),
                obscureText: true,
              ),
              SizedBox(height: 10),

              // Botão de Esqueci a Senha
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navegar para a tela de recuperação de senha
                  },
                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: Colors.white70, // Fonte com opacidade
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Botão de Login
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.feed);
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18, color: Colors.brown[800]),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.brown[800],
                  backgroundColor: Colors.white, // Texto marrom escuro
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 20),

              // Botão de Criar Conta
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                child: Text(
                  "Criar nova conta",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
