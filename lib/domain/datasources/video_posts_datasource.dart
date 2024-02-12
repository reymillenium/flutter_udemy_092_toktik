import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

abstract class VideoPostsDataSource {
  Future<List<VideoPostEntity>> getFavoriteVideosByUser(String userId);

  Future<List<VideoPostEntity>> getTrendingVideosByPage(int page);
}
