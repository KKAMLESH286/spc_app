import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../res/colors.dart';
import '../../res/images.dart';
import '../../res/style.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProductScreen> {
  final searchController = TextEditingController();
  final List<Widget> cardImages = [virtualCard(), virtualCard(), virtualCard()];
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Product Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20),
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                            color: kLightWightColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                          child: Center(
                            child: TextField(
                              cursorColor: kGreyColor,
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: const InkWell(
                                    //     onTap: _addIngredient,
                                    child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: ImageIcon(
                                    AssetImage(AppImages.searchIcon),
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: kLightWightColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Column(
                            children: <Widget>[
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 120.0,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  pauseAutoPlayOnTouch: true,
                                  aspectRatio: 2.0,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                items: cardImages.map((card) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.40,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        child: card,
                                      ),
                                    );
                                  });
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: map<Widget>(cardImages, (index, url) {
                                  return Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndex == index
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product By Categories',
                            style: kBodyLarge,
                          ),
                          Text(
                            'View More',
                            style: kBodySmall,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.9),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8.0),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ProductCardLarge(),
                            );
                          }),
                    ),
                    SizedBox(height: 40),
                    Column(
                      children: <Widget>[
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 120.0,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            pauseAutoPlayOnTouch: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          items: cardImages.map((card) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  child: card,
                                ),
                              );
                            });
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(cardImages, (index, url) {
                            return Container(
                              width: 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardSmall extends StatelessWidget {
  const ProductCardSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 108,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFFDFA7AA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'RASHAN',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Image(
              image: AssetImage(AppImages.raashan),
              height: 70,
              width: 70,
            )
          ],
        ));
  }
}

class ProductCardLarge extends StatelessWidget {
  const ProductCardLarge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 108,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFFDFA7AA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'RASHAN',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Image(
              image: AssetImage(AppImages.raashan),
              height: 150,
              width: 150,
            )
          ],
        ));
  }
}

class virtualCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              AppImages.tomato,
            )),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff5f2c82), Color(0xff49a09d)]),
      ),
    );
  }
}
