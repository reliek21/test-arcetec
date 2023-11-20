class ProductEntity {
  final String uuid;
  final String name;
  final String description;
  final double price;
  final String image;

  const ProductEntity({
		required this.uuid,
		required this.name,
		required this.description,
		required this.price,
		required this.image
	});
}
