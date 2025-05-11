import 'package:flutter/material.dart';

// 📄 Importa outras telas do seu app
import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias

// 🧴 Tela principal de cuidados com a pele e suas subcategorias
class SkinCareSubcategoriesPage extends StatelessWidget {
  const SkinCareSubcategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Mapa contendo as subcategorias e seus produtos
    final subcategories = {
      'Sabonete Facial': [
        ['assets/images/hellok.png', 'Sabonete 1'],
        ['assets/images/hellok.png', 'Sabonete 2'],
        ['assets/images/hellok.png', 'Sabonete 3'],
      ],
      'Tônico ou Água Micelar': [
        ['assets/images/hellok.png', 'Tônico 1'],
        ['assets/images/hellok.png', 'Tônico 2'],
        ['assets/images/hellok.png', 'Água Micelar 1'],
      ],
      'Hidratante Facial': [
        ['assets/images/hellok.png', 'Hidratante 1'],
        ['assets/images/hellok.png', 'Hidratante 2'],
        ['assets/images/hellok.png', 'Hidratante 3'],
      ],
      'Protetor Solar': [
        ['assets/images/hellok.png', 'Protetor Solar 1'],
        ['assets/images/hellok.png', 'Protetor Solar 2'],
        ['assets/images/hellok.png', 'Protetor Solar 3'],
      ],
      'Esfoliante': [
        ['assets/images/hellok.png', 'Esfoliante 1'],
        ['assets/images/hellok.png', 'Esfoliante 2'],
        ['assets/images/hellok.png', 'Esfoliante 3'],
      ],
      'Sérum': [
        ['assets/images/hellok.png', 'Sérum 1'],
        ['assets/images/hellok.png', 'Sérum 2'],
        ['assets/images/hellok.png', 'Sérum 3'],
      ],
      'Demaquilante': [
        ['assets/images/hellok.png', 'Demaquilante 1'],
        ['assets/images/hellok.png', 'Demaquilante 2'],
        ['assets/images/hellok.png', 'Demaquilante 3'],
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
                    ' > Skin Care',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1C364E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              //  Gera dinamicamente as subcategorias de cuidados com a pele
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
                        border: subcategory == 'Sabonete Facial'
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
                            return Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: Image.asset(
                                product[0],
                                width: 100,
                                height: 120,
                                fit: BoxFit.cover,
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
