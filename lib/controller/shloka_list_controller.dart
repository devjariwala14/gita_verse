import 'package:get/get.dart';

import '../models/shloka_list_model.dart';

class ShlokaListController extends GetxController {
  late String chapterNo;
  late String chapterName;
  late List shlokaList = [];

  @override
  void onInit() {
    chapterName = Get.arguments["chapterName"].toString();
    chapterNo = Get.arguments["chapterNo"].toString();
    getShlokaList();
    super.onInit();
  }

  getShlokaList() async {
    var res = await ShlokaListModel().getData(chapterNo: chapterNo);
    if (res["success"]) {
      shlokaList = res["data"];
      // randomShloka.value = res["data"][0]['Shloka'];
    }
    update();
  }
}
