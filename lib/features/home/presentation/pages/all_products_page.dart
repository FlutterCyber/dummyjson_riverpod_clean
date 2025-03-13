import 'package:dummyjson_riverpod_clean/core/route/route_names.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/all_products/all_products_state.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductsPage extends ConsumerStatefulWidget {
  const AllProductsPage({super.key});

  @override
  ConsumerState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends ConsumerState<AllProductsPage> {
  void getAllProducts() {
    ref.read(allProductsProvider.notifier).getAllProducts();
  }

  void searchAllProducts({required String word}) {
    ref.read(allProductsProvider.notifier).searchAllProducts(word: word);
  }

  void sortAllProducts({required String sortName, required String ascDesc}) {
    ref.read(allProductsProvider.notifier).sortAllProducts(
          sortName: sortName,
          ascDesc: ascDesc,
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final allProductsState = ref.watch(allProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All products"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.categoriesPage);
              },
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Search"),
              onChanged: (String value) {
                searchAllProducts(word: value);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      sortAllProducts(sortName: "price", ascDesc: 'asc');
                    },
                    child: const Text("Price")),
                ElevatedButton(
                    onPressed: () {
                      sortAllProducts(sortName: "title", ascDesc: 'asc');
                    },
                    child: const Text("Title")),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            if (allProductsState is AllProductsLoaded)
              Expanded(
                child: ListView.builder(
                  itemCount: allProductsState.allProducts.products.length,
                  itemBuilder: (context, index) {
                    final product =
                        allProductsState.allProducts.products[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Image.network(product.thumbnail),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(product.description),
                    );
                  },
                ),
              ),
            if (allProductsState is AllProductsLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (allProductsState is AllProductsError)
              Text(allProductsState.message),
          ],
        ),
      ),
    );
  }
}
