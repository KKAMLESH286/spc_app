import 'package:flutter/material.dart';
import 'package:icm_app/res/constants.dart';
import 'package:icm_app/res/images.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var tapped;

  @override
  Widget build(BuildContext context) {
    return 
      
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Expanded(
          child: Container(height: MediaQuery.of(context).size.height,child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemBuilder: (context, index) {
                      return categoryCardTile(i: index);
                    },itemCount: 8,),),
        ),
      ],
    );
  }
  Widget categoryCardTile({int? i}) {

    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      trailing: Icon(Icons.keyboard_arrow_down),
      leading: Image(
        height: 100,
                      image: AssetImage(AppImages.gamingconsole, ),
                    ),
      title: Text(
        "Grocery",
        style: kTextFieldTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal),),      
      subtitle: Text("Explore in depth sub categories inside each category",
              style: kSubTitleStyle),      children: <Widget>[
        SizedBox(height: 20),
        Container(
          height: MediaQuery.of(context).size.height*0.4,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 0.1,
              color: Colors.black,
            ),
            itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "Biscuits",
                          style: kTextFieldTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.normal),),
                      
                        leading: Image(
                          width: 80,
                                      image: AssetImage(AppImages.defaultcat, ),
                                    ),
                      );
                    },itemCount: 4,),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
