import 'package:flutter/material.dart';
import 'package:mencao/routes.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // Lista para controlar os estados dos ícones de bookmark (true = marcado)
  List<bool> _bookmarkedItems = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text(
          "AgroShare",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.brown[800],
        child: Column(
          children: [
            // Cabeçalho do Drawer
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown[800]),
              child: Center(
                child: Text(
                  "AgroShare",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Opção: Perfil
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
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
              leading: Icon(Icons.add, color: Colors.white),
              title: Text(
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
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text(
                "Sair",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                // Lógica de logout (se necessário)
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 10, // Exemplo de número de anúncios
        itemBuilder: (context, index) {
          return Card(
            color: Colors.brown[800], // Fundo do card em marrom escuro
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.brown[900]!),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Local e Categoria
                  Text(
                    "Local: Cidade, Estado",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Categoria: Categoria Exemplo",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),

                  // Tempo
                  Text(
                    "2 dias atrás",
                    style: TextStyle(
                        color: Colors
                            .white70), // Fonte branca com opacidade para contraste
                  ),
                  SizedBox(height: 10),

                  // Imagem de uma plantação centralizada com borda
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
                  SizedBox(height: 10),

                  // Título do Anúncio
                  Text(
                    "Título do Anúncio",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),

                  // Preço abaixo do título
                  Text(
                    "Preço: R\$ 100,00",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),

                  // Descrição
                  Text(
                    "Breve descrição do produto.",
                    style: TextStyle(
                        color: Colors
                            .white70), // Descrição em branco com opacidade
                  ),
                  SizedBox(height: 10),

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
                        icon: Icon(Icons.message_outlined),
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
