import 'package:flutter_udemy_092_toktik/domain/datasources/video_posts_datasource.dart';
import 'package:flutter_udemy_092_toktik/domain/entities/video_post.dart';
import 'package:flutter_udemy_092_toktik/infrastructure/models/local_video_model.dart';
import 'package:flutter_udemy_092_toktik/shared/data/local_videos.dart';

class LocalVideoDataSourceImpl implements VideoPostsDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    // To fake the delay due to loading the videos from a Remote location
    await Future.delayed(const Duration(seconds: 2));
    List<VideoPost> newVideoPosts = localVideos.map((localVideoPostJson) => LocalVideoModel.fromJson(localVideoPostJson).toVideoPostEntity()).toList();
    return newVideoPosts;
  }
}
