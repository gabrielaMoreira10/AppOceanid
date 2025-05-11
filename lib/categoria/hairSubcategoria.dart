import 'package:flutter/material.dart';

// 📄 Importa outras telas do seu app
import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias

// 💇‍♀️ Tela principal de cuidados capilares e suas subcategorias
class HairCareSubcategoriesPage extends StatelessWidget {
  const HairCareSubcategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Mapa contendo as subcategorias e seus produtos
    final subcategories = {
      'Shampoo': [
        ['assets/images/hellok.png', 'Shampoo 1'],
        ['assets/images/hellok.png', 'Shampoo 2'],
        ['assets/images/hellok.png', 'Shampoo 3'],
      ],
      'Condicionador': [
        ['assets/images/hellok.png', 'Condicionador 1'],
        ['assets/images/hellok.png', 'Condicionador 2'],
        ['assets/images/hellok.png', 'Condicionador 3'],
      ],
      'Máscara de Hidratação': [
        ['assets/images/hellok.png', 'Máscara 1'],
        ['assets/images/hellok.png', 'Máscara 2'],
        ['assets/images/hellok.png', 'Máscara 3'],
      ],
      'Leave-in ou Creme para Pentear': [
        ['assets/images/hellok.png', 'Leave-in 1'],
        ['assets/images/hellok.png', 'Leave-in 2'],
        ['assets/images/hellok.png', 'Creme 1'],
      ],
      'Óleo Capilar': [
        ['assets/images/hellok.png', 'Óleo 1'],
        ['assets/images/hellok.png', 'Óleo 2'],
        ['assets/images/hellok.png', 'Óleo 3'],
      ],
      'Protetor Térmico': [
        ['assets/images/hellok.png', 'Protetor 1'],
        ['assets/images/hellok.png', 'Protetor 2'],
        ['assets/images/hellok.png', 'Protetor 3'],
      ],
      'Escova ou Pente': [
        ['assets/images/hellok.png', 'Escova 1'],
        ['assets/images/hellok.png', 'Pente 1'],
        ['assets/images/hellok.png', 'Pente 2'],
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
