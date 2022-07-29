// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:icm_app/Utils/constants.dart';
import 'package:icm_app/application/providers/global_provider.dart';
import 'package:icm_app/presentation/vendor/vendor.dart';
import 'package:icm_app/res/constants.dart';
import 'package:provider/provider.dart';

import '../../res/colors.dart';

class VendorHomeScreen extends StatefulWidget {
  @override
  _VendorHomeScreenState createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  late GlobalProvider globalProvider;

  @override
  void initState() {
    super.initState();
    globalProvider = GlobalProvider.of(context, listen: false);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await globalProvider.fetchCategories();
      await globalProvider.fetchVendors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0),
        child: Consumer<GlobalProvider>(builder: (context, model, child) {
          return ListView.builder(
              itemCount: model.vendorList.length,
              itemBuilder: (context, index) {
                String image = model.vendorList[index].img!;
                String fullImageUrl = BASE_URL + "attachments/shops/" + image;

                return Container(
                  // height: 280,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: VendorCard(
                        vendorId: model.vendorList[index].shopid!,
                        vendorName: model.vendorList[index].shopName!,
                        vendorImage: fullImageUrl),
                  ),
                );
              });
        }));
  }
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
                  image: NetworkImage(
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
                  Text("Visit Store",
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
