import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';

class LoadImageWidget extends StatelessWidget {
  const LoadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224.0,
      height: 195.0,
      decoration: BoxDecoration(
        color: ArcetecColors.tertiaryColor.withOpacity(0.20),
        border: Border.all(
          color: ArcetecColors.tertiaryColor,
          width: 2.0
        ),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            BootstrapIcons.camera,
            size: 56.0,
            color: ArcetecColors.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text('Agregar una imagen', style: ArcetecTypography.subTitle(
              color: ArcetecColors.primaryColor,
              fontWeight: FontWeight.w800
            )),
          )
        ],
      ),
    );
  }
}