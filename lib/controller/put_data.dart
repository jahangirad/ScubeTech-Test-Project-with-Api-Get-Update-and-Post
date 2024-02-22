import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateApiData extends GetxController {

  Future<void> updateData(String putId, String startDate, String endDate, String projectName, String projectUpdate, String assEng, String assTec) async {
    final Uri uri = Uri.parse("https://scubetech.xyz/projects/dashboard/update-project-elements/$putId/");

    try {
      print(uri);
      final response = await http.put(
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
      print(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "Update",
          "New Data Successfully Update",
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
