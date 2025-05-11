import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrinhoPage.dart';
import 'carrinhoProvider.dart';




class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  void _finalizePurchase() {
  // Mostrar mensagem de confirmação
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("Compra Finalizada"),
      content: Text("Sua compra foi realizada com sucesso!"),
      actions: [
        TextButton(
          onPressed: () {
            // Limpar o carrinho após a compra
            final cartProvider = Provider.of<CartProvider>(context, listen: false);
            cartProvider.clearCart(); // Limpa o carrinho
            
            // Fecha o AlertDialog
            Navigator.pop(ctx);
            
            // Volta para a tela de carrinho vazio
            Navigator.pop(context); // Volta para a tela anterior, que pode ser a tela de carrinho vazio
          },
          child: Text("OK"),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dados para Compra")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: "Endereço"),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Telefone"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _finalizePurchase,
              child: Text("Finalizar Compra"),
            ),
          ],
        ),
      ),
    );
  }
}
