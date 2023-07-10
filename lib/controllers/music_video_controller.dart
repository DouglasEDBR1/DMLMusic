import 'package:dml_music/api/api_video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/video_model.dart';

class Api{

  Future<List<Video>?> search(String search) async{
    http.Response response = await http.get(VideoApi.url(
        'search',
        '?part=snippet',
        '&type=video',
        '&maxResults=200',
        '&order=date',
        '&key=${VideoApi.youtube_key_api}',
       // '&channelId=${VideoApi.channel_id}',
        '&q=$search'
    ));
    if (response.statusCode == 200){
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<Video> videos = jsonData['items'].map<Video>((map){
            print ( response.body);
            return Video.fromJson(map);
          }
      ).toList();

      return videos;
    }
    return null;
  }

}