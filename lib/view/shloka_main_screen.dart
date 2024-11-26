import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gita_verse/config/colors.dart';

class ShlokaDetailed extends StatefulWidget {
  const ShlokaDetailed({super.key});

  @override
  State<ShlokaDetailed> createState() => _ShlokaDetailedState();
}

class _ShlokaDetailedState extends State<ShlokaDetailed>
    with TickerProviderStateMixin {
  late TabController _translationTabController;
  late TabController _meaningTabController;

  @override
  void initState() {
    super.initState();
    _translationTabController = TabController(length: 3, vsync: this);
    _meaningTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    String shlokaNumber = Get.arguments["shlokaNumber"].toString();
    String chapterName = Get.arguments["chapterName"].toString();
    String chapterNo = Get.arguments["chapterNo"].toString();
    String englishTrans = "English";
    String hindiTrans = "Hindi";
    String gujTrans = "Gujarati";
    return Scaffold(
      appBar: _appBar(shlokaNumber: shlokaNumber, chapterNo: chapterNo),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _verse(),
            const Text("Translation",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _tabBar(controller: _translationTabController),
            _tabView(
                controller: _translationTabController,
                english: englishTrans,
                hindi: hindiTrans,
                gujarati: gujTrans),
            const Text("Meaning",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _tabBar(controller: _meaningTabController),
            _tabView(
                controller: _meaningTabController,
                english: englishTrans,
                hindi: hindiTrans,
                gujarati: gujTrans)
          ],
        ),
      ),
    );
  }

  TabBar _tabBar({required TabController controller}) {
    return TabBar(
      controller: controller,
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
        Tab(text: "Gujarati"),
      ],
    );
  }

  Expanded _tabView(
      {required TabController controller,
      required String english,
      required String hindi,
      required String gujarati}) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: [
          Center(
            child: Text(
              english,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: Text(
              hindi,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: Text(
              gujarati,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Container _verse() {
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
          const Expanded(
            child: Text(
              "धर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः ।\nमामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय",
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.volume_up_outlined)),
        ],
      ),
    );
  }

  AppBar _appBar({required String shlokaNumber, required String chapterNo}) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(
        "Chapter:$chapterNo,Verse:$shlokaNumber",
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryDarkColor,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ))
      ],
    );
  }
}
