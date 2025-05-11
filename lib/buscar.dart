import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item {
  final String name;
  final double price;
  final String image;

  Item({required this.name, required this.price, required this.image});
}

class FavoritosProvider with ChangeNotifier {
  final List<Item> _favorites = [];

  List<Item> get favorites => _favorites;

  bool estaNosFavoritos(Item item) {
    return _favorites.any((fav) => fav.name == item.name);
  }

  void adicionarFavorito(Item item) {
    if (!estaNosFavoritos(item)) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  void removerFavorito(Item item) {
    _favorites.removeWhere((fav) => fav.name == item.name);
    notifyListeners();
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  final List<Item> allItems = [
    Item(name: "Batom Ruby", price: 29.90, image: "assets/images/hellok.png"),
    Item(name: "Base Clara", price: 49.90, image: "assets/images/hellok.png"),
    Item(name: "Máscara de Cílios", price: 35.50, image: "assets/images/hellok.png"),
    Item(name: "Protetor Solar", price: 39.90, image: "assets/images/hellok.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = allItems
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Buscar item', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Digite o nome do produto...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) => setState(() => query = value),
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.grey),
                        SizedBox(height: 12),
                        Text(
                          'Produto não encontrado',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEEF2), // rosa claro
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item.image,
                            width: 60,
                            height: 60,
                          ),
                          title: Text(item.name),
                          subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
                          trailing: Consumer<FavoritosProvider>(
                            builder: (context, favoritosProvider, _) {
                              final jaFavoritado = favoritosProvider.estaNosFavoritos(item);

                              return IconButton(
                                icon: Icon(
                                  jaFavoritado ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.pinkAccent,
                                ),
                                onPressed: () {
                                  if (jaFavoritado) {
                                    favoritosProvider.removerFavorito(item);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Removido dos favoritos')),
                                    );
                                  } else {
                                    favoritosProvider.adicionarFavorito(item);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Adicionado aos favoritos')),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
