import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:icm_app/Utils/constants.dart';
import 'package:icm_app/application/providers/global_provider.dart';
import 'package:icm_app/res/constants.dart';

import '../../res/colors.dart';

class SubCatScreen extends StatefulWidget {
  final int? catId;
  final int? shopId;
  SubCatScreen({this.catId, this.shopId});
  @override
  _ShopProductsState createState() => _ShopProductsState();
}

class _ShopProductsState extends State<SubCatScreen> {
  late GlobalProvider globalProvider;
  int active = 0;

  final additemBar = SnackBar(
    content: Text('This Item has been added'),
    duration: Duration(seconds: 1),
    action: SnackBarAction(
      label: '',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  final GlobalKey<ScaffoldState> _shopProductScaffoldKey =
      new GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    globalProvider = GlobalProvider.of(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {});
    getSubCategories();
    getShopBanners();
  }

  void getSubCategories() async {
    var _subCat =
        await globalProvider.fetchSubCategories(widget.catId.toString());
    await globalProvider.fetchShopProducts(widget.shopId.toString(),
        widget.catId.toString(), _subCat[0].id.toString());
  }

  void getShopBanners() async {
    await globalProvider.fetchShopBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _shopProductScaffoldKey,
        appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    onTap: () {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (context) => Location()));
                    },
                    child: Text(
                      "",
                      //       Provider.of<Area>(context, listen: false).city.toString(),
                      style: TextStyle(fontSize: 16.0),
                    ))),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Cart()));
                      }),
                ),

                // Provider.of<Area>(context, listen: true)
                //             .currentCartItems
                //             .length !=
                //         0
                false
                    ? new Positioned(
                        right: 10,
                        top: 5,
                        child: new Container(
                          padding: EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          child: Text(
                            "",
                            //     Provider.of<Area>(context, listen: true)
                            //         .currentCartItems
                            //         .length
                            //         .toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : new Container(),
              ],
            ),
          ],
        ),
        // drawer: Menu(),
        body: Consumer<GlobalProvider>(builder: (context, subCat, child) {
          return Builder(builder: (context) {
            return Column(children: <Widget>[
              (subCat != null)
                  ? (subCat.shopBannerList != null)
                      ? Container(
                          child: Stack(children: [
                          CarouselSlider(
                            items: subCat.shopBannerList
                                .map<Widget>((item) => Container(
                                      child: Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            child: Stack(
                                              children: <Widget>[
                                                Image.network(
                                                  BASE_URL +
                                                      'attachments/sliders/' +
                                                      item.image!,
                                                  fit: BoxFit.cover,
                                                  width: 1000.0,
                                                  height: 150,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                                height: 150.0,
                                autoPlay: true,
                                enlargeCenterPage: false,
                                onPageChanged: (sliderindex, reason) {
                                  // setState(() {
                                  //   _current = sliderindex;
                                  // });
                                }),
                          ),
                        ]))
                      : SizedBox()
                  : SizedBox(),
              (subCat.subCategoryList != null)
                  ? SizedBox(
                      // Horizontal ListView
                      height: 50,
                      child: ListView.builder(
                        itemCount: subCat.subCategoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async {
                                subCat.isLoading = true;
                                //subCa isLoadingRun = true;
                                active = index;
                                //       getShopProducts(shopObj['shopid'], widget.catID,
                                //           subCategories[index]['id']);
                                //       setState(() {});
                                await globalProvider.fetchShopProducts(
                                    widget.shopId.toString(),
                                    widget.catId.toString(),
                                    subCat.subCategoryList[index].id
                                        .toString());
                              },
                              child: Text(
                                subCat.subCategoryList[index].name.toString(),
                                style: (index == active)
                                    ? TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                        color: Color(0xFF1f34812))
                                    : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Text(''),
              (subCat.isLoading == false)
                  ? (subCat.shopProductsList != null &&
                          subCat.shopProductsList.length > 0)
                      ? Expanded(
                          child: Container(
                          padding: EdgeInsets.only(top: 20.0),
                          decoration: BoxDecoration(color: Colors.grey[100]),
                          child: new ListView.builder(
                            itemCount: subCat.shopProductsList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 1.0, right: 1.0, bottom: 15.0),
                                child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          height: 100,
                                          child: Center(
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                repeat: ImageRepeat.noRepeat,
                                                image: NetworkImage(BASE_URL +
                                                    "attachments/products/" +
                                                    subCat
                                                        .shopProductsList[index]
                                                        .itemId
                                                        .toString() +
                                                    "/" +
                                                    subCat
                                                        .shopProductsList[index]
                                                        .images!),
                                                fit: BoxFit.fitHeight,
                                              )),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Text(
                                                  currency +
                                                      subCat
                                                          .shopProductsList[
                                                              index]
                                                          .price
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0),
                                                ),
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 20.0,
                                                    ),
                                                    child: Container(
                                                        child: Text(
                                                      subCat
                                                          .shopProductsList[
                                                              index]
                                                          .name!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1,
                                                    )),
                                                  ),
                                                ]),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                        child: Builder(
                                                      builder: (context) =>
                                                          RaisedButton(
                                                        onPressed: () {
                                                          //   addItInCart(
                                                          //       context,
                                                          //       _shopProductScaffoldKey,
                                                          //       shopProductsList[
                                                          //           index]);
                                                        },
                                                        textColor: Colors.white,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: Text(
                                                          'Add',
                                                          style: TextStyle(
                                                              fontSize: 18.0),
                                                        ),
                                                        color: kPrimaryColor,
                                                      ),
                                                    ))
                                                  ]),
                                            ),
                                          ],
                                        )),
                                      ],
                                    )),
                              );
                            },
                          ),
                        ))
                      : Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                  'No Item found in this category, Try with another')),
                        )
                  : Expanded(
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                kPrimaryColor),
                          )
                        ],
                      )),
                    ),
            ]);
          });
        }));
  }
}
