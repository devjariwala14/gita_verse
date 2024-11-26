import 'dart:convert';

import 'package:gita_verse/config/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class ShlokaListModel {
  getData({required chapterNo}) async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.shlokaList));
    request.fields.addAll({'chapter_no': '$chapterNo'});
    http.StreamedResponse response = await request.send();
    var res = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return res;
    } else {
      Toast.show(
        "An Error Occurred",
        gravity: Toast.bottom,
        duration: Toast.lengthShort,
      );
    }
    return [];
  }
}
