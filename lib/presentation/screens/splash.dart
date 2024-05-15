import 'package:bloc_ex/blocs/cubit/cubit/product_cubit.dart';
import 'package:bloc_ex/constants/colors.dart';
import 'package:bloc_ex/data/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late List<Product>? allProducts;
  @override
  void initState() {
    allProducts = BlocProvider.of<ProductCubit>(context).getAllProduct();
    super.initState();
  }

  Widget blocBuilder() {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if(state is ProductLoaded) {
        allProducts = state.products;
        return getWidgetsOfProductList();
      } 
      return getIndecator();
    });
  }

  Widget getWidgetsOfProductList() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey,
        child: Column(
          children: [
            productList()
          ],
        ),
      ),
    );
  }

  Widget productList () {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1
      ), 
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allProducts?.length,
      itemBuilder: (ctx, indx) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          child: InkWell(
            onTap: () {
              print('go to single screan');
            },
            child: GridTile(
              child: Container(
                color: MyColors.grey,
                child: allProducts![indx].image!.isNotEmpty ? 
                Image.network(allProducts![indx].image!): const Placeholder(),
              ),
              header: Text(allProducts![indx].title!),
            ),
          ),
        );
      });
  }

  Widget getIndecator () {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: blocBuilder(),
    ));
  }
}
