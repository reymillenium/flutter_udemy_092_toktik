import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class VideoPostsRepositoryImpl implements VideoPostsRepository {
  final VideoPostsDataSource videoPostsDataSource;

  VideoPostsRepositoryImpl({required this.videoPostsDataSource});

  @override
  Future<List<VideoPostEntity>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPostEntity>> getTrendingVideosByPage(int page) {
    return videoPostsDataSource.getTrendingVideosByPage(page);
  }
}
