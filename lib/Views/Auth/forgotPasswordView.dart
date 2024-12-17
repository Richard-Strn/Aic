import 'package:flutter/material.dart';
import 'package:mencao/Controller/Auth/authController.dart';
import 'package:mencao/routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final AuthController _authController =
      AuthController(); // Instância do AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300], // Mesma cor de fundo das outras telas
      appBar: AppBar(
        backgroundColor:
            Colors.brown[800], // Mesma cor da AppBar das outras telas
        title: Text(
          "Recuperar Senha",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              // Banner de imagem
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://via.placeholder.com/600x200/0000FF/808080?Text=Banner+Image'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 20),

              // Título de Recuperar Senha
              Text(
                "Esqueci minha senha",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Campo de Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "E-mail",
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
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Botão de Enviar Código
              ElevatedButton(
                onPressed: () {
                  if (_emailController.text.isNotEmpty) {
                    // Lógica para enviar o código de recuperação
                    // Exemplo de navegação para a tela de login após o envio do código
                    _authController.forgotPassword(
                        _emailController.text, context);
                  }
                },
                child: Text(
                  "Enviar Código",
                  style: TextStyle(fontSize: 18, color: Colors.brown[800]),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.brown[800],
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 20),

              // Botão de Voltar para o Login
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
                child: Text(
                  "Voltar para o Login",
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
