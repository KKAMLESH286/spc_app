import 'package:flutter/material.dart';
import 'package:icm_app/domain/models/Product.dart';
import 'package:icm_app/res/constants.dart';
import '../../res/colors.dart';
import '../../res/images.dart';
import '../details/details_screen.dart';

class ProductCard extends StatelessWidget {
  String? productName;
  String? productImage;
  String? productPrice;

  ProductCard({this.productName, this.productImage, this.productPrice});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: demoProducts[0]),
        );
      },
      child: Container(
          // margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
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
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
                child: Image(
                  fit: BoxFit.fitHeight,
                  height: 80,
                  image: AssetImage(
                    AppImages.defaultcat,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          productName!,
                          style: kTextFieldTextStyle,
                        ),
                        Text(
                          productPrice!,
                          style: kTextFieldTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.black,
                            thickness: 0.2,
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: kPrimaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              primary: theme.primaryColor,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 80),
                              child: Text(
                                'Add',
                                style: kTextFieldTextStyle.copyWith(
                                    color: kPrimaryColor),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
          // Column(
          //   children: [
          //     const SizedBox(height: 12),
          //     // if (isNotBlank(store!.banner))
          //     ClipRRect(
          //         borderRadius: BorderRadius.circular(6.0),
          //         child: Image(
          //           width: 320,
          //           fit: BoxFit.fitWidth,
          //           height: 120,
          //           image: AssetImage(
          //             AppImages.defaultcat,
          //           ),
          //         )
          //         // ImageTools.image(
          //         //   url: store!.banner,
          //         //   size: kSize.medium,
          //         //   isResize: false,
          //         //   fit: BoxFit.fitWidth,
          //         //   height: 120,
          //         // ),
          //         ),
          //     Container(
          //       padding: const EdgeInsets.all(15),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(3.0),
          //         color: Colors.white,
          //       ),
          //       child: Row(
          //         children: <Widget>[
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 Text(
          //                   productName!,
          //                   style: kTextFieldLabelTextStyle,
          //                 ),
          //                 const SizedBox(height: 3),
          //                 Text(productPrice!,
          //                     maxLines: 1, style: kTextFieldLabelTextStyle),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(width: 10),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
