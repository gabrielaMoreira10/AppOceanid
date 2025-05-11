//  Importações de pacotes essenciais do Flutter
import 'package:flutter/material.dart';
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
      
      providers: [ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => FavoritosProvider()),],
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
      title: 'Beauty App',
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

                // 🔷 Seções de produtos
                _buildProductSection('Makes', [
                  ['assets/images/hellok.png', 'Blush - HareBeauty'],
                  ['assets/images/hellok.png', 'Corretivo - Oceanne'],
                  ['assets/images/hellok.png', 'Base - Nars'],
                  ['assets/images/hellok.png', 'Contorno - Oceanne'],
                ]),
                _buildProductSection('Skincare', [
                  ['assets/images/hellok.png', 'Protetor Solar'],
                  ['assets/images/hellok.png', 'Demaquilante - Eudora'],
                  ['assets/images/hellok.png', 'Base - Nars'],
                  ['assets/images/hellok.png', 'Contorno - Oceanne'],
                ]),
                _buildProductSection('Hair', [
                  ['assets/images/hellok.png', 'Acidificante - Haskel'],
                  ['assets/images/hellok.png', 'Leave-in - L\'Oreal'],
                  ['assets/images/hellok.png', 'Base - Nars'],
                  ['assets/images/hellok.png', 'Contorno - Oceanne'],
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
                width: 50,
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
                
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  },
                  child: _buildIcon('assets/images/carrinho.png', size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //  Carrossel de imagens
  Widget _buildCarousel() {
    return Container(
      height: 180,
      child: PageView.builder(
        itemCount: 3,
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
                [
                  'https://picsum.photos/seed/996/600',
                  'https://picsum.photos/seed/758/600',
                  'https://picsum.photos/seed/292/600',
                ][index],
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

  //  Lista horizontal de categorias
  Widget _buildCategoryList() {
    return Container(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryItem('assets/images/hellok.png', 'Iluminadores'),
            _buildCategoryItem('assets/images/hellok.png', 'Bases'),
            _buildCategoryItem('assets/images/hellok.png', 'Serum'),
            _buildCategoryItem('assets/images/hellok.png', 'Protetor Solar'),
            _buildCategoryItem('assets/images/hellok.png', 'Kit capilar'),
            _buildCategoryItem('assets/images/hellok.png', 'Body Splash'),
          ],
        ),
      ),
    );
  }

  //  Item de Categoria (com navegação)
  Widget _buildCategoryItem(String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriesPage()),
        );
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

  //  Seções de produtos
  Widget _buildProductSection(
    String sectionTitle,
    List<List<String>> products,
  ) {
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
                children:
                    products.map((product) {
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
                              Text(product[1], textAlign: TextAlign.center),
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
