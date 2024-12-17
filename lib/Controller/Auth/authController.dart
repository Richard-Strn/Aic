import 'package:flutter/material.dart';
import 'package:mencao/Models/Auth/authModels.dart';
import 'package:mencao/routes.dart';

class AuthController {
  // Método para registrar o usuário
  Future<void> registerUser(String nome, String sobrenome, String password,
      String email, BuildContext context) async {
    int statusCode =
        await AuthModels.registerUser(nome, sobrenome, password, email);

    if (statusCode == 200) {
      // Registro bem-sucedido, você pode redirecionar o usuário para a tela principal ou exibir uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário registrado com sucesso!')));
      Navigator.pushReplacementNamed(context, AppRoutes.login);
      // Navegar para a próxima tela ou realizar outra ação
    } else {
      // Falha no registro, exiba uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha no registro. Tente novamente.')));
    }
  }

  // Método para solicitar recuperação de senha
  Future<void> forgotPassword(String email, BuildContext context) async {
    int statusCode = await AuthModels.forgetPassword(email);

    if (statusCode == 200) {
      // Sucesso ao enviar código de recuperação
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Código de recuperação enviado para o email.')));
      Navigator.pushNamed(context, AppRoutes.recoverPassword);
    } else {
      // Falha ao solicitar recuperação de senha
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao enviar código de recuperação.')));
    }
  }

  // Método para fazer login
  Future<void> loginUser(
      String password, String email, BuildContext context) async {
    int statusCode = await AuthModels.loginUser(password, email);

    if (statusCode == 200) {
      // Sucesso no login, você pode navegar para a tela principal ou exibir uma mensagem de sucesso
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login bem-sucedido!')));
      Navigator.pushReplacementNamed(context, AppRoutes.feed);
      // Navegar para a próxima tela
    } else {
      // Falha no login, exiba uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Falha no login. Verifique suas credenciais.')));
    }
  }

  // Método para recuperar a senha
  Future<void> recoverPassword(
      String code, String password, String email, BuildContext context) async {
    int statusCode = await AuthModels.recoveryPassword(code, password, email);

    if (statusCode == 200) {
      // Sucesso na recuperação da senha
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Senha alterada com sucesso!')));
      Navigator.pushNamed(context, AppRoutes.login);
      // Navegar para a tela de login ou outra ação
    } else if (statusCode == 400) {
      // Falha na recuperação da senha
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Código inválido ou expirado.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha na alteração da senha.')));
    }
  }
}
