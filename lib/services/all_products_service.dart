import 'package:store_task/helper/api.dart';
import 'package:store_task/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList = data.map((product) {
      return ProductModel.fromJson(product);
    }).toList();

    return productsList;
  }
}
