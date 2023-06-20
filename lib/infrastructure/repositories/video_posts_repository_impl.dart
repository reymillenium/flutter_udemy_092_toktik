import 'package:flutter_udemy_092_toktik/domain/datasources/video_posts_datasource.dart';
import 'package:flutter_udemy_092_toktik/domain/entities/video_post.dart';
import 'package:flutter_udemy_092_toktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostsRepository {
  final VideoPostsDataSource videoPostsDataSource;

  VideoPostsRepositoryImpl({required this.videoPostsDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostsDataSource.getTrendingVideosByPage(page);
  }
}
