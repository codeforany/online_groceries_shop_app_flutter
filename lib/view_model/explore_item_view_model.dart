import 'package:get/get.dart';
import 'package:online_groceries/model/product_detail_model.dart';

import '../common/globs.dart';
import '../common/service_call.dart';
import '../model/explore_category_model.dart';
import '../model/offer_product_model.dart';

class ExploreItemViewMode extends GetxController {
  final ExploreCategoryModel pObj;
  final sProductObj = ProductDetailModel().obs;
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;

  ExploreItemViewMode(this.pObj);

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    serviceCallList();
  }

  //MARK ServiceCall
  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({
      "cat_id": pObj.catId.toString(),
    }, SVKey.svExploreItemList, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
         var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

}
