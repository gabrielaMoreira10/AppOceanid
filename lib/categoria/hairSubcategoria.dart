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

  String _gerarDescricao(String nomeProduto, String categoria) {
    final Map<String, List<String>> templates = {
      'Makes': [
        'Realce sua beleza com $nomeProduto. Textura única e pigmentação intensa para um acabamento perfeito.',
        '$nomeProduto: a escolha profissional para um make impecável que dura o dia todo.',
        'Descubra a diferença que $nomeProduto faz na sua rotina de maquiagem.'
      ],
      'Skincare': [
        'Cuidado especializado com $nomeProduto. Formulado para nutrir e proteger sua pele diariamente.',
        'Inovação em cuidados dermatológicos: $nomeProduto traz resultados visíveis desde a primeira aplicação.',
        'Sua pele merece o melhor. $nomeProduto oferece tratamento especializado para cada necessidade.'
      ],
      'Hair': [
        'Transforme seus fios com $nomeProduto. Fórmula exclusiva para cabelos mais saudáveis e brilhantes.',
        '$nomeProduto: o cuidado profissional que seus cabelos precisam, agora em casa.',
        'Desenvolvido por especialistas, $nomeProduto repara e protege seus fios contra danos diários.'
      ]
    };
    
    // Seleciona a categoria ou usa 'Hair' como padrão
    final categoryTemplates = templates[categoria] ?? templates['Hair']!;
    return categoryTemplates[0]; // Retorna a primeira descrição disponível
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
    // 🔥 Mapa contendo as subcategorias e seus produtos
    final subcategories = {
      'Shampoo': [
        ['assets/images/KérastaseBain.png', 'Kérastase Bain Satin 1\nR\$149,00'],
        ['assets/images/shampoolola.png', 'Lola Cosmetics Meu Cacho Minha Vida\nR\$29,90'],
        ['assets/images/shampoodove.png', 'Dove Hidratação Intensa\nR\$12,90'],
      ],
      'Condicionador': [
        ['assets/images/condkera.png', 'Kérastase Lait Vital\nR\$159,00'],
        ['assets/images/lolacond.jpeg', 'Lola Cosmetics Meu Cacho Minha Vida\nR\$32,90'],
        ['assets/images/dovecond.jpeg', 'Dove Hidratação Intensa\nR\$13,90'],
      ],
      'Máscara de Hidratação': [
        ['assets/images/joico.jpeg', 'Joico Moisture Recovery\nR\$189,00'],
        ['assets/images/novex.jpeg', 'Novex Óleo de Coco\nR\$19,90'],
        ['assets/images/skala.jpeg', 'Skala Bomba de Vitaminas\nR\$8,90'],
      ],
      'Leave-in ou Creme para Pentear': [
        ['assets/images/morocanoil.jpeg', 'Moroccanoil Curl Defining Cream\nR\$180,00'],
        ['assets/images/salonli.jpeg', 'Salon Line Cachos dos Sonhos\nR\$15,90'],
        ['assets/images/pantene.jpeg', 'Pantene Creme para Pentear\nR\$10,90'],
      ],
      'Óleo Capilar': [
        ['assets/images/oleomorro.jpeg', 'Moroccanoil Treatment\nR\$199,00'],
        ['assets/images/oleopingo.jpeg', 'Lola Cosmetics Pinga!\nR\$34,90'],
        ['assets/images/oleogold.jpeg', 'Niely Gold Óleo de Argan\nR\$12,90'],
      ],
      'Protetor Térmico': [
        ['assets/images/hellok.png', 'Redken Extreme Play Safe\nR\$159,00'],
        ['assets/images/hellok.png', 'Lola Cosmetics Comigo Ninguém Pode\nR\$39,90'],
        ['assets/images/hellok.png', 'Salon Line Meu Liso Térmico\nR\$15,90'],
      ],
      'Escova ou Pente': [
        ['assets/images/hellok.png', 'Tangle Teezer Original\nR\$89,00'],
        ['assets/images/hellok.png', 'Marco Boni Escova Raquete\nR\$19,90'],
        ['assets/images/hellok.png', 'Santa Clara Pente de Madeira\nR\$9,90'],
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
                                    builder: (context) => ProdutoDetalhesPage(
                                      nome: product[1],
                                      imagemAsset: product[0],
                                      preco: _extrairPreco(product[1]),
                                      descricao: _gerarDescricao(product[1].split('\n')[0], 'Hair'),
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