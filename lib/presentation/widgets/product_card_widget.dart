import 'package:flutter/material.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const ProductCardWidget({
    super.key, 
    required this.title, 
    required this.description, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.only(bottom: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      decoration: BoxDecoration(
        color: ArcetecColors.secondaryColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 90.0,
            height: 100.0,
            margin: const EdgeInsets.only(right: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: ArcetecColors.primaryColor
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Nombre del producto', style: ArcetecTypography.title(
                color: ArcetecColors.primaryColor,
                fontWeight: FontWeight.w800
              )),
              Text('Descripción del producto', style: ArcetecTypography.subTitle(
                color: ArcetecColors.primaryColor.withOpacity(0.5)
              )),
              const SizedBox(height: 10.0),
              Text('\$10.000', style: ArcetecTypography.title(
                color: ArcetecColors.tertiaryColor,
                fontWeight: FontWeight.w800
              ))
            ],
          )
        ],
      ),
    );
  }
}