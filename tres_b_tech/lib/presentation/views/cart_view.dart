import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos genéricos para representar
    final cartItems = [
      {
        'name': 'Producto 1',
        'quantity': 2,
        'price': 10.0,
      },
      {
        'name': 'Producto 2',
        'quantity': 1,
        'price': 20.0,
      },
      {
        'name': 'Producto 3',
        'quantity': 3,
        'price': 15.0,
      },
    ];

    double totalCartValue = cartItems.fold(0, (previousValue, item) {
      final int quantity = item['quantity'] as int;
      final double price = item['price'] as double;
      return previousValue + (quantity * price);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
        actions: [
          Text('${cartItems.length} productos'),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cartItems[index]['name'].toString()),
              subtitle: Text(
                  '\$${(cartItems[index]['quantity'] as int) * (cartItems[index]['price'] as double)}'),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        // Disminuir cantidad
                      },
                    ),
                    Text('${cartItems[index]['quantity']}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Aumentar cantidad
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      persistentFooterButtons: [
        Row(
          children: [
            Text(
              'Total\n\$${totalCartValue.toStringAsFixed(2)}',
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Proceder al checkout
                },
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
