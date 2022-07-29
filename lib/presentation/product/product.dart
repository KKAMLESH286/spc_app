import 'package:flutter/material.dart';
import 'package:icm_app/res/constants.dart';
import 'package:icm_app/presentation/product/product_card.dart';

import '../../res/colors.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search from 10,000+ products",
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductCard(
                productName: "Lemon 1KG",
                productPrice: "₹ 100",
              )),
        ),
      ),
    );
  }
}
