import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favoritosProvider.dart';
import '../detalhes.dart';

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
      body:
          favoritos.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.heart_broken,
                      size: 80,
                      color: Colors.pinkAccent,
                    ),
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
              : ListView.builder(
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
                    // Função para exibir o produto com navegação
                    
child: Row(
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdutoDetalhesPage(
              nome: produto.nome, 
              imagemAsset: produto.imagem,
              preco: 52.2,
              descricao: 'Descrição do produto aqui!', // Você pode customizar isso
            ),
          ),
        );
      },
      child: Row(
        children: [
          Image.asset(
            produto.imagem,
            height: 80,
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Column(
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
                "R\$20.30",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    ),
    const Spacer(),
    IconButton(
      icon: const Icon(Icons.favorite, color: Colors.pinkAccent),
      onPressed: () => favoritosProvider.removerFavorito(produto),
    ),
  ],
)

                  );
                },
              ),
    );
  }
}
