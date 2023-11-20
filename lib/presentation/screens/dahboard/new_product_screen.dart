import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_arcetec/common/colors/colors_common.dart';
import 'package:test_arcetec/common/typography/typography_common.dart';
import 'package:test_arcetec/main.dart';
import 'package:test_arcetec/presentation/routes/routes.dart';
import 'package:test_arcetec/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:test_arcetec/presentation/widgets/load_image_widget.dart';
import 'package:test_arcetec/presentation/widgets/outline_button_widget.dart';
import 'package:test_arcetec/presentation/widgets/snackbar_widget.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
	File? image;

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

	 Future<void> _pickAndUploadImage() async {
    try {
      final XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        final File pickedFile = File(pickedImage.path);
        setState(() => image = pickedFile);
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image $e');
      }
    }
  }

	Future<void> _saveProduct() async {
    try {
      final String name = nameController.text;
      final String description = descriptionController.text;
      final String price = priceController.text;

      if (name.isNotEmpty && description.isNotEmpty && price.isNotEmpty) {
				final String imagePath = '/products/${DateTime.now().millisecondsSinceEpoch}.png';

				if (image != null) {
          final Uint8List imageBytes = await image!.readAsBytes();
          await supabase.storage.from('products').uploadBinary(imagePath, imageBytes);
          await Supabase.instance.client.from('products').insert(<String, Object>{
            'name': name,
            'description': description,
            'price': double.parse(price),
            'image': imagePath,
          });

					await Navigator.pushNamed(context, MainRoutes.home);
					ReusableSnackBar.show(context: context, message: 'Nuevo producto agregado');
        } else {
          await Supabase.instance.client
              .from('products')
              .insert(<String, Object>{
            'name': name,
            'description': description,
            'price': double.parse(price),
            'image': '',
          });
        }

				// Clean
        nameController.clear();
        descriptionController.clear();
        priceController.clear();
      } else {
        if (kDebugMode) {
          print('Por favor ingresa todos los campos');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving product: $e');
      }
    }
  }

	Widget uploadImage() {
		return LoadImageWidget(
			image: image != null ? Image.file(
				image!,
				width: MediaQuery.of(context).size.width,
				height:	MediaQuery.of(context).size.height
			) : null,
			onTap: () => _pickAndUploadImage()
		);
	}

	List<Widget> inputs() {
		const SizedBox spaceSizeBox = SizedBox(height: 10.0);
		return <Widget>[
			uploadImage(),
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
				keyboard: TextInputType.number
      ),
      const SizedBox(height: 30.0),
      OutlineButtonWidget(
				fillButton: true,
				text: 'Guardar producto',
				onPressed: () => _saveProduct()
			)
		];
	}

	Widget bodyContainer() {
		return Container(
			margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
			child: Column(
				children: inputs(),
			)
		);
	}

  @override
  Widget build(BuildContext context) {
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
          child: bodyContainer()
      ))
    );
  }
}
