import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'favoritosProvider.dart'; // importe o provider corretamente

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = Provider.of<FavoritosProvider>(context);
    final favoritos = favoritosProvider.favoritos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Favoritos", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: favoritos.isEmpty
          ? const Center(child: Text("Nenhum item nos favoritos"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoritos.length,
              itemBuilder: (_, index) {
                final produto = favoritos[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Image.asset(produto.imagem, height: 60),
                    title: Text(produto.nome),
                    subtitle: Text("R\$${produto.preco.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.pink),
                      onPressed: () => favoritosProvider.removerFavorito(produto),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
