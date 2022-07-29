import 'package:flutter/material.dart';
import 'package:icm_app/Utils/constants.dart';
import 'package:icm_app/application/providers/global_provider.dart';
import 'package:icm_app/presentation/vendor/sub_categories.dart';
import 'package:icm_app/res/colors.dart';
import 'package:icm_app/res/constants.dart';
import 'package:icm_app/res/size_config.dart';
import 'package:provider/provider.dart';

class VendorScreen extends StatefulWidget {
  final int? vendorId;
  final String? vendorName;
  final String? vendorImage;
  const VendorScreen({
    Key? key,
    required this.vendorId,
    required this.vendorName,
    this.vendorImage,
  }) : super(key: key);
  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  late GlobalProvider globalProvider;

  @override
  void initState() {
    globalProvider = GlobalProvider.of(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await globalProvider.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.vendorName!, style: kheadingStyle)),
      body: SingleChildScrollView(
        child: Consumer<GlobalProvider>(builder: (context, cat, child) {
          return Column(
            children: [
              Image(image: NetworkImage(widget.vendorImage!)),
              SizedBox(height: 20),
              (cat.categoryList.length > 0)
                  ? new GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      children: List.generate(cat.categoryList.length, (index) {
                        return Center(
                          child: new GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubCatScreen(
                                          catId: cat.categoryList[index].id,
                                          shopId: widget.vendorId)),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.6, color: kPrimaryColor),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      (cat.categoryList[index].img != '')
                                          ? Container(
                                              height: 70,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                repeat: ImageRepeat.noRepeat,
                                                image: NetworkImage(BASE_URL +
                                                    "assets/categories/" +
                                                    cat.categoryList[index]
                                                        .img!),
                                                fit: BoxFit.fitHeight,
                                              )),
                                            )
                                          : Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.grey,
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text("IMAGE NOT FOUND",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0))),
                                            ),
                                      (cat.categoryList[index].name!.length >
                                              15)
                                          ? Text(
                                              cat.categoryList[index].name!
                                                      .substring(0, 15) +
                                                  ' ...',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1)
                                          : Text(cat.categoryList[index].name!,
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 12.0))
                                    ]),
                              )),
                        );
                      }))
                  : Center(
                      child: Text(
                      "No Category found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    )),
            ],
          );
        }),
      ),
    );
  }
}
