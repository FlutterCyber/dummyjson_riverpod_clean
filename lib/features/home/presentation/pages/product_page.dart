import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/product_provider.dart';
import '../riverpod/product_state.dart';
import '../widgets/product_widget.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  final TextEditingController _idController = TextEditingController();

  void _fetchProduct() {
    final id = int.tryParse(_idController.text.trim());
    if (id != null && id > 0) {
      ref.read(productProvider.notifier).fetchProduct(id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid product ID")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Fetch Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Product ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetchProduct,
              child: const Text("Get Product"),
            ),
            const SizedBox(height: 20),
            if (productState is ProductLoading)
              const CircularProgressIndicator(),
            if (productState is ProductError)
              Text(productState.message,
                  style: const TextStyle(color: Colors.red)),
            if (productState is ProductLoaded)
              ProductWidget(product: productState.product),
          ],
        ),
      ),
    );
  }
}
