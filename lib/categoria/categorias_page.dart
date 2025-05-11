import 'package:flutter/material.dart';
// ✅ IMPORTA A TELA INICIAL (Home)
import '../main.dart';
// ✅ IMPORTA A SUBCATEGORIA DE MAKES
import 'makeSubcategoria.dart';
// 📄 Importa a página de login
import '../login/loginOceanid.dart';
// 📄 Importa a página de skincare
import 'skincareSubcategoria.dart';
// 📄 Importa a página de skincare
import 'hairSubcategoria.dart';
import 'perfumeSubcategoria.dart';
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ LISTA DE CATEGORIAS – você pode adicionar mais aqui depois
    final categories = [
      {'icon': Icons.brush, 'label': 'Makes'},
      {'icon': Icons.local_florist, 'label': 'Perfumes'},
      {'icon': Icons.spa, 'label': 'Hair'},
      {'icon': Icons.face, 'label': 'Skincare'},
    ];

    // ✅ MAPEAMENTO DAS PÁGINAS DAS SUBCATEGORIAS
    final categoryPages = {
      'Makes': const MakesSubcategoriesPage(),
      'Perfumes': const FragranceSubcategoriesPage(),
      'Hair': const HairCareSubcategoriesPage(),
      'Skincare': const SkinCareSubcategoriesPage(),
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C364E),
                ),
              ),
              const SizedBox(height: 20),
              ...categories.map((category) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4E0F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(
                      category['icon'] as IconData,
                      color: const Color(0xFF1C364E),
                    ),
                    title: Text(
                      category['label'] as String,
                      style: const TextStyle(
                        color: Color(0xFF1C364E),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      final label = category['label'] as String;
                      final page = categoryPages[label];
                      if (page != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => page),
                        );
                      }
                    },
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      
      // ✅ BARRA DE NAVEGAÇÃO INFERIOR CUSTOMIZADA
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

  // 🔧 Função para construir os itens da barra de navegação
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
            MaterialPageRoute(builder: (context) => const LoginPage()), // <-- Certifique-se que você tem uma LoginPage()
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
