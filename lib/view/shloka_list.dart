import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gita_verse/config/colors.dart';
import 'package:gita_verse/controller/shloka_list_controller.dart';
import 'package:gita_verse/view/shloka_main_screen.dart';

class ShlokaList extends StatefulWidget {
  ShlokaList({super.key});

  @override
  State<ShlokaList> createState() => _ShlokaListState();
}

class _ShlokaListState extends State<ShlokaList> with TickerProviderStateMixin {
  final ShlokaListController obj = Get.put(ShlokaListController());
  late TabController _explanationTabController;

  @override
  void initState() {
    _explanationTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String chapterName = Get.arguments["chapterName"].toString();
    String chapterNo = Get.arguments["chapterNo"].toString();
    return Scaffold(
      appBar: _appBar(chapterName),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text("Summary of the chapter",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _explanation(),
            const SizedBox(height: 10),
            const Text("Shloka",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _shlokaList(chapterNo, chapterName),
          ],
        ),
      ),
    );
  }

  Expanded _shlokaList(String chapterNo, String chapterName) {
    return Expanded(
      child: ListView.separated(
        itemCount: obj.shlokaList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.to(() => const ShlokaDetailed(), arguments: {
            "chapterNo": chapterNo,
            "chapterName": chapterName,
            "shlokaNumber": obj.shlokaList[index]["Verse"],
          }),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.secondaryDarkColor,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
                "${obj.shlokaList[index]["Verse"]}.  ${obj.shlokaList[index]["Shloka"]}"),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }

  Container _explanation() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.secondaryDarkColor),
      child: Column(
        children: [
          TabBar(
            controller: _explanationTabController,
            indicatorColor: AppColors.primaryDarkColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            overlayColor: WidgetStatePropertyAll(AppColors.secondaryDarkColor),
            indicator: BoxDecoration(
                color: AppColors.primaryDarkColor,
                borderRadius: BorderRadius.circular(15)),
            indicatorSize: TabBarIndicatorSize.tab,
            automaticIndicatorColorAdjustment: true,
            dividerHeight: 0,
            splashFactory: NoSplash.splashFactory,
            splashBorderRadius: BorderRadius.circular(15),
            tabs: const [
              Tab(text: "English"),
              Tab(text: "Hindi"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _explanationTabController,
              children: const [
                Center(
                  child: Text(
                    "english",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Center(
                  child: Text(
                    "hindi",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(String chapterName) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(
        chapterName,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryDarkColor,
    );
  }
}
