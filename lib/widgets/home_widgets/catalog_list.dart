import 'package:flutter/material.dart';
import 'package:sampleproject/models/cart.dart';
import 'package:sampleproject/models/catalog.dart';
import 'package:sampleproject/pages/home_details_page.dart';
import 'package:sampleproject/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        //niche ni banne line same j work karse
        final catalog = CatalogModel.getByPosition(index);
        // final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog2: catalog))),
            child: CatalogItem(catalog1: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog1;

  const CatalogItem({Key? key, required this.catalog1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: catalog1.id.toString(),
            child: CatalogImage(image: catalog1.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog1.name.text.lg.color(context.accentColor).bold.make(),
            catalog1.desc.text.color(context.theme.secondaryHeaderColor).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog1.price}".text.bold.xl.make(),
                _AddToCart(catalog1, catalog1).pOnly(right: 8.0)
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
 final Item catalog;

  _AddToCart(Item catalog1, this.catalog);
  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle(); //false to true and true to false
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isAdded ? Icon(Icons.done) : "Add To Cart".text.make());
  }
}
