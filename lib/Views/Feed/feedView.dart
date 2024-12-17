import 'package:flutter/material.dart';
import 'package:mencao/routes.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<bool> _bookmarkedItems = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: const Text(
          "AgroShare",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.brown[300],
        child: Column(
          children: [
            const SizedBox(height: 10),
            // AppBar Menu
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown[300]),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            // Opção: Perfil
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                "Perfil",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.pushNamed(context, AppRoutes.profileScreen);
              },
            ),

            // Opção: Criar
            ListTile(
              leading: const Icon(Icons.add, color: Colors.white),
              title: const Text(
                "Criar anúncio",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.pushNamed(context, AppRoutes.createAd);
              },
            ),

            // Opção: Sair
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              title: const Text(
                "Sair",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.brown[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.brown[900]!),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Local e Categoria
                  const Text(
                    "Local: Cidade, Estado",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Categoria: Categoria Exemplo",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),

                  // Tempo
                  const Text(
                    "2 dias atrás",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),

                  // Imagem
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown[900]!, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://via.placeholder.com/320x350?text=Plantação',
                          fit: BoxFit.cover,
                          width: 370,
                          height: 350,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Título do Anúncio
                  const Text(
                    "Título do Anúncio",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Preço
                  const Text(
                    "Preço: R\$ 100,00",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Descrição
                  const Text(
                    "Breve descrição do produto.",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),

                  // Ícones de ações
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          _bookmarkedItems[index]
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                        ),
                        color: _bookmarkedItems[index]
                            ? Colors.white
                            : Colors.white,
                        onPressed: () {
                          setState(() {
                            _bookmarkedItems[index] = !_bookmarkedItems[index];
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.message_outlined),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.chat);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
