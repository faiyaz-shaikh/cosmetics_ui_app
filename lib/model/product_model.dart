class ProductModel {
  String productName;
  String description;
  String imageUrl;
  double price;
  int itemCount = 0;
  ProductModel({
    required this.productName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  static var dummyData = <ProductModel>[
    ProductModel(
        productName: 'Lipstick',
        description: 'deep pink',
        price: 20,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/1546/0661/products/Perfect-Setting-Powder_1_2000x600.png?v=1513718610'),
    ProductModel(
        productName: 'Powder',
        description: 'with olive oil',
        price: 12,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/1546/0661/products/Perfect-Setting-Powder_1_2000x600.png?v=1513718610'),
    ProductModel(
        productName: 'Blush',
        description: 'Matte',
        price: 27,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/1546/0661/products/Perfect-Setting-Powder_1_2000x600.png?v=1513718610'),
  ];
}
