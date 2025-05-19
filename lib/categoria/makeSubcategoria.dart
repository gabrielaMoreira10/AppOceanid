import 'package:flutter/material.dart';

import '../main.dart'; // Página inicial (Home)
import '../login/loginOceanid.dart'; // Página de login
import 'categorias_page.dart'; // Página de categorias
import '../detalhes.dart'; // Página de detalhes
import '../carrinho/carrinhoPage.dart';

class MakesSubcategoriesPage extends StatelessWidget {
  const MakesSubcategoriesPage({super.key});

  String _gerarDescricao(String nomeProduto, String categoria) {
    final Map<String, List<String>> templates = {
      'Batom': [
        'O $nomeProduto oferece alta pigmentação e duração prolongada para seus lábios.',
        'Experimente o $nomeProduto para um look marcante e cheio de personalidade.',
        'Textura incrível e cores vibrantes com o $nomeProduto.'
      ],
      'Base': [
        'O $nomeProduto proporciona cobertura perfeita e acabamento natural.',
        'Uniformize seu tom de pele com a tecnologia avançada do $nomeProduto.',
        'Perfeita para todos os tipos de pele, a $nomeProduto garante beleza duradoura.'
      ],
      // Adicione descrições para outras categorias conforme necessário
    };
    
    final categoryTemplates = templates[categoria] ?? [
      'O $nomeProduto é um produto de alta qualidade para realçar sua beleza.',
      'Descubra a excelência do $nomeProduto em sua rotina de maquiagem.',
      '$nomeProduto: inovação e performance em um único produto.'
    ];
    
    return categoryTemplates[0];
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
      'Batom': [
        ['assets/images/batommac.png', 'MAC Ruby Woo\nR\$139,00'],
        ['assets/images/batomBT.png', 'Bruna Tavares Líquido Matte\nR\$49,90'],
        ['assets/images/batombocarosa.png', 'Boca Rosa Cremoso\nR\$39,90'],
      ],
      'Base': [
        ['assets/images/fentybase.jpg', 'Fenty Beauty Pro Filt\'r\nR\$250,00'],
        ['assets/images/btbase.png', 'Bruna Tavares Base HD Matte\nR\$79,90'],
        ['assets/images/dailusbase.png', 'Dailus Alta Cobertura\nR\$35,90'],
      ],
      'Corretivo': [
        ['assets/images/corretivonars.jpg', 'NARS Radiant Creamy\nR\$189,00'],
        ['assets/images/corretivobt.jpg', 'Bruna Tavares Líquido\nR\$49,90'],
        ['assets/images/corretivodailus.jpg', 'Dailus Alta Cobertura\nR\$29,90'],
      ],
      'Pó compacto ou translúcido': [
        ['assets/images/polaura.jpg', 'Laura Mercier Translúcido\nR\$279,00'],
        ['assets/images/poBT.jpg', 'Bruna Tavares Pó Translúcido\nR\$69,90'],
        ['assets/images/podailus.jpg', 'Dailus Translúcido Micronizado\nR\$29,90'],
      ],
      'Blush': [
        ['assets/images/blushnars.jpg', 'NARS Orgasm\nR\$189,00'],
        ['assets/images/Blushbt.png', 'Bruna Tavares Compacto\nR\$49,90'],
        ['assets/images/blushdailus.png', 'Dailus Compacto\nR\$19,90'],
      ],
      'Iluminador': [
        ['assets/images/ilubeca.jpg', 'Becca Shimmering Skin\nR\$199,00'],
        ['assets/images/bocarosailu.png', 'Boca Rosa Beauty\nR\$39,90'],
        ['assets/images/iludailus.png', 'Dailus solto\nR\$24,90'],
      ],
      'Sombras': [
        ['assets/images/sombranaked.jpeg', 'Urban Decay Naked\nR\$299,00'],
        ['assets/images/sombrabt.jpeg', 'Bruna Tavares Paleta\nR\$99,90'],
        ['assets/images/sombradailus.jpeg', 'Dailus quarteto\nR\$29,90'],
      ],
      'Delineador e Lápis de olho': [
        ['assets/images/delineador.jpeg', 'Kat Von D Tattoo Liner\nR\$139,00'],
        ['assets/images/delineadorglam.jpeg', 'Boca Rosa Delineador Líquido\nR\$29,90'],
        ['assets/images/lapisdailus.jpeg', 'Dailus Lápis Carbon Preto\nR\$14,90'],
      ],
      'Máscara de cílios (rímel)': [
        ['assets/images/lancome.jpeg', 'Lancôme Hypnôse\nR\$199,00'],
        ['assets/images/rimelbt.jpeg', 'Fran Ruby Rose Máscara\nR\$39,90'],
        ['assets/images/rimeldailus.jpeg', 'Dailus Máscara para Cílios\nR\$24,90'],
      ],
      'Pincéis e esponjas': [
        ['assets/images/real.jpeg', 'Real Techniques Kit\nR\$179,00'],
        ['assets/images/bc.jpeg', 'Boca Rosa Kit de Pincéis\nR\$99,90'],
        ['assets/images/dailus.jpeg', 'Dailus Pincel + Esponja\nR\$39,90'],
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

  double _extrairPreco(String produtoDescricao) {
    try {
      final precoStr = produtoDescricao.split('R\$')[1].replaceAll(',', '.');
      return double.parse(precoStr);
    } catch (e) {
      return 0.0; // Valor padrão caso ocorra algum erro
    }
  }
}