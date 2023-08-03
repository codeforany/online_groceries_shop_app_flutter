
import 'package:get/get.dart';
import 'package:online_groceries/model/image_model.dart';
import 'package:online_groceries/model/nutrition_model.dart';
import 'package:online_groceries/model/offer_product_model.dart';
import 'package:online_groceries/model/product_detail_model.dart';

import '../common/globs.dart';
import '../common/service_call.dart';

class ProductDetailViewMode extends GetxController {
  final OfferProductModel pObj;
  final sProductObj = ProductDetailModel().obs;
  final RxList<NutritionModel> nutritionList = <NutritionModel>[].obs;
  final RxList<ImageModel> imageList = <ImageModel>[].obs;
  final isShowDetail = true.obs;
  final isShowNutrition = true.obs;
  final isFav = false.obs;
  final qty = 1.obs;

  ProductDetailViewMode(this.pObj) {
    isFav.value = pObj.isFav ?? false;
  }

  String getPrice(){
    return (( pObj.offerPrice ?? pObj.price ?? 0.0) * qty.value).toStringAsFixed(2);
  }
  void addSubQTY({isAdd = true} ) {
    if(isAdd) {
      qty.value = qty.value + 1;

      if(qty.value > 99) {
        qty.value = 99;
      }
    }else{
      qty.value = qty.value - 1;

      if(qty.value < 1) {
        qty.value = 1;
      }
    }
  }

  void showDetail(){
    isShowDetail.value = !isShowDetail.value;
  }

  void showNutrition() {
    isShowNutrition.value = !isShowNutrition.value;
  }


  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    serviceCallProductDetail();
  
  }

  //MARK ServiceCall
  void serviceCallProductDetail(){
    Globs.showHUD();
    ServiceCall.post({
      "prod_id": pObj.prodId.toString(),
    }, SVKey.svProductDetail, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var payload = resObj[KKey.payload];

        sProductObj.value = ProductDetailModel.fromJson(payload);

        var nutritionDataArr = (payload["nutrition_list"] as List? ?? []).map((oObj) {
          return NutritionModel.fromJson(oObj);
        }).toList();

        nutritionList.value = nutritionDataArr;

        var imageDataArr =
            (payload["images"] as List? ?? []).map((oObj) {
          return ImageModel.fromJson(oObj);
        }).toList();

        imageList.value = imageDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void serviceCallAddRemoveFavorite() {
    Globs.showHUD();
    ServiceCall.post({
      "prod_id": pObj.prodId.toString(),
    }, SVKey.svAddRemoveFavorite, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
       
        isFav.value = !isFav.value;
        Get.snackbar(Globs.appName, resObj[KKey.message]);
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

}