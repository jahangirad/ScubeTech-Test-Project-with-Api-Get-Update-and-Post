import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scubetech/pages/putdata_page.dart';
import 'package:intl/intl.dart';
import '../controller/get_data.dart';
import '../data/data_model.dart';
import '../widgets/custom_text.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {

  final GetApiData getAllData = Get.put(GetApiData());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DataModel>?>(
      stream: getAllData.getAllData(),
      builder: (context , snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }else {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height / 4.5,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Column(
                            children: [
                              textForGetDataTitle(
                                  snapshot.data![index].projectName.toString()
                              ),
                              textForGetDataSubtitle(
                                  snapshot.data![index].projectUpdate.toString()
                              ),
                              Divider(height: 2,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: SizedBox(
                                      width: Get.width / 4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          textForGetDataDetails("Engineer"),
                                          textForGetDataDetails("Technician"),
                                          textForGetDataDetails("Start Date"),
                                          textForGetDataDetails("End Date"),
                                          textForGetDataDetails("Start Day"),
                                          textForGetDataDetails("End Day"),
                                          textForGetDataDetails("Duration"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width / 30,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        textForGetDataDetails(":"),
                                        textForGetDataDetails(":"),
                                        textForGetDataDetails(":"),
                                        textForGetDataDetails(":"),
                                        textForGetDataDetails(":"),
                                        textForGetDataDetails(":"),
                                        textForGetDataDetails(":"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width / 1.7,
                                    child: Stack(
                                      clipBehavior: Clip.hardEdge,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            textForGetDataDetails(snapshot.data![index].assignedEngineer.toString()),
                                            textForGetDataDetails(snapshot.data![index].assignedTechnician.toString()),
                                            textForGetDataDetails(DateFormat("yyyy-MM-dd").format(snapshot.data![index].startDate)),
                                            textForGetDataDetails(DateFormat("yyyy-MM-dd").format(snapshot.data![index].endDate)),
                                            textForGetDataDetails(snapshot.data![index].startDayOfYear.toString()),
                                            textForGetDataDetails(snapshot.data![index].endDayOfYear.toString()),
                                            textForGetDataDetails(snapshot.data![index].duration.toString()),
                                          ],
                                        ),
                                        Positioned(
                                            bottom: -0,
                                            right: -0,
                                            child: CircleAvatar(
                                              radius: 25,
                                              child: IconButton(
                                                  onPressed: (){
                                                    Get.to(PutData(currentData: snapshot.data![index],));
                                                  },
                                                  icon: Icon(Icons.edit, size: 20,)
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        }
      },
    );
  }
}
