import 'package:flutter/material.dart';
import 'package:mencao/routes.dart';
import 'package:mencao/Controller/Auth/authController.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController _authController = AuthController();
  int _selectedIndex = 0;

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

  List<Widget> _buildAds(List<Map<String, String>> ads) {
    return ads.map((ad) {
      return Card(
        color: Colors.brown[700],
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.brown[900]!, width: 2),
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            ad['price']!,
            style: const TextStyle(color: Colors.white70),
          ),
          trailing:
              _selectedIndex == 1 // Se for 'Anúncios Salvos', ícone de chat
                  ? IconButton(
                      icon: const Icon(Icons.message_outlined),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.chat);
                      },
                    )
                  : const Icon(
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
        title: const Text(
          "Meu Perfil",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.brown[900],
              backgroundImage:
                  const NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 10),

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
              child: const Text(
                "Editar Perfil",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Campo dos anúncios
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
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0
                            ? Colors.brown[700]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.brown[900]!, width: 3),
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
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1
                            ? Colors.brown[700]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.brown[900]!, width: 3),
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
            const SizedBox(height: 20),

            // Colocando os anúncios estáticos
            Expanded(
              child: ListView(
                children: _selectedIndex == 0
                    ? _buildAds(_myAds)
                    : _buildAds(_savedAds),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
