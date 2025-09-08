import '../gen/assets.gen.dart';

class ProductModel {
  final int id;
  final AssetGenImage image;

  final String name;

  final double price;

  final String description;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  static List<ProductModel> products = [
    ProductModel(
        id: 1,
        image: Assets.product.product1,
        name: "October",
        price: 100,
        description: "reversible angora cardigan"),
    ProductModel(
        id: 2,
        image: Assets.product.product2,
        name: "October",
        price: 100,
        description: "reversible angora cardigan"),
    ProductModel(
        id: 3,
        image: Assets.product.product3,
        name: "October",
        price: 100,
        description: "reversible angora cardigan"),
    ProductModel(
        id: 4,
        image: Assets.product.product4,
        name: "October",
        price: 100,
        description: "reversible angora cardigan"),
    ProductModel(
        id: 5,
        image: Assets.product.product5,
        name: "October",
        price: 100,
        description: "reversible angora cardigan"),
    ProductModel(
        id: 6,
        image: Assets.product.product6,
        name: "October",
        price: 100,
        description: "reversible angora cardigan")
  ];
}
