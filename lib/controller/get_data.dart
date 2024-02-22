import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../data/data_model.dart';


class GetApiData extends GetxController{

  Stream<List<DataModel>?> getAllData() async* {
    final result = await http.get(
      Uri.parse('https://scubetech.xyz/projects/dashboard/all-project-elements/'),
    );
    final body = json.decode(result.body);
    List<DataModel> dataList = [];
    body.forEach((i) {
      dataList.add(DataModel.fromJson(i));
    });
    yield dataList;
  }

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }
}