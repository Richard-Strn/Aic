import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthModels {
  // Método para registrar o usuário
  static Future<int> registerUser(
      String nome, String sobrenome, String password, String email) async {
    final url =
        Uri.parse('http://10.0.2.2:8640/agroshare/api/v1/auth/register');

    final body = json.encode({
      'username': nome,
      'surname': sobrenome,
      'password': password,
      'email': email,
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    return response.statusCode;
  }

  // Método para solicitar recuperação de senha
  static Future<int> forgetPassword(String email) async {
    final url =
        Uri.parse('http://localhost:8640/agroshare/api/v1/email/password-code');

    final body = json.encode({'email': email});

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    return response.statusCode;
  }

  // Método para fazer login
  static Future<int> loginUser(String password, String email) async {
    final url = Uri.parse('http://localhost:8640/agroshare/api/v1/auth/login');

    final body = json.encode({'email': email, 'password': password});

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    return response.statusCode;
  }

  // Método para recuperar a senha do usuário
  static Future<int> recoveryPassword(
      String code, String password, String email) async {
    final url = Uri.parse(
        'http://localhost:8640/agroshare/api/v1/auth/change-password');

    final body =
        json.encode({'email': email, 'password': password, 'code': code});

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    return response.statusCode;
  }
}
