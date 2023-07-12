import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  
 static Future<dynamic> request({required String endpoint}) async {
    // final youtube_key_api = Uri.parse('AIzaSyAbF23f66Gp6afubOM_FgpZulbm_dkHOOk');
    // final channel_id = Uri.parse('UCZFsg_pjXp-NyK3Eg1uhyMg');

    http.Response response = await http.get(Uri.parse('https://www.googleapis.com/youtube/v3/$endpoint'));

    return response;

  }


}