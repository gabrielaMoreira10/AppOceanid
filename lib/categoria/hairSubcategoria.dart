import 'package:flutter/material.dart';

// 📄 Importa outras telas do seu app
import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias
import '../detalhes.dart'; // Página de detalhes
import '../carrinho/carrinhoPage.dart';

// 💇‍♀️ Tela principal de cuidados capilares e suas subcategorias
class HairCareSubcategoriesPage extends StatelessWidget {
  const HairCareSubcategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Mapa contendo as subcategorias e seus produtos
    final subcategories = {
  'Shampoo': [
    ['assets/images/KérastaseBain.png', 'Kérastase Bain Satin 1 - R\$149,00'],
    ['assets/images/hellok.png', 'Lola Cosmetics Meu Cacho Minha Vida - R\$29,90'],
    ['assets/images/hellok.png', 'Dove Hidratação Intensa - R\$12,90'],
  ],
  'Condicionador': [
    ['assets/images/hellok.png', 'Kérastase Lait Vital - R\$159,00'],
    ['assets/images/hellok.png', 'Lola Cosmetics Meu Cacho Minha Vida - R\$32,90'],
    ['assets/images/hellok.png', 'Dove Hidratação Intensa - R\$13,90'],
  ],
  'Máscara de Hidratação': [
    ['assets/images/hellok.png', 'Joico Moisture Recovery - R\$189,00'],
    ['assets/images/hellok.png', 'Novex Óleo de Coco - R\$19,90'],
    ['assets/images/hellok.png', 'Skala Bomba de Vitaminas - R\$8,90'],
  ],
  'Leave-in ou Creme para Pentear': [
    ['assets/images/hellok.png', 'Moroccanoil Curl Defining Cream - R\$180,00'],
    ['assets/images/hellok.png', 'Salon Line Cachos dos Sonhos - R\$15,90'],
    ['assets/images/hellok.png', 'Pantene Creme para Pentear - R\$10,90'],
  ],
  'Óleo Capilar': [
    ['assets/images/hellok.png', 'Moroccanoil Treatment - R\$199,00'],
    ['assets/images/hellok.png', 'Lola Cosmetics Pinga! - R\$34,90'],
    ['assets/images/hellok.png', 'Niely Gold Óleo de Argan - R\$12,90'],
  ],
  'Protetor Térmico': [
    ['assets/images/hellok.png', 'Redken Extreme Play Safe - R\$159,00'],
    ['assets/images/hellok.png', 'Lola Cosmetics Comigo Ninguém Pode - R\$39,90'],
    ['assets/images/hellok.png', 'Salon Line Meu Liso Térmico - R\$15,90'],
  ],
  'Escova ou Pente': [
    ['assets/images/hellok.png', 'Tangle Teezer Original - R\$89,00'],
    ['assets/images/hellok.png', 'Marco Boni Escova Raquete - R\$19,90'],
    ['assets/images/hellok.png', 'Santa Clara Pente de Madeira - R\$9,90'],
  ],
};

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Categorias',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1C364E),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Text(
                    ' > Cabelos',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1C364E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 🔥 Gera dinamicamente as subcategorias de cuidados capilares
              ...subcategories.entries.map((entry) {
                final subcategory = entry.key;
                final products = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4E0F0),
                        borderRadius: BorderRadius.circular(8),
                        border: subcategory == 'Shampoo'
                            ? Border.all(color: Colors.blueAccent, width: 2)
                            : null,
                      ),
                      child: Text(
                        subcategory,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1C364E),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...products.map((product) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                   (context) => ProdutoDetalhesPage(
                                    nome: product[1],
                                    imagemAsset: product[0],
                                    preco: 90.90,
                                    descricao: 'Um produto incrível para você!',
                                  ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: Image.asset(
                                  product[0],
                                  width: 100,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xFFEFC6D8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem('assets/images/home.png', context),
            _buildBottomNavItem('assets/images/categoria.png', context),
            _buildBottomNavItem('assets/images/login.png', context),
            _buildBottomNavItem('assets/images/carrinho.png', context),
          ],
        ),
      ),
    );
  }

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
        }else if (imagePath == 'assets/images/carrinho.png') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
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
