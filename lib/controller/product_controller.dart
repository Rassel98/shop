import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_task/db/dbhelper.dart';
import 'package:simple_task/model/product_model.dart';

class ProductController extends GetxController {

  final productName = TextEditingController();
  final productBrand = TextEditingController();
  final productCode = TextEditingController();
  final productShade1 = TextEditingController();
  final productShade2 = TextEditingController();
  final productShade3 = TextEditingController();
  final productShade4 = TextEditingController();
  final productShade5 = TextEditingController();
  final productShade6 = TextEditingController();
  final shadeQuantity1 = TextEditingController();
  final shadeQuantity2 = TextEditingController();
  final shadeQuantity3 = TextEditingController();
  final shadeQuantity4 = TextEditingController();
  final shadeQuantity5 = TextEditingController();
  final shadeQuantity6 = TextEditingController();
  final productHoleSalePrice = TextEditingController();
  final productRetailPrice = TextEditingController();
  final productPurchasePrice = TextEditingController();
  final searchController = TextEditingController();

  String? imageUrl;
  ImageSource imageSource = ImageSource.camera;
  var isUpload=false;

  Future<bool> addData() async {
    final product = ProductModel(
        productName: productName.text,
        productCode: productCode.text,
        productShade1: productShade1.text,
        productShade2: productShade1.text,
        productShade3: productShade1.text,
        quantity1: int.parse(shadeQuantity1.text),
        quantity2: int.parse(shadeQuantity2.text),
        quantity3: int.parse(shadeQuantity3.text),
        stock: int.parse(shadeQuantity1.text)+int.parse(shadeQuantity1.text)+int.parse(shadeQuantity1.text),
        productPurchasePrice: int.parse(productPurchasePrice.text),
        productRetailSalePrice: int.parse(productRetailPrice.text),
        productHoleSalePrice: int.parse(productHoleSalePrice.text));
    final rowId = await DBHelper.insertData(product);
    if (rowId > 0) {
      // memberInfo.id = rowId;
      // allMembers.add(memberInfo);

      return true;
    }
    return false;
  }

  // }

  List<ProductModel> allProducts = [];
  ProductModel? productModel;

  searchProduct() {
    for (var i in allProducts) {
      if (searchController.text.toLowerCase() == i.productName.toLowerCase() ||
          searchController.text.toLowerCase() == i.productCode.toLowerCase()) {
        productModel=i;
        print(productModel!.productName);
        searchController.clear();
        update();
        //allProducts.clear();
        break;
      }
    }
  }

  // Future<bool> addNewMembers(MemberInfo memberInfo) async {
  //   final rowId = await DBHelper.insertData(memberInfo);
  //   if (rowId > 0) {
  //     memberInfo.id = rowId;
  //     allMembers.add(memberInfo);
  //     notifyListeners();
  //     return true;
  //   }
  //   return false;
  // }
  //

  @override
  void onInit() {
    productModel=null;
    getAllMembers();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   name.value = '';
  //   super.onClose();
  // }
  getAllMembers() async {
    allProducts = await DBHelper.getAllProducts();
    update();
  }
}
