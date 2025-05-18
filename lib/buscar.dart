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
  // Cuidados com a Pele
  Item(name: "Sabonete Facial La Roche-Posay Effaclar Gel", price: 59.90, image: "assets/images/hellok.png"),
  Item(name: "Sabonete Facial Vichy Normaderm Gel", price: 49.90, image: "assets/images/hellok.png"),
  Item(name: "Sabonete Facial Needs", price: 19.90, image: "assets/images/hellok.png"),
  
  Item(name: "Tônico Bioderma Sensibio H2O", price: 79.90, image: "assets/images/hellok.png"),
  Item(name: "Tônico Nivea Adstringente", price: 29.90, image: "assets/images/hellok.png"),
  Item(name: "Água Micelar L'Oréal", price: 19.90, image: "assets/images/hellok.png"),
  
  Item(name: "Hidratante Facial Clinique Moisture Surge", price: 149.90, image: "assets/images/hellok.png"),
  Item(name: "Hidratante Facial Nivea Soft", price: 29.90, image: "assets/images/hellok.png"),
  Item(name: "Hidratante Facial Neutrogena Hydro Boost", price: 59.90, image: "assets/images/hellok.png"),
  
  Item(name: "Protetor Solar Heliocare 360º Gel Oil-Free", price: 99.90, image: "assets/images/hellok.png"),
  Item(name: "Protetor Solar La Roche-Posay Anthelios Airlicium", price: 79.90, image: "assets/images/hellok.png"),
  Item(name: "Protetor Solar Nivea Sun Toque Seco", price: 29.90, image: "assets/images/hellok.png"),
  
  Item(name: "Esfoliante Dermotivin Scrub", price: 69.90, image: "assets/images/hellok.png"),
  Item(name: "Esfoliante Nivea Facial", price: 19.90, image: "assets/images/hellok.png"),
  Item(name: "Esfoliante Needs Suave", price: 12.90, image: "assets/images/hellok.png"),
  
  Item(name: "Sérum La Roche-Posay Hyalu B5", price: 149.90, image: "assets/images/hellok.png"),
  Item(name: "Sérum Tracta Anti-Idade", price: 39.90, image: "assets/images/hellok.png"),
  Item(name: "Sérum Vult Vitamina C", price: 29.90, image: "assets/images/hellok.png"),
  
  Item(name: "Demaquilante Bi-Facil Lancôme", price: 159.90, image: "assets/images/hellok.png"),
  Item(name: "Demaquilante L'Oréal Água Micelar Bifásica", price: 24.90, image: "assets/images/hellok.png"),
  Item(name: "Demaquilante Ruby Rose", price: 14.90, image: "assets/images/hellok.png"),

  // Cabelos
  Item(name: "Shampoo Kérastase Bain Satin 1", price: 149.00, image: "assets/images/KérastaseBain.png"),
  Item(name: "Shampoo Lola Cosmetics Meu Cacho Minha Vida", price: 29.90, image: "assets/images/hellok.png"),
  Item(name: "Shampoo Dove Hidratação Intensa", price: 12.90, image: "assets/images/hellok.png"),
  
  Item(name: "Condicionador Kérastase Lait Vital", price: 159.00, image: "assets/images/hellok.png"),
  Item(name: "Condicionador Lola Cosmetics Meu Cacho Minha Vida", price: 32.90, image: "assets/images/hellok.png"),
  Item(name: "Condicionador Dove Hidratação Intensa", price: 13.90, image: "assets/images/hellok.png"),
  
  Item(name: "Máscara de Hidratação Joico Moisture Recovery", price: 189.00, image: "assets/images/hellok.png"),
  Item(name: "Máscara de Hidratação Novex Óleo de Coco", price: 19.90, image: "assets/images/hellok.png"),
  Item(name: "Máscara de Hidratação Skala Bomba de Vitaminas", price: 8.90, image: "assets/images/hellok.png"),
  
  Item(name: "Leave-in Moroccanoil Curl Defining Cream", price: 180.00, image: "assets/images/hellok.png"),
  Item(name: "Leave-in Salon Line Cachos dos Sonhos", price: 15.90, image: "assets/images/hellok.png"),
  Item(name: "Creme para Pentear Pantene", price: 10.90, image: "assets/images/hellok.png"),
  
  Item(name: "Óleo Capilar Moroccanoil Treatment", price: 199.00, image: "assets/images/hellok.png"),
  Item(name: "Óleo Capilar Lola Cosmetics Pinga!", price: 34.90, image: "assets/images/hellok.png"),
  Item(name: "Óleo Capilar Niely Gold Óleo de Argan", price: 12.90, image: "assets/images/hellok.png"),
  
  Item(name: "Protetor Térmico Redken Extreme Play Safe", price: 159.00, image: "assets/images/hellok.png"),
  Item(name: "Protetor Térmico Lola Cosmetics Comigo Ninguém Pode", price: 39.90, image: "assets/images/hellok.png"),
  Item(name: "Protetor Térmico Salon Line Meu Liso Térmico", price: 15.90, image: "assets/images/hellok.png"),
  
  Item(name: "Escova Tangle Teezer Original", price: 89.00, image: "assets/images/hellok.png"),
  Item(name: "Escova Marco Boni Raquete", price: 19.90, image: "assets/images/hellok.png"),
  Item(name: "Pente Santa Clara de Madeira", price: 9.90, image: "assets/images/hellok.png"),

  // Maquiagem
  Item(name: "Batom MAC Ruby Woo", price: 139.00, image: "assets/images/hellok.png"),
  Item(name: "Batom Bruna Tavares Líquido Matte", price: 49.90, image: "assets/images/hellok.png"),
  Item(name: "Batom Boca Rosa Cremoso", price: 39.90, image: "assets/images/hellok.png"),
  
  Item(name: "Base Fenty Beauty Pro Filt'r", price: 250.00, image: "assets/images/hellok.png"),
  Item(name: "Base Bruna Tavares HD Matte", price: 79.90, image: "assets/images/hellok.png"),
  Item(name: "Base Dailus Alta Cobertura", price: 35.90, image: "assets/images/hellok.png"),
  
  Item(name: "Corretivo NARS Radiant Creamy", price: 189.00, image: "assets/images/hellok.png"),
  Item(name: "Corretivo Bruna Tavares Líquido", price: 49.90, image: "assets/images/hellok.png"),
  Item(name: "Corretivo Dailus Alta Cobertura", price: 29.90, image: "assets/images/hellok.png"),
  
  Item(name: "Pó Translúcido Laura Mercier", price: 279.00, image: "assets/images/hellok.png"),
  Item(name: "Pó Translúcido Bruna Tavares", price: 69.90, image: "assets/images/hellok.png"),
  Item(name: "Pó Translúcido Dailus Micronizado", price: 29.90, image: "assets/images/hellok.png"),
  
  Item(name: "Blush NARS Orgasm", price: 189.00, image: "assets/images/hellok.png"),
  Item(name: "Blush Bruna Tavares Compacto", price: 49.90, image: "assets/images/hellok.png"),
  Item(name: "Blush Dailus Compacto", price: 19.90, image: "assets/images/hellok.png"),
  
  Item(name: "Iluminador Becca Shimmering Skin", price: 199.00, image: "assets/images/hellok.png"),
  Item(name: "Iluminador Boca Rosa Beauty", price: 39.90, image: "assets/images/hellok.png"),
  Item(name: "Iluminador Dailus Compacto", price: 24.90, image: "assets/images/hellok.png"),
  
  Item(name: "Paleta de Sombras Urban Decay Naked", price: 299.00, image: "assets/images/hellok.png"),
  Item(name: "Paleta de Sombras Bruna Tavares", price: 99.90, image: "assets/images/hellok.png"),
  Item(name: "Paleta de Sombras Dailus Quinteto", price: 29.90, image: "assets/images/hellok.png"),
  
  Item(name: "Delineador Kat Von D Tattoo Liner", price: 139.00, image: "assets/images/hellok.png"),
  Item(name: "Delineador Boca Rosa Líquido", price: 29.90, image: "assets/images/hellok.png"),
  Item(name: "Lápis de Olho Dailus Carbon Preto", price: 14.90, image: "assets/images/hellok.png"),
  
  Item(name: "Máscara de Cílios Lancôme Hypnôse", price: 199.00, image: "assets/images/hellok.png"),
  Item(name: "Máscara de Cílios Fran Ruby Rose", price: 39.90, image: "assets/images/hellok.png"),
  Item(name: "Máscara de Cílios Dailus", price: 24.90, image: "assets/images/hellok.png"),
  
  Item(name: "Kit de Pincéis Real Techniques", price: 179.00, image: "assets/images/hellok.png"),
  Item(name: "Kit de Pincéis Boca Rosa", price: 99.90, image: "assets/images/hellok.png"),
  Item(name: "Pincel + Esponja Dailus", price: 39.90, image: "assets/images/hellok.png"),

  // Perfumaria
  Item(name: "Body Splash Victoria's Secret Pure Seduction", price: 79.90, image: "assets/images/hellok.png"),
  Item(name: "Body Splash O Boticário Cuide-se Bem", price: 39.90, image: "assets/images/hellok.png"),
  Item(name: "Body Splash Avon Far Away", price: 29.90, image: "assets/images/hellok.png"),
  
  Item(name: "Eau de Toilette Dior Sauvage", price: 499.00, image: "assets/images/hellok.png"),
  Item(name: "Eau de Toilette O Boticário Lily", price: 139.90, image: "assets/images/hellok.png"),
  Item(name: "Eau de Toilette Natura Ekos Frescor", price: 69.90, image: "assets/images/hellok.png"),
  
  Item(name: "Eau de Parfum Chanel Coco Mademoiselle", price: 749.00, image: "assets/images/hellok.png"),
  Item(name: "Eau de Parfum O Boticário Elysée", price: 199.90, image: "assets/images/hellok.png"),
  Item(name: "Eau de Parfum Natura Essencial Exclusivo", price: 159.90, image: "assets/images/hellok.png"),
  
  Item(name: "Perfume Sólido Lush Karma", price: 59.90, image: "assets/images/hellok.png"),
  Item(name: "Perfume Sólido Quintal Natural", price: 39.90, image: "assets/images/hellok.png"),
  Item(name: "Perfume Sólido BeeBeauty Floral", price: 19.90, image: "assets/images/hellok.png"),
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
