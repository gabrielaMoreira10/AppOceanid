import 'package:flutter/material.dart';
// Importa outras telas do seu app
import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias
import '../detalhes.dart'; // Página de detalhes do produto
import '../carrinho/carrinhoPage.dart';

// Tela principal de perfumes e suas subcategorias
class FragranceSubcategoriesPage extends StatelessWidget {
  const FragranceSubcategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
   final subcategories = {
  'Body Splash': [
    ['assets/images/hellok.png', 'Victoria\'s Secret Pure Seduction\nR\$79,90'],
    ['assets/images/hellok.png', 'O Boticário Cuide-se Bem Splash\nR\$39,90'],
    ['assets/images/hellok.png', 'Avon Far Away Body Mist\nR\$29,90'],
  ],
  'Eau de Toilette': [
    ['assets/images/hellok.png', 'Dior Sauvage EDT\nR\$499,00'],
    ['assets/images/hellok.png', 'O Boticário Lily EDT\nR\$139,90'],
    ['assets/images/hellok.png', 'Natura Ekos Frescor\nR\$69,90'],
  ],
  'Eau de Parfum': [
    ['assets/images/hellok.png', 'Chanel Coco Mademoiselle EDP\nR\$749,00'],
    ['assets/images/hellok.png', 'O Boticário Elysée EDP\nR\$199,90'],
    ['assets/images/hellok.png', 'Natura Essencial Exclusivo EDP\nR\$159,90'],
  ],
  'Perfume Sólido': [
    ['assets/images/hellok.png', 'Lush Solid Perfume Karma\nR\$59,90'],
    ['assets/images/hellok.png', 'Quintal Sólido Natural\nR\$39,90'],
    ['assets/images/hellok.png', 'BeeBeauty Sólido Floral\nR\$19,90'],
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
                    ' > Perfumes',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1C364E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Subcategorias dinâmicas
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
                                    preco: product[2],
                                    descricao: 'Um produto incrível para você!',
                                  ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: Column(
                                  children: [
                                   
                              Image.asset(product[0], width: 100, height: 120, fit: BoxFit.cover),
                              const SizedBox(height: 4),
                              Text(product[1], style: const TextStyle(fontSize: 14)),
                             Text('R\$ ${(product[2] as double).toStringAsFixed(2)}'),
                            ],
                                    
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
