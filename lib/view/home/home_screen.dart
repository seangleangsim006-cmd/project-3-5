import 'package:flutter/material.dart';
import 'package:project_3_5/provider/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
    Future.microtask(()=> context.read<ProductProvider>().fetchProduct());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    return Scaffold(
     body: (provider.isLoading)
           ? Center(child: CircularProgressIndicator(),)
           :(provider.isError!=null)? Center(child: Text(provider.isError.toString()),)
           : ListView.builder(
            itemCount: provider.product.length,
            itemBuilder: (context, index) {
              final product = provider.product[index];
              return Text(product.title!);
            },
          )
    );
  }
}