import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mencao/routes.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  File? _image; // Variável para armazenar a imagem do perfil

  // Função para escolher uma imagem da galeria
  Future<void> _pickImage() async {
    // Lógica para escolher uma imagem (pode ser implementada com o pacote ImagePicker)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300], // Fundo semelhante às outras telas
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text(
          "Registrar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Foto de Perfil
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image == null
                      ? NetworkImage(
                          'https://via.placeholder.com/150') // Imagem padrão
                      : FileImage(_image!) as ImageProvider,
                  child: _image == null
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: 10),

              // Nome completo
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome Completo",
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome completo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Cidade/Estado
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Cidade/Estado",
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua cidade e estado';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // E-mail
              TextFormField(
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
              SizedBox(height: 10),

              // Senha
              TextFormField(
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
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'A senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Confirmar senha
              TextFormField(
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
                  if (value == null || value.isEmpty || value != 'senha') {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Botão de registro
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para registro
                  }
                },
                child: Text(
                  "Registrar",
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

              // Botão para login (caso o usuário já tenha conta)
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
                child: Text(
                  "Já tem uma conta? Faça login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
