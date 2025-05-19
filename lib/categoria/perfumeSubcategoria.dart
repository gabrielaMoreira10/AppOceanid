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

  String _gerarDescricao(String nomeProduto, String categoria) {
    final Map<String, List<String>> templates = {
      'Perfume': [
        'O $nomeProduto é uma fragrância envolvente que combina notas elegantes e duradouras.',
        'Sinta a essência do luxo com o $nomeProduto, perfeito para ocasiões especiais.',
        'Descubra o aroma exclusivo do $nomeProduto, que desperta os sentidos.'
      ],
      'Body Splash': [
        'Refresque-se a qualquer momento com o $nomeProduto, leve e revigorante.',
        'O $nomeProduto oferece uma fragrância suave e perfeita para o dia a dia.',
        'Sinta-se renovado com o toque delicado do $nomeProduto.'
      ],
      'Eau de Parfum': [
        'O $nomeProduto combina alta concentração de fragrância para uma presença marcante.',
        'Destaque-se com o $nomeProduto, que revela uma fragrância intensa e sofisticada.',
        'Uma experiência olfativa duradoura com o $nomeProduto, ideal para momentos especiais.'
      ],
      'Sólido': [
        'O $nomeProduto é prático e portátil, oferecendo uma fragrância a qualquer momento.',
        'Descubra a suavidade e a durabilidade do $nomeProduto em formato sólido.',
        'Aplique o $nomeProduto diretamente na pele e aproveite sua fragrância discreta.'
      ]
    };

    final categoryTemplates = templates[categoria] ?? [
      'O $nomeProduto é um produto de alta qualidade para te deixar cheirosa(o).',
      'Descubra a excelência do $nomeProduto em sua rotina.',
      '$nomeProduto: inovação e performance em um único produto.'
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
      'Body Splash': [
        ['assets/images/vitoria.jpeg', 'Victoria\'s Secret Pure Seduction\nR\$79,90'],
        ['assets/images/bodyobo.jpeg', 'O Boticário Cuide-se Bem Splash\nR\$39,90'],
        ['assets/images/bodysplash.jpeg', 'Avon Far Away Body Mist\nR\$29,90'],
      ],
      'Eau de Toilette': [
        ['assets/images/dior.jpeg', 'Dior Sauvage EDT\nR\$499,00'],
        ['assets/images/lili.jpeg', 'O Boticário Lily EDT\nR\$139,90'],
        ['assets/images/naturaekos.jpeg', 'Natura Ekos Frescor\nR\$69,90'],
      ],
      'Eau de Parfum': [
        ['assets/images/channel.jpeg', 'Chanel Coco Mademoiselle EDP\nR\$749,00'],
        ['assets/images/elyse.jpeg', 'O Boticário Elysée EDP\nR\$199,90'],
        ['assets/images/essencial.jpeg', 'Natura Essencial Exclusivo EDP\nR\$159,90'],
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