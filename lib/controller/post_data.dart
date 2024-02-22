import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class PostApiData extends GetxController{
  Future<void> postData(String startDate, String endDate, String projectName, String projectUpdate, String assEng, String assTec) async {
    final Uri uri = Uri.parse("https://scubetech.xyz/projects/dashboard/add-project-elements/");

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "start_date": startDate,
          "end_date": endDate,
          "project_name": projectName,
          "project_update": projectUpdate,
          "assigned_engineer": assEng,
          "assigned_technician": assTec,
        }),
      );

      if (response.statusCode == 201) {
        Get.snackbar(
          "Created",
          "New Data Successfully Added",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to create new data",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}