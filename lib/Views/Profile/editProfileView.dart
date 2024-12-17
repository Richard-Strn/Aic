import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image; // Variável para armazenar a imagem do perfil

  // Função para escolher uma imagem da galeria
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300], // Fundo semelhante às outras telas
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text(
          "Editar Perfil",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
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
                  radius: 60,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : NetworkImage('https://via.placeholder.com/150')
                          as ImageProvider,
                  child: _image == null
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: 20),

              // Nome Completo
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
              SizedBox(height: 20),

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
              SizedBox(height: 20),

              // Botão de salvar alterações
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para salvar as alterações do perfil
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Alterações salvas com sucesso!')),
                    );
                  }
                },
                child: Text(
                  "Salvar Alterações",
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
            ],
          ),
        ),
      ),
    );
  }
}



/*import 'dart:io';

import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
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
          "Editar Perfil",
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
                  radius: 60,
                  backgroundImage: _image == null
                      ? NetworkImage(
                          'https://via.placeholder.com/150') // Imagem padrão
                      : FileImage(_image!) as ImageProvider,
                  child: _image == null
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: 20),

              // Nome Completo
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
              SizedBox(height: 20),

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
              SizedBox(height: 20),

              // Botão de salvar alterações
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para salvar as alterações do perfil
                  }
                },
                child: Text(
                  "Salvar Alterações",
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
            ],
          ),
        ),
      ),
    );
  }
}*/
