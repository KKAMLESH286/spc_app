import 'package:icm_app/Utils/constants.dart';
import 'package:icm_app/application/providers/global_provider.dart';
import 'package:icm_app/presentation/vendor/vendor.dart';
import 'package:icm_app/res/constants.dart';
import 'package:icm_app/res/images.dart';
import 'package:flutter/material.dart';
import 'package:icm_app/Utils/my_extensions.dart';
import 'package:provider/provider.dart';

import '../../res/colors.dart';
import '../product/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GlobalProvider globalProvider;

  @override
  void initState() {
    super.initState();
    globalProvider = GlobalProvider.of(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await globalProvider.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // height: MediaQuery.of(context).size.height * 0.30,
                width: double.infinity,
                child: Image.asset(
                  AppImages.salebanner,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Shop by Category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ).addOnlyPadding(left: 10),
                Spacer(),
                TextButton(
                    child: Text("View all",
                        style: kTextFieldLabelTextStyle.copyWith(
                            fontWeight: FontWeight.w400)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductItem()),
                      );
                    })
              ],
            ),
            // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)(gridDelegate: gridDelegate)
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Consumer<GlobalProvider>(builder: (context, model, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.categoryList.length,
                  itemBuilder: (context, index) {
                    return catItem(
                        assetName: model.categoryList[index].img,
                        productCat: model.categoryList[index].name,
                        context: context);
                  },
                );
              }),
            ).addOnlyPadding(left: 10, right: 10, top: 10),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rasan Shops",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ).addOnlyPadding(left: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.black,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: ((context, index) => VendorCard(
                        vendorId: index,
                        vendorName: "Raman Rasan Waala",
                        vendorImage: AppImages.salebanner)
                    .addOnlyPadding(top: 10)),
              ),
            ).addPadding(10),
            SizedBox(
              height: 10,
            ),
            Text(
              "Popular Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ).addOnlyPadding(left: 10),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Card(
                    shape: ShapeBorder.lerp(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        0.5),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageIcon(
                            AssetImage(AppImages.cart),
                            color: Colors.black,
                          ),
                          Text(
                            "Pulses",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Card(
                    shape: ShapeBorder.lerp(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        0.5),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageIcon(
                            AssetImage(AppImages.cart),
                            color: Colors.black,
                          ),
                          Text(
                            "Rice",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

Widget eventItem(
    {String? assetName,
    String? productCat,
    String? offer,
    BuildContext? context}) {
  return Card(
      child: Container(
    width: MediaQuery.of(context!).size.width * 0.30,
    // height: 20,
    // color: Color(0xff202020),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          child: Center(
            child: Image(
              image: AssetImage(assetName!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Text(
            productCat!,
            style: TextStyle(color: Color(0xff848484), fontSize: 12),
          ).addOnlyPadding(left: 10, right: 10, top: 5),
        ),
        Center(
          child: Text(offer ?? "",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))
              .addOnlyPadding(left: 10, right: 10),
        ).addPadding(5),
      ],
    ),
  )).addPadding(0);
}

Widget catItem(
    {String? assetName,
    String? productCat,
    String? offer,
    BuildContext? context}) {
  String fullImageUrl = BASE_URL + "assets/categories/" + assetName!;

  return Container(
    child: Column(
      children: [
        Card(
            child: Container(
          width: MediaQuery.of(context!).size.width * 0.30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    child: Image(
                      // color: Colors.blue[200],
                      image: NetworkImage(fullImageUrl),
                      // fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
        Center(
          child: Text(
            productCat!,
            style: TextStyle(
                color: Color(0xff848484),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ).addOnlyPadding(left: 10, right: 10, top: 5),
        ),
      ],
    ),
  );
}

class VendorCard extends StatelessWidget {
  int vendorId;
  String vendorName;
  String vendorImage;

  VendorCard({
    required this.vendorId,
    required this.vendorName,
    required this.vendorImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendorScreen(
                  vendorId: this.vendorId,
                  vendorName: this.vendorName,
                  vendorImage: this.vendorImage),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white,
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6,
              )
            ]),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // if (isNotBlank(store!.banner))
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image(
                  width: 320,
                  fit: BoxFit.fitWidth,
                  height: 120,
                  image: AssetImage(
                    vendorImage,
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          vendorName,
                          style: kTextFieldTextStyle.copyWith(
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text("5.0 KM",
                      style: kTextFieldLabelTextStyle.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
