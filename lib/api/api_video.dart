import 'package:dml_music/network/network_service.dart';

class VideoApi{

  //static final base_url =  Uri.parse('https://www.googleapis.com/youtube/v3/');
  // var baseUrl = Uri.parse('https://www.googleapis.com/youtube/v3/$search$snippet$typeVideo$maxResult$order$keyYoutubeApi$query');

  Future<dynamic> getVideo({
   String? search,
   required int maxResult,
   required String keyYoutubeApi,
    // String channelID,
   // String? query
  }) {
    // String endpoint = 'search?key=$keyYoutubeApi&type=video&maxResults=$maxResult&order=date&part=snippet&q=$search';
    String endpoint = 'search?part=snippet&maxResults=$maxResult&type=video&key=$keyYoutubeApi';

    if (search != null && search != '') {
      endpoint += '&q=$search';
    }

    print(endpoint);

    return NetworkService.request(endpoint: endpoint).then((response) {
      return response;
    }).catchError((error) {
      throw (error);
    });
  }

}