import 'package:flutter/material.dart';
import 'package:sampleproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(MyTheme.creamColor)
        .p4
        .rounded
        .make()
        .p16()
        .w40(context);
  }
}