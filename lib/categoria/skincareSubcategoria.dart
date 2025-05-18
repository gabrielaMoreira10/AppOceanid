import 'package:flutter/material.dart';

// 📄 Importa outras telas do seu app
import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias
import '../detalhes.dart'; // Página de detalhes do produto (crie essa tela também)
import '../carrinho/carrinhoPage.dart';

// 🧴 Tela principal de cuidados com a pele e suas subcategorias
class SkinCareSubcategoriesPage extends StatelessWidget {
  const SkinCareSubcategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
final subcategories = {
  'Sabonete Facial': [
    ['assets/images/hellok.png', 'La Roche-Posay Effaclar Gel - R\$59,90'],
    ['assets/images/hellok.png', 'Vichy Normaderm Gel - R\$49,90'],
    ['assets/images/hellok.png', 'Needs Sabonete Facial - R\$19,90'],
  ],
  'Tônico ou Água Micelar': [
    ['assets/images/hellok.png', 'Bioderma Sensibio H2O - R\$79,90'],
    ['assets/images/hellok.png', 'Nivea Tônico Adstringente - R\$29,90'],
    ['assets/images/hellok.png', 'L\'Oréal Água Micelar - R\$19,90'],
  ],
  'Hidratante Facial': [
    ['assets/images/hellok.png', 'Clinique Moisture Surge - R\$149,90'],
    ['assets/images/hellok.png', 'Nivea Soft - R\$29,90'],
    ['assets/images/hellok.png', 'Neutrogena Hydro Boost - R\$59,90'],
  ],
  'Protetor Solar': [
    ['assets/images/hellok.png', 'Heliocare 360º Gel Oil-Free - R\$99,90'],
    ['assets/images/hellok.png', 'La Roche-Posay Anthelios Airlicium - R\$79,90'],
    ['assets/images/hellok.png', 'Nivea Sun Toque Seco - R\$29,90'],
  ],
  'Esfoliante': [
    ['assets/images/hellok.png', 'Dermotivin Scrub - R\$69,90'],
    ['assets/images/hellok.png', 'Nivea Esfoliante Facial - R\$19,90'],
    ['assets/images/hellok.png', 'Needs Esfoliante Suave - R\$12,90'],
  ],
  'Sérum': [
    ['assets/images/hellok.png', 'La Roche-Posay Hyalu B5 - R\$149,90'],
    ['assets/images/hellok.png', 'Tracta Sérum Anti-Idade - R\$39,90'],
    ['assets/images/hellok.png', 'Vult Sérum Facial Vitamina C - R\$29,90'],
  ],
  'Demaquilante': [
    ['assets/images/hellok.png', 'Bi-Facil Lancôme - R\$159,90'],
    ['assets/images/hellok.png', 'L\'Oréal Água Micelar Bifásica - R\$24,90'],
    ['assets/images/hellok.png', 'Ruby Rose Demaquilante - R\$14,90'],
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
