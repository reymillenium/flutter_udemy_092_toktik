import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class LocalVideoDataSourceImpl implements VideoPostsDataSource {
  @override
  Future<List<VideoPostEntity>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPostEntity>> getTrendingVideosByPage(int page) async {
    // To fake the delay due to loading the videos from a Remote location
    await Future.delayed(const Duration(seconds: 2));
    List<VideoPostEntity> newVideoPosts = localVideos.map((jsonMap) => LocalVideoModel.fromJson(jsonMap).toVideoPostEntity()).toList();
    return newVideoPosts;
  }
}
