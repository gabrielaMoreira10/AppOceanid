import 'package:flutter/material.dart';
import 'detalhes.dart'; // Importe a sua página de detalhes

class Item {
  final String name;
  final double price;
  final String image;

  Item({required this.name, required this.price, required this.image});
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
        title: const Text('Buscar Produtos'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
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
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        'Nenhum item encontrado',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];

                      return ListTile(
                        leading: Image.asset(item.image, width: 60, height: 60),
                        title: Text(item.name),
                        subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
                        onTap: () {
                          // Navegar para a sua página de detalhes
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProdutoDetalhesPage(
                                nome: item.name, 
                                imagemAsset: item.image,
                                preco: item.price,
                                descricao: 'Descrição do produto aqui!', // Você pode customizar isso
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
