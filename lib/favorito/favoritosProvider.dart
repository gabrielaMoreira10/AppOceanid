// favoritos_provider.dart
import 'package:flutter/material.dart';

class Produto {
  final String nome;
  final String imagem;
  final String preco;

  Produto({required this.nome, required this.imagem, required this.preco});

  @override
  bool operator ==(Object other) {
    return other is Produto && other.nome == nome;
  }

  @override
  int get hashCode => nome.hashCode;
}

class FavoritosProvider with ChangeNotifier {
  final List<Produto> _favoritos = [];

  List<Produto> get favoritos => _favoritos;

  void adicionarFavorito(Produto produto) {
    _favoritos.add(produto);
    notifyListeners();
  }

  void removerFavorito(Produto produto) {
    _favoritos.remove(produto);
    notifyListeners();
  }

  bool estaNosFavoritos(Produto produto) {
    return _favoritos.contains(produto);
  }
}
