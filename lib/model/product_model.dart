class ProductModel {
  int? id;
  String productName;
  String productCode;
  String? productShade1;
  String? productShade2;
  String? productShade3;
  //String?image;
  int quantity1;
  int quantity2;
  int quantity3;
  int stock;
  int productPurchasePrice;
  int productRetailSalePrice;
  int productHoleSalePrice;

  ProductModel(
      {this.id,
      required this.productName,
      required this.productCode,
      this.productShade1,
      this.productShade2,
      this.productShade3,
      this.quantity1=0,
      this.quantity2=0,
      this.quantity3=0,
      this.stock = 0,
      required this.productPurchasePrice,
      required this.productRetailSalePrice,
      required this.productHoleSalePrice});

  Map<String, dynamic> toMap() {
    return {
      tabMembersColId: id ?? id,
      tabMembersColName: productName,
      tabMembersColCode: productCode,
      tabMembersColShade1: productShade1,
      tabMembersColShade2: productShade2,
      tabMembersColShade3: productShade2,
      tabMembersColQuantity1: quantity1,
      tabMembersColQuantity2: quantity2,
      tabMembersColQuantity3: quantity3,
      tabMembersColStock:stock,
      tabMembersColMealPurches: productPurchasePrice,
      tabMembersColRetail: productRetailSalePrice,
      tabMembersColHole: productHoleSalePrice,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map[tabMembersColId],
      productName: map[tabMembersColName],
      productCode: map[tabMembersColCode],
      productShade1: map[tabMembersColShade1],
      productShade2: map[tabMembersColShade2],
      productShade3: map[tabMembersColShade3],
      quantity1: map[tabMembersColQuantity1],
      quantity2: map[tabMembersColQuantity2],
      quantity3: map[tabMembersColQuantity3],
      stock: map[tabMembersColStock],
      productPurchasePrice: map[tabMembersColMealPurches],
      productRetailSalePrice: map[tabMembersColRetail],
      productHoleSalePrice: map[tabMembersColHole],
    );
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, productName: $productName, productCode: $productCode, productShade1: $productShade1, productShade2: $productShade2, productShade3: $productShade3, quantity1: $quantity1, quantity2: $quantity2, quantity3: $quantity3, stock: $stock, productPurchasePrice: $productPurchasePrice, productRetailSalePrice: $productRetailSalePrice, productHoleSalePrice: $productHoleSalePrice}';
  }
}

const String tabProducts = 'tb_products';
const String tabMembersColId = 'id';
const String tabMembersColName = 'name';
const String tabMembersColCode = 'code';
const String tabMembersColStock = 'stock';
const String tabMembersColShade1 = 'shade1';
const String tabMembersColShade2 = 'shade2';
const String tabMembersColShade3 = 'shade3';
const String tabMembersColQuantity1 = 'quantity1';
const String tabMembersColQuantity2 = 'quantity2';
const String tabMembersColQuantity3 = 'quantity3';
const String tabMembersColMealPurches = 'purchaseprice';
const String tabMembersColRetail = 'holesaleprice';
const String tabMembersColHole = 'retailprice';
