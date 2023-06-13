import 'package:flutter/cupertino.dart';
import 'package:flutter_udemy_092_toktik/domain/entities/video_post.dart';
import 'package:flutter_udemy_092_toktik/infrastructure/models/local_video_model.dart';
import 'package:flutter_udemy_092_toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository and a DataSource. To do the next time

  bool initialLoading = true;
  List<VideoPost> videoPosts = [];

  Future<void> loadNextPage() async {
    // To fake the delay due to loading the videos from a Remote location
    await Future.delayed(const Duration(seconds: 2));
    // List<VideoPost> newVideoPosts = localVideoPosts.map((localVideoPostJson) => LocalVideoModel.fromJson(localVideoPostJson).toVideoPostEntity()).toList();
    // videoPosts.addAll(newVideoPosts);
    // localVideoPosts.forEach((localVideoPostJson) {
    //   videoPosts.add(LocalVideoModel.fromJson(localVideoPostJson).toVideoPostEntity());
    // });
    for (var localVideoPostJson in localVideoPosts) {
      videoPosts.add(LocalVideoModel.fromJson(localVideoPostJson).toVideoPostEntity());
    }
    initialLoading = false;
    notifyListeners();
  }
}
