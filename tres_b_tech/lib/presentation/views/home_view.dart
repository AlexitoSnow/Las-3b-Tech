import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tres_b_tech/config/router/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.push(AppRoutes.cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              value: 'Todos',
              items: List.generate(
                5,
                (index) {
                  final value = [
                    'Todos',
                    'Cargadores',
                    'Cables',
                    'Audífonos',
                    'Soportes'
                  ][index];
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text('Filtrando por: $value'),
                  );
                },
              ),
              onChanged: (String? value) {},
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                                child: Image.network(
                                  'https://picsum.photos/250?image=$index',
                                  height: 150,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text('Product Name $index'),
                              Text('Product Price $index'),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.add_shopping_cart,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
