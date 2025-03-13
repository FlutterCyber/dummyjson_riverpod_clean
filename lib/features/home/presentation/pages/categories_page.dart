import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/categories/categories_state.dart';
import 'package:dummyjson_riverpod_clean/features/home/presentation/riverpod/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  void getCategories() {
    ref.read(categoriesProvider.notifier).getCategories();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            if (categoryState is CategoriesLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (categoryState is CategoriesLoaded)
              Expanded(
                child: ListView.builder(
                    itemCount: categoryState.categories.length,
                    itemBuilder: (context, index) {
                      final category = categoryState.categories[index];
                      return ListTile(
                        leading: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
              ),
            if (categoryState is CategoriesError) Text(categoryState.message)
          ],
        ),
      ),
    );
  }
}
