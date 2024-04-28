Map<String, dynamic> products = {'1': 'Store', '2': 'Farm', '3': 'School'};

class FakeProductRepo {
  // FakeProductRepo({required this.productID});
  // final String productID;

  String getProducts(String productID) {
    return products[productID];
  }

  Future<String> fetchProducts(String productID) async {
    await Future.delayed(const Duration(seconds: 2));
    return products[productID];
  }
}
