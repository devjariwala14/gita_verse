import 'package:get/get.dart';
import 'package:gita_verse/models/chapters_model.dart';
import 'package:gita_verse/models/random_shloka_model.dart';

class MainScreenController extends GetxController {
  final Chapters ch = Chapters();
  late List chapterName = [];
  late RxString randomShloka = ''.obs;

  @override
  Future<void> onInit() async {
    await getChapterData();
    await getRandomShloka();
    super.onInit();
  }

  getChapterData() async {
    var res = await Chapters().getData();
    if (res["success"]) {
      chapterName = res["data"];
    }
    update();
  }

  getRandomShloka() async {
    var res = await RandomShloka().getData();
    if (res["success"]) {
      randomShloka.value = res["data"][0]['Shloka'];
    }
    update();
  }
}
