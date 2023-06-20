import 'package:flutter/material.dart';
import 'package:flutter_udemy_092_toktik/config/theme/app_theme.dart';
import 'package:flutter_udemy_092_toktik/domain/repositories/video_posts_repository.dart';
import 'package:flutter_udemy_092_toktik/infrastructure/datasources/local_videos_datasource_impl.dart';
import 'package:flutter_udemy_092_toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:flutter_udemy_092_toktik/presentation/providers/discover_provider.dart';
import 'package:flutter_udemy_092_toktik/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoPostsRepository videoPostsRepository = VideoPostsRepositoryImpl(videoPostsDataSource: LocalVideoDataSourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoPostsRepository: videoPostsRepository)..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
