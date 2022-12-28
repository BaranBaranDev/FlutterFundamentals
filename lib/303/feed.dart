import 'package:flutter/material.dart';
import '../202/model.dart';

import '../202/service/service_learn.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with AutomaticKeepAliveClientMixin { // sürekli istek atmamak için AutomaticKeepAliveClientMixin ile state koruduk
  final PostService _postService = PostService();
  late final Future<List<PostModel>?> _itemsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemsFuture = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // AutomaticKeepAliveClientMixin için state koruma 
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      appBar: AppBar(
        actions: [ElevatedButton(onPressed: () {}, child: const Icon(Icons.ac_unit))],
      ),
      body: _FeedFutureBuilder(itemsFuture: _itemsFuture),
    );
  }

  @override
  bool get wantKeepAlive => true; //AutomaticKeepAliveClientMixin korumak için true 
}

class IPostService {
}

class _FeedFutureBuilder extends StatelessWidget {
  const _FeedFutureBuilder({
    Key? key,
    required Future<List<PostModel>?> itemsFuture,
  })  : _itemsFuture = itemsFuture,
        super(key: key);

  final Future<List<PostModel>?> _itemsFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>( // geriye döndürülecek değer de yazıldı
      future: _itemsFuture, // isteğimiz 
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
        switch (snapshot.connectionState) { // connectionState kullan duruma göre işlem uygulayacağız 
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index].body ?? ''),
                    ),
                  );
                },
              );
            } else {
              return const Placeholder();
            }
        }
      },
    );
  }
}