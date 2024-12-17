import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthModels {
  // Método para registrar o usuário
  static Future<int> registerUser(
      String nome, String sobrenome, String password, String email) async {
    final url =
        Uri.parse('http://localhost:8640/agroshare/api/v1/auth/register');

    // Corpo da requisição com os dados do usuário
    final body = json.encode({
      'username': nome,
      'surname': sobrenome,
      'password': password,
      'email': email,
    });

    // Enviar a requisição POST
    final response = await http.post(
      url,
      headers: {
        'Content-Type':
            'application/json', // Cabeçalho indicando que o corpo da requisição é em JSON
      },
      body: body, // Dados enviados para a API
    );

    // Verificar o status da resposta
    if (response.statusCode == 200) {
      // Sucesso: processar a resposta
      print('Usuário registrado com sucesso!');
      final responseData = json.decode(response.body);
      // Aqui você pode usar os dados da resposta conforme necessário
      print(responseData);
    } else {
      // Erro: mostrar a mensagem de erro
      print('Falha no registro. Código de status: ${response.statusCode}');
      print('Mensagem: ${response.body}');
    }
    return response.statusCode;
  }

  // Método para solicitar recuperação de senha
  static Future<int> forgetPassword(String email) async {
    final url =
        Uri.parse('http://localhost:8640/agroshare/api/v1/email/password-code');

    // Corpo da requisição com os dados do usuário
    final body = json.encode({'email': email});

    // Enviar a requisição POST
    final response = await http.post(
      url,
      headers: {
        'Content-Type':
            'application/json', // Cabeçalho indicando que o corpo da requisição é em JSON
      },
      body: body, // Dados enviados para a API
    );

    // Verificar o status da resposta
    if (response.statusCode == 200) {
      // Sucesso: processar a resposta
      print('Código de recuperação enviado com sucesso!');
      final responseData = json.decode(response.body);
      print(responseData);
    } else {
      // Erro: mostrar a mensagem de erro
      print(
          'Falha ao solicitar recuperação de senha. Código de status: ${response.statusCode}');
      print('Mensagem: ${response.body}');
    }
    return response.statusCode;
  }

  // Método para fazer login
  static Future<int> loginUser(String password, String email) async {
    final url = Uri.parse('http://localhost:8640/agroshare/api/v1/auth/login');

    // Corpo da requisição com os dados do usuário
    final body = json.encode({'email': email, 'password': password});

    // Enviar a requisição POST
    final response = await http.post(
      url,
      headers: {
        'Content-Type':
            'application/json', // Cabeçalho indicando que o corpo da requisição é em JSON
      },
      body: body, // Dados enviados para a API
    );

    // Verificar o status da resposta
    if (response.statusCode == 200) {
      // Sucesso: processar a resposta
      print('Usuário logado com sucesso!');
      final responseData = json.decode(response.body);
      print(responseData);
    } else {
      // Erro: mostrar a mensagem de erro
      print('Falha no login. Código de status: ${response.statusCode}');
      print('Mensagem: ${response.body}');
    }
    return response.statusCode;
  }

  // Método para recuperar a senha do usuário
  static Future<int> recoveryPassword(
      String code, String password, String email) async {
    final url = Uri.parse(
        'http://localhost:8640/agroshare/api/v1/auth/change-password');

    // Corpo da requisição com os dados do usuário
    final body =
        json.encode({'email': email, 'password': password, 'code': code});

    // Enviar a requisição POST
    final response = await http.post(
      url,
      headers: {
        'Content-Type':
            'application/json', // Cabeçalho indicando que o corpo da requisição é em JSON
      },
      body: body, // Dados enviados para a API
    );

    // Verificar o status da resposta
    if (response.statusCode == 200) {
      // Sucesso: processar a resposta
      print('Senha alterada com sucesso!');
      final responseData = json.decode(response.body);
      print(responseData);
    } else {
      // Erro: mostrar a mensagem de erro
      print(
          'Falha na recuperação de senha. Código de status: ${response.statusCode}');
      print('Mensagem: ${response.body}');
    }
    return response.statusCode;
  }
}
