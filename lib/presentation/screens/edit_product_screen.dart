import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';
import 'package:test_arcetec/main.dart';
import 'package:test_arcetec/presentation/routes/routes.dart';
import 'package:test_arcetec/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:test_arcetec/presentation/widgets/outline_button_widget.dart';

class EditProductScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const EditProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
	File? image;

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;
	late final String imageUrl;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product['name']);
    descriptionController =
        TextEditingController(text: widget.product['description']);
    priceController =
        TextEditingController(text: widget.product['price'].toString());
		imageUrl = widget.product['image'];
  }

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
        title: Text('Editar producto',
            style: ArcetecTypography.title(
                color: ArcetecColors.primaryColor,
                fontWeight: FontWeight.w800)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            children: <Widget>[
							Container(
								width: 224.0,
                height: 195.0,
                margin: const EdgeInsets.only(right: 18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: ArcetecColors.primaryColor,
                ),
                child: imageUrl.isNotEmpty
									? Image.network(
											'https://qbhccdkxxpffxjlhxhas.supabase.co/storage/v1/object/public/products$imageUrl',
											fit: BoxFit.cover,
												width: 224.0,
                        height: 195.0,
										)
									: const Placeholder(),
              ),
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
								text: 'Eliminar producto',
								color: const Color(0xffe06666),
								onPressed: () {
									showDialog(
										context: context,
										builder: (BuildContext context) {
											return AlertDialog(
												title: const Text('Eliminar producto'),
												content: const Text(
														'¿Está seguro de que desea eliminar este producto?'),
												actions: <Widget>[
													TextButton(
														onPressed: () => Navigator.of(context).pop(),
														child: Text('Cancelar', style: ArcetecTypography.caption(
															color: ArcetecColors.tertiaryColor)
														),
													),
													TextButton(
														onPressed: () async {
															await supabase.from('products').delete().match(<String, dynamic>{ 'id': widget.product['id']});
															Navigator.pushNamed(context, MainRoutes.home);
														},
														child: Text('Eliminar', style: ArcetecTypography.caption(
															color: ArcetecColors.tertiaryColor
														)),
													),
												],
											);
										},
									);
								}
							),
							const SizedBox(height: 10.0,),
              OutlineButtonWidget(
                text: 'Editar producto',
								color: const Color(0xff8aeed5),
                onPressed: () async {
                  try {
                    final String name = nameController.text;
                    final String description = descriptionController.text;
                    final dynamic price = priceController.text;

                    if (name.isNotEmpty || description.isNotEmpty || price.isNotEmpty) {
                      await Supabase.instance.client.from('products').upsert(<Map<String, dynamic>>[
                        <String, dynamic>{
                          'id': widget.product['id'],
                          'name': name,
                          'description': description,
                          'price': double.parse(price),
                          'image': widget.product['image']
                        }
                      ]);
											await Navigator.pushNamed(context, MainRoutes.home);
                    } else {
                      if (kDebugMode) {
                        print('Error with the data is null');
                      }
                    }
                  } catch (e) {
                    if (kDebugMode) {
                      print('Error to save the data $e');
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
