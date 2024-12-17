import 'package:flutter/material.dart';
import 'package:mencao/Models/Auth/authModels.dart';
import 'package:mencao/routes.dart';

class AuthController {
  String userEmail = "";
  // Método para registrar o usuário
  Future<void> registerUser(String nome, String sobrenome, String password,
      String email, BuildContext context) async {
    int statusCode =
        await AuthModels.registerUser(nome, sobrenome, password, email);
    if (statusCode == 200 || statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário registrado com sucesso!')));
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falha no registro. Tente novamente.')));
    }
  }

  // Método para solicitar recuperação de senha
  Future<void> forgotPassword(String email, BuildContext context) async {
    int statusCode = await AuthModels.forgetPassword(email);

    if (statusCode == 200 || statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Código de recuperação enviado para o email.')));
      Navigator.pushNamed(context, AppRoutes.recoverPassword);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Falha ao enviar código de recuperação.')));
    }
  }

  // Método para fazer login
  Future<void> loginUser(
      String password, String email, BuildContext context) async {
    int statusCode = await AuthModels.loginUser(password, email);

    if (statusCode == 200 || statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login bem-sucedido!')));
      Navigator.pushReplacementNamed(context, AppRoutes.feed);
      userEmail = email;
      print("GET NOME");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Falha no login. Verifique suas credenciais.')));
    }
  }

  // Método para recuperar a senha
  Future<void> recoverPassword(
      String code, String password, String email, BuildContext context) async {
    int statusCode = await AuthModels.recoveryPassword(code, password, email);

    if (statusCode == 200 || statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Senha alterada com sucesso!')));
      Navigator.pushNamed(context, AppRoutes.login);
    } else if (statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Código inválido ou expirado.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falha na alteração da senha.')));
    }
  }
}
