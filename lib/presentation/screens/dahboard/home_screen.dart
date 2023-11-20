import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/domain/entities/product_entity.dart';
import 'package:test_arcetec/presentation/screens/dahboard/edit_product_screen.dart';
import 'package:test_arcetec/presentation/widgets/dashboard_widget.dart';
import 'package:test_arcetec/presentation/widgets/product_card_widget.dart';
import 'package:test_arcetec/utils/currency_format.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	final PostgrestFilterBuilder<List<Map<String, dynamic>>> _future = Supabase.instance.client.from('products').select<List<Map<String, dynamic>>>();

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
          			height: MediaQuery.of(context).size.height - kToolbarHeight,
          			margin: const EdgeInsets.symmetric(horizontal: 16.0),
          			child: FutureBuilder<List<Map<String, dynamic>>>(
          				future: _future,
          				builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          					final List<Map<String, dynamic>>? products = snapshot.data;

          					if (snapshot.connectionState == ConnectionState.waiting) {
          						return const Center(child: CircularProgressIndicator());
          					}

          					return ListView.builder(
          						physics: const BouncingScrollPhysics(),
          						itemCount: products?.length,
          						itemBuilder: (BuildContext context, int index) {
          							final Map<String, dynamic> product = products![index];
          							return GestureDetector(
													onTap: () {
														Navigator.push(
															context,
															MaterialPageRoute<ProductEntity>(builder: (BuildContext context) => EditProductScreen(product: product))
														);
													},
													child: ProductCardWidget(
														name: product['name'],
														description: product['description'],
														price: formatStringNumber(product['price'].toString()),
														image: product['image']
													),
												);
          						},
          					);
          				}
          			),
          		)
          	]
          ),
        )
      )
    );
  }
}
