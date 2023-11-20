import 'package:flutter/material.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/presentation/widgets/dashboard_widget.dart';
import 'package:test_arcetec/presentation/widgets/product_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArcetecColors.primaryColor,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: true),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const DashboardWidget(),
        
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
                child: const Column(
                  children: <Widget>[
                    ProductCardWidget(
                      title: 'Titulo del producto',
                      description: 'Descripción del producto',
                      image: ''
                    ),
                    ProductCardWidget(
                      title: 'Titulo del producto',
                      description: 'Descripción del producto',
                      image: ''
                    ),
                    ProductCardWidget(
                      title: 'Titulo del producto',
                      description: 'Descripción del producto',
                      image: ''
                    ),
                    ProductCardWidget(
                      title: 'Titulo del producto',
                      description: 'Descripción del producto',
                      image: ''
                    ),
                    ProductCardWidget(
                      title: 'Titulo del producto',
                      description: 'Descripción del producto',
                      image: ''
                    ),
                    ProductCardWidget(
                      title: 'Titulo del producto',
                      description: 'Descripción del producto',
                      image: ''
                    ),
                  ],
                ),
              )
            ]
          ),
        )
      )
    );
  }
}