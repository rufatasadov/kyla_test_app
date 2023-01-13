import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyle_test_app/config/constants.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {

  final _horizontalPadding = 16.0;
  final _verticalPadding = 2.0;

  final strMyBag = 'My Bag';
  final strTotal = 'TOTAL';
  final strNext = 'NEXT';
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:_horizontalPadding, vertical: _verticalPadding ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(strMyBag, style: styleMyBagTitle,),
                Text(strTotal,  style: styleMyBagTotalItem,),
              ],
            ),
            const Divider(
              thickness: 2.0,
            ),

            //ListView.builder(itemBuilder: itemBuilder)

          ],
        ),
      ),
    );
  }
}
