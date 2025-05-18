import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final order = {
      'id': '#78952',
      'date': DateTime(2023, 11, 15, 14, 30),
      'status': 'Entregue',
      'items': [
        {
          'name': 'Batom MAC Ruby Woo',
          'price': 139.00,
          'quantity': 1,
          'image': 'assets/images/hellok.png'
        },
        {
          'name': 'Base Fenty Beauty Pro Filt\'r',
          'price': 250.00,
          'quantity': 1,
          'image': 'assets/images/hellok.png'
        },
      ],
      'delivery': 15.00,
      'address': 'Rua das Flores, 123 - Apt 45\nSão Paulo, SP\nCEP: 01234-567',
    };

 final double total = (order['items'] as List<Map<String, dynamic>>)
    .map<double>((item) => (item['price'] as num).toDouble() * (item['quantity'] as num).toInt())
    .reduce((a, b) => a + b) + (order['delivery'] as num).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho com status
            _buildOrderHeader(order, context),
            const SizedBox(height: 24),
            
            // Lista de produtos
            _buildProductsList(order, context),
            const SizedBox(height: 16),
            
            // Resumo do pedido
            _buildOrderSummary(order, total),
            const SizedBox(height: 24),
            
            // Endereço de entrega
            _buildDeliveryAddress(order, context),
            const SizedBox(height: 24),
            
            // Botões de ação
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHeader(Map<String, dynamic> order, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pedido ${order['id']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Chip(
                  label: Text(
                    order['status'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _getStatusColor(order['status']),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 8),
                Text(
                  DateFormat('dd/MM/yyyy - HH:mm').format(order['date']),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList(Map<String, dynamic> order, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produtos',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        ...(order['items'] as List).map((item) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Image.asset(
                item['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item['name']),
              subtitle: Text('Qtd: ${item['quantity']}'),
              trailing: Text(
                'R\$${item['price'].toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildOrderSummary(Map<String, dynamic> order, double total) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSummaryRow('Subtotal', 
                'R\$${((order['items'] as List).map<double>((item) => item['price'] * item['quantity']).reduce((a, b) => a + b).toStringAsFixed(2))}'),
            _buildSummaryRow('Frete', 'R\$${order['delivery'].toStringAsFixed(2)}'),
            const Divider(),
            _buildSummaryRow(
              'Total',
              'R\$${total.toStringAsFixed(2)}',
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                : null,
          ),
          Text(
            value,
            style: isTotal
                ? const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryAddress(Map<String, dynamic> order, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Endereço de entrega',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    order['address'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // Ação para comprar novamente
            },
            child: const Text('Comprar Novamente'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Ação para avaliar pedido
            },
            child: const Text('Avaliar Pedido'),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'entregue':
        return Colors.green;
      case 'em transporte':
        return Colors.orange;
      case 'processando':
        return Colors.blue;
      case 'cancelado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}