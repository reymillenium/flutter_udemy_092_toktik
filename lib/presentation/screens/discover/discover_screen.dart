import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final discoverProvider = Provider.of<DiscoverProvider>(context); // Old syntax. default is -> listen: true, like the watch
    final discoverProvider = context.watch<DiscoverProvider>(); //New syntax

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                strokeWidth: 2,
              ))
            : VideoScrollableView(videoPosts: discoverProvider.videoPosts));
  }
}
