import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favoritosProvider.dart';


class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = Provider.of<FavoritosProvider>(context);
    final favoritos = favoritosProvider.favoritos;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text("Favoritos", style: TextStyle(color: Colors.black)),
      ),
      body: favoritos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                   Icon(Icons.heart_broken, size: 80, color: Colors.pinkAccent),
                   Text(
                    "Você ainda não adicionou\nnenhum item aos favoritos.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 79, 79, 79),
                      
                    ),
                  ),
                  SizedBox(height: 120),
            
                ],
              ),
            )
            
          : 
          ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoritos.length,
              itemBuilder: (_, index) {
                final produto = favoritos[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        produto.imagem,
                        height: 80,
                        width: 60,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              produto.nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "R\$${produto.preco.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFC8E7E2),
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  "Compre Agora",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.pinkAccent),
                        onPressed: () => favoritosProvider.removerFavorito(produto),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
