import 'package:flutter/material.dart';
import 'package:sampleproject/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog2;

  const HomeDetailPage({Key? key, required this.catalog2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: ListView(children: [
                        Column(
                          children: [
                            catalog2.name.text.xl4
                                .color(context.accentColor)
                                .bold
                                .make(),
                            catalog2.desc.text
                                .color(context.theme.secondaryHeaderColor)
                                .xl
                                .make(),
                            10.heightBox,
                            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi sint quod molestias? Atque facere error adipisci ex nam cum dignissimos nemo saepe, nihil sequi eligendi itaque assumenda? Sapiente, reiciendis. Saepe."
                                .text
                                .xl
                                .color(context.theme.secondaryHeaderColor)
                                .make()
                                .p32(),
                          ],
                        ).py64(),
                      ]),
                    )))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog2.price}".text.bold.xl4.red700.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add To Cart".text.make())
                .wh(130, 50)
          ],
        ).p16(),
      ),
    );
  }
}
