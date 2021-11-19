import 'package:flutter/material.dart';
import 'package:sampleproject/models/catalog.dart';
import 'package:sampleproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog2;

  const HomeDetailPage({Key? key, required this.catalog2})
      : assert(catalog2 != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog2.price}".text.bold.xl4.red700.make(),
                  ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyTheme.darkBluishColor),
                              shape: MaterialStateProperty.all(StadiumBorder())),
                          child: "Buy".text.make()).wh(100, 50)
                      
                ],
              ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        
        child: Column(
        
          children: [
            Hero(
                    tag: (catalog2.id.toString()),
                    child: Image.network(catalog2.image))
                .h40(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog2.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog2.desc.text.xl.make(),
                          10.heightBox,
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
