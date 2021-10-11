import 'package:cosmetic_ui_app/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;
  Rx<double> totalCost = 0.0.obs;

  void addItem(ProductModel product) {
    cartItems.forEach(
      (element) {
        if (element.productName == product.productName) {
          element.itemCount++;
        }
      },
    );
  }

  @override
  void onInit() {
    cartItems.addAll(ProductModel.dummyData);
    super.onInit();
  }

  void getTotalCost() {
    totalCost = 0.0.obs;
    cartItems.forEach(
      (element) {
        totalCost += element.price * element.itemCount;
      },
    );
  }
}
