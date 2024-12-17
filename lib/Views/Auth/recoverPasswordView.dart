import 'package:flutter/material.dart';
import 'package:mencao/Controller/Auth/authController.dart';
import 'package:mencao/routes.dart';

class RecoverPasswordScreen extends StatefulWidget {
  @override
  _RecoverPasswordScreenState createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final _formKey =
      GlobalKey<FormState>(); // GlobalKey para validar o formulário
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final AuthController _authController =
      AuthController(); // Instância do AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300], // Cor de fundo consistente
      appBar: AppBar(
        backgroundColor: Colors.brown[800], // Cor da AppBar consistente
        title: Text(
          "Redefinir Senha",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Usando o GlobalKey para validação do formulário
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

              // Título de Redefinir Senha
              Text(
                "Redefinir a sua senha",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Campo de E-mail
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

              // Campo de Código
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: "Código",
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
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo de Senha
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Nova Senha",
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
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'A senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo de Confirmar Senha
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: "Confirmar Senha",
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
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value != _passwordController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Botão de Redefinir Senha
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para redefinir a senha
                    // Exemplo de navegação para a tela de login após redefinir a senha
                    _authController.recoverPassword(
                        _codeController.text,
                        _passwordController.text,
                        _emailController.text,
                        context);
                  }
                },
                child: Text(
                  "Redefinir Senha",
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

              // Botão para voltar para o login
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
