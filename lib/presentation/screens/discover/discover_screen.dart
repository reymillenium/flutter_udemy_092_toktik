import 'package:flutter_udemy_092_toktik/flutter_resources.dart';
import 'package:flutter_udemy_092_toktik/external_resources.dart';
import 'package:flutter_udemy_092_toktik/internal_resources.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final discoverProvider = Provider.of<DiscoverProvider>(context); // Old syntax. By default: listen: true, like the watch. It executes build after any change on the provider
    final discoverProvider = context.watch<DiscoverProvider>(); //New syntax. It executes build after any change on the provider (with read it won't, which is the same as listen: false in the old syntax)

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                strokeWidth: 2,
              ))
            : VideoScrollableView(videoPosts: discoverProvider.videoPosts));
  }
}
