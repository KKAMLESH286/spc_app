import 'package:flutter/material.dart';
import 'package:icm_app/presentation/bottombar/bottombar.dart';
import 'package:icm_app/res/images.dart';

import '../../size_config.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        leading: Image(image: AssetImage(AppImages.logo)),
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BottomNavBar()));
                      },
                      child: Container(
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
                                  "Grocery",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                              AssetImage(AppImages.list),
                              color: Colors.black,
                            ),
                            Text(
                              "Medicines",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
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
                                AssetImage(AppImages.payclick),
                                color: Colors.black,
                              ),
                              Text(
                                "Resale",
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
                              AssetImage(AppImages.search),
                              color: Colors.black,
                            ),
                            Text(
                              "Services",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
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
                                AssetImage(AppImages.updates),
                                color: Colors.black,
                              ),
                              Text(
                                "Cricket",
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
                            AssetImage(AppImages.category),
                            color: Colors.black,
                          ),
                          Text(
                            "More",
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
          ],
        ),
      ),
    );
  }
}
