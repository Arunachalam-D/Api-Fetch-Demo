import 'package:dio/dio.dart';
import 'package:flutter_demo_task/domain/model/drop_down_model.dart';
import 'package:flutter_demo_task/domain/model/message_data_model.dart';

Future<List<ListItem>?> getMessageData() async {
  final dio = Dio();
  // print("Entered api block of Messages");
 try {
    final payload = <String, dynamic>{};
    payload["Page"] = 1;
    payload["PageSize"] = 28;
    payload["MessageType"] = ["Message"];
    final response =
        await dio.post('https://rdcdev.radiusdirect.net/api/v1/listMessage',
            options: Options(
              method: 'POST',
              headers: {
                'authorization':
                    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA3OTEyOTIxLCJleHAiOjE3MDc5MjAxMjF9.ENWPJJxoOx2AuW-uPXAwrLaISMWB0_FB2y1SOYJt6DY",
                'Accept': 'application/json',
                'client_access':'SALIX'
              },
            ),
            data:payload
        );

    if (response.statusCode == 200) {
      // print(response.data);
      final messageData = TableData.fromJson(response.data);
      final List<ListItem>? items = messageData.data?.list!;
      // print(items?.first.messageId);//messageData.data?.list?.first.messageId
     return items;
    } else {
      // print(response.statusCode);
      throw Exception(response.statusCode);
    }
  }
  catch(e){
   throw Exception(e);
  }
}

Future<DropDownData?> getDropDownData() async {
  final dio = Dio();
  final DropDownData dropDownData;
  // print("Entered api block of Drop down");
  try {
    // print("Dropdown success");
    final payload = <String, dynamic>{};
    payload["Type"] = ["Project"];
    final response =
    await dio.post('https://rdcdev.radiusdirect.net/api/v1/messageList',
        options: Options(
          method: 'POST',
          headers: {
            'authorization':
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA3OTEyOTIxLCJleHAiOjE3MDc5MjAxMjF9.ENWPJJxoOx2AuW-uPXAwrLaISMWB0_FB2y1SOYJt6DY",
            'Accept': 'application/json',
            'client_access':'SALIX'
          },
        ),
        data:{
            'Type':'Project'
        }
    );

    if (response.statusCode == 200) {
      // print(response.data);
      dropDownData = DropDownData.fromJson(response.data);
      return dropDownData;
    } else {
      // print(response.statusCode);
      throw Exception(response.statusCode);
    }
  }
  catch(e){
    throw Exception(e);
  }
}

