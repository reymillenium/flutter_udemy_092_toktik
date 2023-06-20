import 'package:flutter/cupertino.dart';
import 'package:flutter_udemy_092_toktik/domain/entities/video_post.dart';
import 'package:flutter_udemy_092_toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRepository;
  bool initialLoading = true;
  List<VideoPost> videoPosts = [];
  bool isPlaying = false;

  DiscoverProvider({required this.videoPostsRepository});

  Future<void> loadNextPage() async {
    videoPosts.addAll(await videoPostsRepository.getTrendingVideosByPage(1));
    initialLoading = false;
    notifyListeners();
  }

  toggleVideoPlayer() {
    isPlaying = !isPlaying;
    notifyListeners();
  }

  resetVideoPlayer() {
    isPlaying = false;
    notifyListeners();
  }
}
