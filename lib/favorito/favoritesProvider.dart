// favoritos_provider.dart
import 'package:flutter/material.dart';
import '../buscar.dart';


class Produto {
  final String nome;
  final String imagem;
  final double preco;

  Produto({required this.nome, required this.imagem, required this.preco});

  @override
  bool operator ==(Object other) {
    return other is Produto && other.nome == nome;
  }

  @override
  int get hashCode => nome.hashCode;
}
class FavoritesProvider with ChangeNotifier {
  final List<Item> _favorites = [];

  List<Item> get favorites => _favorites;

  bool isFavorite(Item item) {
    return _favorites.any((fav) => fav.name == item.name);
  }

  void toggleFavorite(Item item) {
    final exists = _favorites.any((fav) => fav.name == item.name);
    if (exists) {
      _favorites.removeWhere((fav) => fav.name == item.name);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }
}