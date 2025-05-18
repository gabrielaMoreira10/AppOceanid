//  Importações de pacotes essenciais do Flutter
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piloto/categoria/hairSubcategoria.dart';
import 'package:piloto/categoria/makeSubcategoria.dart';
import 'package:piloto/categoria/perfumeSubcategoria.dart';
import 'package:piloto/categoria/skincareSubcategoria.dart';
import 'package:provider/provider.dart'; //  Gerenciamento de estado
import 'categoria/categorias_page.dart'; //  Página de categorias
import 'login/loginOceanid.dart'; //  Página de login
import 'detalhes.dart'; //  Página de detalhes do produto
import 'carrinho/carrinhoProvider.dart'; //  Provider do carrinho
import 'carrinho/carrinhoPage.dart'; //  Página do carrinho
import 'buscar.dart'; // Página de busca
import 'favorito/favoritos.dart'; // Página de favoritos
import 'favorito/favoritosProvider.dart'; // provider de favoritos
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritosProvider()),
      ],

      child: const MyApp(),
    ),
  );
}

//  Estrutura principal do app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oceanid App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Usa Material Design 3
      ),
      home: const HomePageWidget(), // Página inicial
    );
  }
}

//  Tela inicial
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentCarouselIndex = 0; // Índice do carrossel de imagens

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Fecha o teclado ao clicar fora
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 🔷 Topo com logo e ícones
                _buildTopBar(),

                // 🔷 Carrossel de imagens
                _buildCarousel(),

                // 🔷 Dots indicadores do carrossel
                _buildCarouselDots(),

                // 🔷 Lista horizontal de categorias
                _buildCategoryList(),

                _buildBannerFaixa(),

                // 🔷 Seções de produtos
                _buildProductSection('Makes', [
                  [
                    'assets/images/hellok.png',
                    'Batom Líquido Matte - Bruna Tavares',
                  ],
                  ['assets/images/hellok.png', 'Blush Compacto - Vult'],
                  ['assets/images/hellok.png', 'Corretivo Líquido - Dailus'],
                  [
                    'assets/images/hellok.png',
                    'Pó Compacto - Boca Rosa Beauty',
                  ],
                ]),

                _buildProductSection('Skincare', [
                  ['assets/images/hellok.png', 'Protetor Solar - Needs'],
                  [
                    'assets/images/hellok.png',
                    'Demaquilante Bifásico - Ruby Rose',
                  ],
                  ['assets/images/hellok.png', 'Água Micelar - L\'Oréal'],
                  ['assets/images/hellok.png', 'Sérum Facial - Tracta'],
                ]),

                _buildProductSection('Hair', [
                  ['assets/images/hellok.png', 'Shampoo Nutritivo - Haskell'],
                  ['assets/images/hellok.png', 'Máscara Capilar - Skala'],
                  ['assets/images/hellok.png', 'Óleo Capilar - Lola Cosmetics'],
                  ['assets/images/hellok.png', 'Leave-in Cachos - Salon Line'],
                ]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(), // 🔧 Rodapé fixo aqui
      ),
    );
  }

  //  Topo com logo e ícones
  Widget _buildTopBar() {
    return Container(
      width: 463.2,
      height: 66.62,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/images/concha.png',
                width: 45,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Ícones
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },
                  child: _buildIcon('assets/images/Search.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoritosPage()),
                    );
                  },
                  child: _buildIcon('assets/images/favoritos.png', size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildCarousel() {
  List<String> imageUrls = [
     'https://images.pexels.com/photos/1499511/pexels-photo-1499511.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1377034/pexels-photo-1377034.jpeg',
    'https://images.pexels.com/photos/13964625/pexels-photo-13964625.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/3373738/pexels-photo-3373738.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1g',
  ];

  return Container(
    height: 180,
    child: PageView.builder(
      itemCount: imageUrls.length,
      onPageChanged: (index) {
        setState(() {
          _currentCarouselIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrls[index],
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  );
}

  //  Dots do carrossel
  Widget _buildCarouselDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _currentCarouselIndex == index
                    ? Colors.grey
                    : Colors.grey.shade400,
          ),
        );
      }),
    );
  }

  /// Lista horizontal de categorias
  Widget _buildCategoryList() {
    return Container(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryItem(
              'assets/images/hellok.png',
              'Iluminadores',
              MakesSubcategoriesPage(),
            ),
            _buildCategoryItem(
              'assets/images/hellok.png',
              'Bases',
              MakesSubcategoriesPage(),
            ),
            _buildCategoryItem(
              'assets/images/hellok.png',
              'Serum',
              SkinCareSubcategoriesPage(),
            ),
            _buildCategoryItem(
              'assets/images/hellok.png',
              'Protetor Solar',
              SkinCareSubcategoriesPage(),
            ),
            _buildCategoryItem(
              'assets/images/hellok.png',
              'Kit capilar',
              HairCareSubcategoriesPage(),
            ),
            _buildCategoryItem(
              'assets/images/hellok.png',
              'Body Splash',
              FragranceSubcategoriesPage(),
            ),
          ],
        ),
      ),
    );
  }

  //  Item de Categoria (com navegação)
  Widget _buildCategoryItem(String imagePath, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        width: 150,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  // MÉTODO NOVO para faixa de imagem/banner
  Widget _buildBannerFaixa() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset("assets/images/faixa.png"),
      ),
    );
  }
Widget _buildProductSection(String sectionTitle, List<List<String>> products) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 15),
          child: Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1C364E),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products.map((product) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdutoDetalhesPage(
                          nome: product[1],
                          imagemAsset: product[0],
                          preco: '47.90',
                          descricao: _gerarDescricao(product[1], sectionTitle),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            product[0],
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product[1],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}
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

  final random = Random();
  final descricoes = templates[categoria]!;
  return descricoes[random.nextInt(descricoes.length)];
}


  //  Rodapé inferior (menu)
  Widget _buildBottomNavBar() {
    return Container(
      height: 60,
      color: const Color(0xFFEFC6D8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem('assets/images/home.png'),
          _buildBottomNavItem('assets/images/categoria.png'),
          _buildBottomNavItem('assets/images/login.png'),
          _buildBottomNavItem('assets/images/carrinho.png'),
        ],
      ),
    );
  }

  //  Item do menu inferior
  Widget _buildBottomNavItem(String imagePath) {
    return GestureDetector(
      onTap: () {
        if (imagePath == 'assets/images/categoria.png') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesPage()),
          );
        } else if (imagePath == 'assets/images/home.png') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePageWidget()),
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
        child: Image.asset(imagePath, width: 28, height: 28, fit: BoxFit.cover),
      ),
    );
  }

  // Ícones do topo (search, favoritos, carrinho)
  Widget _buildIcon(String path, {double size = 25}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(path, width: size, height: size, fit: BoxFit.cover),
      ),
    );
  }
}
