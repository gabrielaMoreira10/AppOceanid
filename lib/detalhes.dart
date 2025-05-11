import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa o Provider
// 📄 Importa outras telas do seu app
import 'main.dart'; // Página inicial (Home)
import 'login/loginOceanid.dart'; // Página de login
import 'categoria/categorias_page.dart'; // Página de categorias
import 'carrinho/carrinhoPage.dart'; // Página da sacola
import 'carrinho/carrinhoProvider.dart'; // Provider carrinho
import 'favorito/favoritosProvider.dart'; // provider de favoritos

class ProdutoDetalhesPage extends StatelessWidget {
  final String nome;
  final String imagemAsset;
  final double preco;
  final String descricao;

  const ProdutoDetalhesPage({
    super.key,
    required this.nome,
    required this.imagemAsset,
    required this.preco,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.teal),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
  Consumer<FavoritosProvider>(
    builder: (context, favoritosProvider, _) {
      final produtoAtual = Produto(nome: nome, imagem: imagemAsset, preco: preco);
      final jaFavoritado = favoritosProvider.estaNosFavoritos(produtoAtual);

      return IconButton(
        icon: Icon(
          jaFavoritado ? Icons.favorite : Icons.favorite_border,
          color: Colors.pinkAccent,
        ),
        onPressed: () {
          if (jaFavoritado) {
            favoritosProvider.removerFavorito(produtoAtual);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Removido dos favoritos')),
            );
          } else {
            favoritosProvider.adicionarFavorito(produtoAtual);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Adicionado aos favoritos')),
            );
          }
        },
      );
    },
  ),
],


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 📷 Imagem do Produto
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  imagemAsset,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              // 📝 Nome do Produto
              Text(
                nome,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // 💵 Preço
              Text(
                "R\$${preco.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              // 🛒 Botões de Comprar e Ir para Sacola
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // ✨ Cria um CartItem antes de adicionar
                      final novoItem = CartItem(
                        name: nome,
                        price: preco,
                        imageUrl: imagemAsset,
                      );

                      // ✨ Usa o Provider para adicionar ao carrinho
                      Provider.of<CartProvider>(context, listen: false).addItem(novoItem);

                      // ✨ Mostra uma confirmação
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$nome adicionado à sacola!'),
                          backgroundColor: Colors.teal,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[200],
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Comprar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 🎒 Botão para ir para a Sacola
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // 📃 Seção de descrição
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                descricao,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      // 🔻 Barra de navegação inferior
      bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xFFEFC6D8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem('assets/images/home.png', context),
            _buildBottomNavItem('assets/images/categoria.png', context),
            _buildBottomNavItem('assets/images/login.png', context),
          ],
        ),
      ),
    );
  }

  // 🔧 Função que cria cada item da barra inferior
  Widget _buildBottomNavItem(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (imagePath == 'assets/images/home.png') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePageWidget()),
            (route) => false,
          );
        } else if (imagePath == 'assets/images/categoria.png') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const CategoriesPage()),
            (route) => false,
          );
        } else if (imagePath == 'assets/images/login.png') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 28,
          height: 28,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
