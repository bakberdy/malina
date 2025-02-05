class ProductModel {
  final String name;
  final String description;
  final int price;
  final String pictureUrl;
  final String category;

  ProductModel(
      {required this.category,
      required this.name,
      required this.description,
      required this.price,
      required this.pictureUrl});
}
