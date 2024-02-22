import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scubetech/utils/height_width_space.dart';
import '../controller/post_data.dart';
import '../utils/color_code.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class PostData extends StatefulWidget {
  PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController projectName = TextEditingController();
  TextEditingController projectUpdate = TextEditingController();
  TextEditingController engineerName = TextEditingController();
  TextEditingController technicianName = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  PostApiData _postApiData = Get.put(PostApiData());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              HeightWidth.heightDistanSize5,
              textFormField(projectName, "Project Name", "Project Name", "Please Input Project Name"),
              HeightWidth.heightDistanSize10,
              textFormField(projectUpdate, "Project Update", "Project Update", "Please Input Project Update"),
              HeightWidth.heightDistanSize10,
              textFormField(engineerName, "Engineer Name", "Engineer Name", "Please Input Engineer Name"),
              HeightWidth.heightDistanSize10,
              textFormField(technicianName, "Technician Name", "Technician Name", "Please Input Technician Name"),
              HeightWidth.heightDistanSize10,
              textFormField(startDate, "yyyy-mm-dd", "Start Date", "Please Input Start Date"),
              HeightWidth.heightDistanSize10,
              textFormField(endDate, "yyyy-mm-dd", "End Date", "Please Input End Date"),
              HeightWidth.heightDistanSize10,
              GestureDetector(
                onTap: (){
                  if (_formKey.currentState!.validate()) {
                    _postApiData.postData(
                        startDate.text,
                        endDate.text,
                        projectName.text,
                        projectUpdate.text,
                        engineerName.text,
                        technicianName.text
                    );
                  }
                },
                child: Container(
                  height: Get.height / 14,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ColorsCode.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(child: textForTabBar("Continue")),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
