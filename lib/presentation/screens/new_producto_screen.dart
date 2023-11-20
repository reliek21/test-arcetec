import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';
import 'package:test_arcetec/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:test_arcetec/presentation/widgets/load_image_widget.dart';
import 'package:test_arcetec/presentation/widgets/outline_button_widget.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
	final TextEditingController nameController = TextEditingController();
	final TextEditingController descriptionController = TextEditingController();
	final TextEditingController priceController = TextEditingController();

	@override
	void dispose() {
		nameController.dispose();
		descriptionController.dispose();
		priceController.dispose();
		super.dispose();
	}

  @override
  Widget build(BuildContext context) {
    const SizedBox spaceSizeBox = SizedBox(height: 10.0);


    return Scaffold(
      backgroundColor: ArcetecColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: ArcetecColors.secondaryColor,
        centerTitle: true,
        title: Text('Registrar nuevo producto', style: ArcetecTypography.title(
          color: ArcetecColors.primaryColor,
          fontWeight: FontWeight.w800
        )),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: true),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              children: <Widget>[
                const LoadImageWidget(),
                const SizedBox(height: 30.0),
                CustomTextFormFieldWidget(
                  hintText: 'Nombre del producto',
                  controller: nameController,
                ),
                spaceSizeBox,
                CustomTextFormFieldWidget(
                  hintText: 'Descripción del producto',
                  controller: descriptionController,
                ),
                spaceSizeBox,
                CustomTextFormFieldWidget(
                  hintText: 'Precio del producto',
                  controller: priceController,
                ),
                const SizedBox(height: 30.0),
                OutlineButtonWidget(
                  fillButton: true,
                  text: 'Guardar producto',
                  onPressed: () async {
										// Todo: Improve this
										try {
											final String name = nameController.text;
											final String description = descriptionController.text;
											final String price = priceController.text;

											if(name.isNotEmpty || description.isNotEmpty || price.isNotEmpty) {
												await Supabase.instance.client.from('products').insert(<String, Object>{
													'name': nameController.text,
													'description': descriptionController.text,
													'price': double.parse(priceController.text),
													'image': ''
												});

												nameController.clear();
												descriptionController.clear();
												priceController.clear();
											} else {
												if (kDebugMode) {
												  print('Please enter all inputs');
												}
											}
										} catch (e) {
											if (kDebugMode) {
												print('Error to save the data $e');
											}
										}
									}
                )
              ]
            ),
          )
        )
      )
    );
  }
}
