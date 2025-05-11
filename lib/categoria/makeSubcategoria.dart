import 'package:flutter/material.dart';

import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias
import '../detalhes.dart'; // Página de detalhes

class MakesSubcategoriesPage extends StatelessWidget {
  const MakesSubcategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final subcategories = {
      'Batom': [
        ['assets/images/hellok.png', 'Batom 1'],
        ['assets/images/hellok.png', 'Batom 2'],
        ['assets/images/hellok.png', 'Batom 3'],
      ],
      'Base': [
        ['assets/images/hellok.png', 'Base 1'],
        ['assets/images/hellok.png', 'Base 2'],
        ['assets/images/hellok.png', 'Base 3'],
      ],
      'Corretivo': [
        ['assets/images/hellok.png', 'Corretivo 1'],
        ['assets/images/hellok.png', 'Corretivo 2'],
        ['assets/images/hellok.png', 'Corretivo 3'],
      ],
      'Pó compacto ou translúcido': [
        ['assets/images/hellok.png', 'Pó 1'],
        ['assets/images/hellok.png', 'Pó 2'],
        ['assets/images/hellok.png', 'Pó 3'],
      ],
      'Blush': [
        ['assets/images/hellok.png', 'Blush 1'],
        ['assets/images/hellok.png', 'Blush 2'],
        ['assets/images/hellok.png', 'Blush 3'],
      ],
      'Iluminador': [
        ['assets/images/hellok.png', 'Iluminador 1'],
        ['assets/images/hellok.png', 'Iluminador 2'],
        ['assets/images/hellok.png', 'Iluminador 3'],
      ],
      'Sombras': [
        ['assets/images/hellok.png', 'Sombras 1'],
        ['assets/images/hellok.png', 'Sombras 2'],
        ['assets/images/hellok.png', 'Sombras 3'],
      ],
      'Delineador e Lápis de olho': [
        ['assets/images/hellok.png', 'Delineador 1'],
        ['assets/images/hellok.png', 'Lápis 1'],
        ['assets/images/hellok.png', 'Lápis 2'],
      ],
      'Máscara de cílios (rímel)': [
        ['assets/images/hellok.png', 'Rímel 1'],
        ['assets/images/hellok.png', 'Rímel 2'],
        ['assets/images/hellok.png', 'Rímel 3'],
      ],
      'Pincéis e esponjas': [
        ['assets/images/hellok.png', 'Pincel 1'],
        ['assets/images/hellok.png', 'Pincel 2'],
        ['assets/images/hellok.png', 'Esponja 1'],
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
                    ' > Makes',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1C364E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

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
                        border: subcategory == 'Batom'
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
                            final imagePath = product[0];
                            final title = product[1];

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
                                child: Column(
                                  children: [
                                    Image.asset(
                                      imagePath,
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      title,
                                      style: const TextStyle(fontSize: 14),
                                    ),
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
