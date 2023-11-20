class ProductEntity {
	final String name;
	final String description;
	final double price;
	final String image;

	const ProductEntity({
		required this.name,
		required this.description,
		required this.price,
		required this.image
	});

	Map<String, Object> get toJson => <String, Object>{
		'name': name, 'description': description, 'price': price, 'image': image
	};
}
