import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gita_verse/config/colors.dart';
import 'package:gita_verse/controller/main_screen_controller.dart';
import 'package:gita_verse/view/shloka_list.dart';
import 'package:gita_verse/view/shloka_main_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainScreenController obj = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Shloka of the Day",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _shlokOfTheDay(),
            const Text(
              "Chapters",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _chapters(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        "गीता Verse",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryDarkColor,
      elevation: 2,
    );
  }

  Widget _chapters() {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Get.to(() => ShlokaList(), arguments: {
            "chapterName": '${obj.chapterName[index]["adhyay_name"]}',
            "chapterNo": '${obj.chapterName[index]["chapter"]}'
          }),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.secondaryDarkColor,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
                "${obj.chapterName[index]["chapter"]}.  ${obj.chapterName[index]["adhyay_name"]}"),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: obj.chapterName.length,
      ),
    );
  }

  Container _shlokOfTheDay() {
    return Container(
      width: Get.width - 20,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.secondaryDarkColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Get.to(() => const ShlokaDetailed(),
                  arguments: {"shlokaNumber": 12}),
              child: Obx(
                () => Text(
                  obj.randomShloka.value.toString(),
                ),
              )),
          GestureDetector(
              onTap: () {}, child: const Icon(Icons.volume_up_outlined)),
        ],
      ),
    );
  }
}
