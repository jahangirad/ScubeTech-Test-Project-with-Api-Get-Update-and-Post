import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scubetech/pages/getdata_page.dart';
import 'package:scubetech/pages/postdata_page.dart';
import 'package:scubetech/utils/color_code.dart';
import 'package:scubetech/utils/height_width_space.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_text.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),//it is a CustomAppbar Location widgets directory
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                // Customize the appearance and behavior of the tab bar
                backgroundColor: ColorsCode.primaryColor,
                // Add your tabs here
                tabs: [
                  Tab(
                    child: SizedBox(
                        width: Get.width / 2.4,
                        child: Center(child: textForTabBar("Get Data")) //textForTabBar is a Custom Text Location widgets directory
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                        width: Get.width / 2.4,
                        child: Center(child: textForTabBar("Post Data")) //textForTabBar is a Custom Text Location widgets directory
                    ),
                  ),
                ],
              ),
              HeightWidth.heightDistanSize5,
              Expanded(
                child: TabBarView(
                  children: [
                    GetData(),
                    PostData()
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
