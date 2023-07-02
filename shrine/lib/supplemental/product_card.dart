import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/model/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, this.imageAspectRatio = 33 / 49, required this.product}) : assert(imageAspectRatio > 0);

  final double imageAspectRatio;
  final Product product;

  static const kTextBoxHeight = 65.0;
  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        decimalDigits: 0, locale: Localizations.localeOf(context).toString());
    ThemeData theme = Theme.of(context);

    final imageWidget = Image.asset(
      product.assetName,
      package: product.assetPackage,
      fit:BoxFit.cover
    );
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio:imageAspectRatio
          ),
          SizedBox(
            height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
            width: 121.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Text(
                    product.name,
                    style: theme.textTheme.labelLarge,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.0,),
                  Text(
                    style: theme.textTheme.bodySmall,
                    formatter.format(product.price)
                  ),
              ]
            ),
          ),
        ],
    );
  }
}
