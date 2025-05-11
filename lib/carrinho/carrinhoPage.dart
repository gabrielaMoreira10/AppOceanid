import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrinhoProvider.dart';
import 'compra.dart'; // Importando a tela de Checkout

class CartScreen extends StatefulWidget {
  static const double freeShippingThreshold = 150.0;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: cart.items.isEmpty
            ? _buildEmptyCart(context)
            : _buildCartWithItems(context, cart),
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sacola",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close, size: 28),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 190),
          Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.black),
          SizedBox(height: 20),
          Text(
            "Sua sacola está vazia.",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/carrinhovazio.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartWithItems(BuildContext context, CartProvider cart) {
    double subtotal = cart.subtotal;
    double progress = (subtotal / CartScreen.freeShippingThreshold).clamp(0.0, 1.0);
    double amountMissing = (CartScreen.freeShippingThreshold - subtotal).clamp(0.0, double.infinity);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sacola",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close, size: 28),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return _buildCartItem(context, cart, item);
              },
            ),
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Color(0xFFE0DBF5),
                color: Colors.deepPurple,
                minHeight: 8,
                borderRadius: BorderRadius.circular(8),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFE0DBF5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    amountMissing == 0
                        ? "Você ganhou frete GRÁTIS!"
                        : "Faltam R\$ ${amountMissing.toStringAsFixed(2)} para frete GRÁTIS!",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _buildSummary(cart),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartProvider cart, CartItem item) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(height: 4),
                  Text('R\$ ${item.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, size: 20),
                  onPressed: () => cart.decreaseQuantity(item),
                ),
                Text('${item.quantity}', style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.add, size: 20),
                  onPressed: () => cart.increaseQuantity(item),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 20),
                  onPressed: () => cart.removeItem(item),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(CartProvider cart) {
    double subtotal = cart.subtotal;
    double delivery = 0;
    double total = subtotal + delivery;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: TextStyle(fontSize: 16)),
            Text("R\$ ${subtotal.toStringAsFixed(2)}"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Entrega", style: TextStyle(fontSize: 16)),
            Text("A calcular", style: TextStyle(color: Colors.indigo)),
          ],
        ),
        Divider(thickness: 1, height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("R\$ ${total.toStringAsFixed(2)}"),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFB2E4E5),
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            // Navegar para a tela de checkout
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          },
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
          label: Text("Comprar", style: TextStyle(color: Colors.black)),
        ),
        SizedBox(height: 8),
      ],
    );

}
}