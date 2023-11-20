import 'package:flutter/material.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';
import 'package:test_arcetec/presentation/routes/routes.dart';
import 'package:test_arcetec/presentation/widgets/outline_button_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230.0,
      decoration: const BoxDecoration(
        color: ArcetecColors.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)
        )
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('20 Productos', style: ArcetecTypography.heading(
              fontWeight: FontWeight.bold,
              color: ArcetecColors.primaryColor
            )),
            Text('Productos agregados', style: ArcetecTypography.subTitle(
              color: ArcetecColors.primaryColor.withOpacity(0.5)
            )),
            const SizedBox(height: 24.0),
            OutlineButtonWidget(
              onPressed: () => Navigator.pushNamed(context, MainRoutes.newProduct),
              text: 'Agregar producto',
            )
          ],
        ),
      ),
    );
  }
}