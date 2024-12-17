import 'package:flutter/material.dart';
import 'package:mencao/routes.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex =
      0; // Índice de seleção entre 'Meus Anúncios' e 'Anúncios Salvos'

  // Exemplo de listas de anúncios
  final List<Map<String, String>> _myAds = [
    {
      "title": "Anúncio 1",
      "price": "R\$ 100,00",
      "image": 'https://via.placeholder.com/100'
    },
    {
      "title": "Anúncio 2",
      "price": "R\$ 200,00",
      "image": 'https://via.placeholder.com/100'
    },
  ];

  final List<Map<String, String>> _savedAds = [
    {
      "title": "Anúncio Salvo 1",
      "price": "R\$ 50,00",
      "image": 'https://via.placeholder.com/100'
    },
    {
      "title": "Anúncio Salvo 2",
      "price": "R\$ 150,00",
      "image": 'https://via.placeholder.com/100'
    },
  ];

  // Método para renderizar os anúncios com base na seleção
  List<Widget> _buildAds(List<Map<String, String>> ads) {
    return ads.map((ad) {
      return Card(
        color: Colors.brown[700],
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
              color: Colors.brown[900]!, width: 2), // Borda com largura dobrada
        ),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown[900]!, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(ad['image']!, fit: BoxFit.cover),
            ),
          ),
          title: Text(
            ad['title']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            ad['price']!,
            style: TextStyle(color: Colors.white70),
          ),
          trailing:
              _selectedIndex == 1 // Se for 'Anúncios Salvos', ícone de chat
                  ? IconButton(
                      icon: Icon(Icons.message_outlined),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.chat);
                      },
                    )
                  : Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.createAd);
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300], // Fundo semelhante às outras telas
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text(
          "Meu Perfil",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.brown[900],
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 10),

            // Nome do Usuário
            Text(
              "Nome do Usuário",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            // Botão Editar Perfil
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.editProfileScreen);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Editar Perfil",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0
                            ? Colors.brown[700]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.brown[900]!,
                            width: 3), // Borda mais grossa
                      ),
                      child: Text(
                        "Meus Anúncios",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Colors.brown[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1
                            ? Colors.brown[700]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.brown[900]!,
                            width: 3), // Borda mais grossa
                      ),
                      child: Text(
                        "Anúncios Salvos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _selectedIndex == 1
                              ? Colors.white
                              : Colors.brown[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Exibe os anúncios com base na seleção
            Expanded(
              child: ListView(
                children: _selectedIndex == 0
                    ? _buildAds(_myAds) // Meus anúncios
                    : _buildAds(_savedAds), // Anúncios salvos
              ),
            ),
          ],
        ),
      ),
    );
  }
}
