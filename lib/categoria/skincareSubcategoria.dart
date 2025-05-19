import 'package:flutter/material.dart';

// Importa outras telas do seu app
import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias
import '../detalhes.dart'; // Página de detalhes do produto
import '../carrinho/carrinhoPage.dart';

// 🧴 Tela principal de cuidados com a pele e suas subcategorias
class SkinCareSubcategoriesPage extends StatelessWidget {
  const SkinCareSubcategoriesPage({super.key});

  String _gerarDescricao(String nomeProduto, String categoria) {
    final Map<String, List<String>> templates = {
      'Sabonete Facial': [
        'O $nomeProduto limpa profundamente sem ressecar, ideal para sua rotina de cuidados.',
        'Experimente a limpeza suave do $nomeProduto para uma pele renovada.',
        '$nomeProduto: a limpeza perfeita para o seu tipo de pele.'
      ],
      'Tônico ou Água Micelar': [
        'O $nomeProduto remove impurezas e prepara a pele para os próximos cuidados.',
        'Equilibre seu pH com o $nomeProduto para uma pele mais saudável.',
        'Descubra o poder de limpeza suave do $nomeProduto.'
      ],
      'Hidratante Facial': [
        'O $nomeProduto hidrata profundamente e mantém sua pele macia o dia todo.',
        'Proteja sua barreira cutânea com a fórmula avançada do $nomeProduto.',
        'Hidratação intensa e duradoura com o $nomeProduto.'
      ],
      'Protetor Solar': [
        'O $nomeProduto oferece proteção UVA/UVB com textura leve e secagem rápida.',
        'Proteja sua pele dos danos solares com o $nomeProduto.',
        'Filtros modernos e alta proteção no $nomeProduto.'
      ],
      'Esfoliante': [
        'O $nomeProduto remove células mortas e renova sua pele suavemente.',
        'Textura delicada e eficaz no $nomeProduto para uma esfoliação perfeita.',
        'Renove sua pele sem agredir com o $nomeProduto.'
      ],
      'Sérum': [
        'O $nomeProduto entrega ativos poderosos diretamente nas camadas mais profundas.',
        'Tratamento intensivo com a tecnologia avançada do $nomeProduto.',
        'Resultados visíveis com o uso contínuo do $nomeProduto.'
      ],
      'Demaquilante': [
        'O $nomeProduto remove até a maquiagem mais resistente sem irritar.',
        'Limpeza suave e eficaz com o $nomeProduto.',
        'Mantenha sua pele limpa e saudável com o $nomeProduto.'
      ],
    };
    
    final categoryTemplates = templates[categoria] ?? [
      'O $nomeProduto é um produto de alta qualidade para sua rotina de cuidados com a pele.',
      'Descubra os benefícios do $nomeProduto para uma pele mais saudável.',
      '$nomeProduto: inovação em cuidados dermatológicos.'
    ];
    
    return categoryTemplates[DateTime.now().millisecondsSinceEpoch % categoryTemplates.length];
  }

  double _extrairPreco(String produtoDescricao) {
    try {
      final precoStr = produtoDescricao.split('R\$')[1].replaceAll(',', '.');
      return double.parse(precoStr);
    } catch (e) {
      return 0.0; // Valor padrão caso ocorra algum erro
    }
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
        } else if (imagePath == 'assets/images/carrinho.png') {
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

  @override
  Widget build(BuildContext context) {
    final subcategories = {
      'Sabonete Facial': [
        ['assets/images/sabonetelaroche.png', 'La Roche-Posay Effaclar Gel\nR\$59,90'],
        ['assets/images/sabonetevichy.png', 'Vichy Normaderm Gel\nR\$49,90'],
        ['assets/images/hellok.png', 'Needs Sabonete Facial\nR\$19,90'],
      ],
      'Tônico ou Água Micelar': [
        ['assets/images/biodermaagua.png', 'Bioderma Sensibio H2O\nR\$79,90'],
        ['assets/images/niveaagua.png', 'Nivea Tônico Adstringente\nR\$29,90'],
        ['assets/images/hellok.png', 'L\'Oréal Água Micelar\nR\$19,90'],
      ],
      'Hidratante Facial': [
        ['assets/images/clinique.jpeg', 'Clinique Moisture Surge\nR\$149,90'],
        ['assets/images/niveahidra.jpeg', 'Nivea Soft\nR\$29,90'],
        ['assets/images/neutro.jpeg', 'Neutrogena Hydro Boost\nR\$59,90'],
      ],
      'Protetor Solar': [
        ['assets/images/protetorneeds.png', 'Protetor Solar - Needs\nR\$99,90'],
        ['assets/images/larocheps.jpeg', 'La Roche-Posay Anthelios Airlicium\nR\$79,90'],
        ['assets/images/protenivea.jpeg', 'Nivea Sun Toque Seco\nR\$29,90'],
      ],
      'Esfoliante': [
        ['assets/images/dermoesfoli.jpeg', 'Dermotivin Scrub\nR\$69,90'],
        ['assets/images/niveaesfoli.jpeg', 'Nivea Esfoliante Facial\nR\$19,90'],
        ['assets/images/needsesfoli.jpeg', 'Needs Esfoliante Suave\nR\$12,90'],
      ],
      'Sérum': [
        ['assets/images/serumlaroche.png', 'La Roche-Posay Hyalu B5\nR\$149,90'],
        ['assets/images/hellok.png', 'Tracta Sérum Anti-Idade\nR\$39,90'],
        ['assets/images/hellok.png', 'Vult Sérum Facial Vitamina C\nR\$29,90'],
      ],
      'Demaquilante': [
        ['assets/images/hellok.png', 'Bi-Facil Lancôme\nR\$159,90'],
        ['assets/images/lorealagua.jpg', 'L\'Oréal Água Micelar \nR\$24,90'],
        ['assets/images/hellok.png', 'Ruby Rose Demaquilante\nR\$14,90'],
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
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProdutoDetalhesPage(
                                      nome: product[1],
                                      imagemAsset: product[0],
                                      preco: _extrairPreco(product[1]),
                                      descricao: _gerarDescricao(product[1].split('\n')[0], subcategory),
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
}