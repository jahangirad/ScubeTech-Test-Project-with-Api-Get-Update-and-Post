import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/put_data.dart';
import '../utils/color_code.dart';
import '../utils/height_width_space.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class PutData extends StatefulWidget {
  var currentData;
  PutData ({required this.currentData});

  @override
  State<PutData> createState() => _PutDataState();
}

class _PutDataState extends State<PutData> {

  UpdateApiData allUpdate = Get.put(UpdateApiData());
  final _formKey = GlobalKey<FormState>();
  TextEditingController currentProjectName = TextEditingController();
  TextEditingController currentProjectUpdate = TextEditingController();
  TextEditingController currentEngineerName = TextEditingController();
  TextEditingController currentTechnicianName = TextEditingController();
  TextEditingController currentStartDate = TextEditingController();
  TextEditingController currentEndDate = TextEditingController();
  TextEditingController currentStartDay = TextEditingController();
  TextEditingController currentEndDay = TextEditingController();
  TextEditingController currentDuration = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),//it is a CustomAppbar Location widgets directory
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  HeightWidth.heightDistanSize5,
                  textFormField(currentProjectName = TextEditingController(text: widget.currentData.projectName.toString()), "Project Name", "Project Name", "Please Input Project Name"),
                  HeightWidth.heightDistanSize10,
                  textFormField(currentProjectUpdate = TextEditingController(text: widget.currentData.projectUpdate.toString()), "Project Update", "Project Update", "Please Input Project Update"),
                  HeightWidth.heightDistanSize10,
                  textFormField(currentEngineerName = TextEditingController(text: widget.currentData.assignedEngineer.toString()), "Engineer Name", "Engineer Name", "Please Input Engineer Name"),
                  HeightWidth.heightDistanSize10,
                  textFormField(currentTechnicianName = TextEditingController(text: widget.currentData.assignedTechnician.toString()), "Technician Name", "Technician Name", "Please Input Technician Name"),
                  HeightWidth.heightDistanSize10,
                  textFormField(currentStartDate = TextEditingController(text: DateFormat("yyyy-MM-dd").format(widget.currentData.startDate)), "Start Date", "Start Date", "Please Input Start Date"),
                  HeightWidth.heightDistanSize10,
                  textFormField(currentEndDate = TextEditingController(text: DateFormat("yyyy-MM-dd").format(widget.currentData.endDate)), "End Date", "End Date", "Please Input End Date"),
                  HeightWidth.heightDistanSize10,
                  GestureDetector(
                    onTap: ()async{
                      if (_formKey.currentState!.validate()) {
                        allUpdate.updateData(
                            widget.currentData.id.toString(),
                            currentStartDate.text,
                            currentEndDate.text,
                            currentProjectName.text,
                            currentProjectUpdate.text,
                            currentEngineerName.text,
                            currentTechnicianName.text
                        );
                      }
                      print(widget.currentData.id);
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
          ),
        )
    );
  }
}
