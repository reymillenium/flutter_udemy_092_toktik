import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRepository;
  bool initialLoading = true;
  List<VideoPostEntity> videoPosts = [];
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
