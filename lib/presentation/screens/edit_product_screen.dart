import 'package:flutter/material.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';
import 'package:test_arcetec/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:test_arcetec/presentation/widgets/load_image_widget.dart';
import 'package:test_arcetec/presentation/widgets/outline_button_widget.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const SizedBox spaceSizeBox = SizedBox(height: 10.0);

    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      backgroundColor: ArcetecColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: ArcetecColors.secondaryColor,
        centerTitle: true,
        title: Text('Registrar nuevo producto',
            style: ArcetecTypography.title(
                color: ArcetecColors.primaryColor,
                fontWeight: FontWeight.w800)),
      ),
      body: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: true),
          child: SingleChildScrollView(
              child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(children: <Widget>[
              const LoadImageWidget(),
              const SizedBox(height: 30.0),
              CustomTextFormFieldWidget(
                hintText: 'Nombre del producto',
                controller: titleController,
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
                text: 'Editar producto',
                onPressed: () {}
              )
            ]),
          )
        )
      )
    );
  }
}