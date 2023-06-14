import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_hashhtag_example/features/post/domain/hashtag_entity.dart';
import 'package:firebase_hashhtag_example/features/post/repo/refs/post_refs.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const routeName = 'Search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchNameDelegate(),
              );
            },
          )
        ],
      ),
      body: const Column(),
    );
  }
}

class SearchNameDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      brightness: Brightness.light,
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return StreamBuilder<QuerySnapshot<HashtagEntity>>(
        stream: _searchName(query),
        builder: _results,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return StreamBuilder<QuerySnapshot<HashtagEntity>>(
        stream: _searchName(query),
        builder: _results,
      );
    } else {
      return Container();
    }
  }

  Widget _results(
    BuildContext context,
    AsyncSnapshot<QuerySnapshot<HashtagEntity>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return const Center(child: Text('検索結果なし'));
    }

    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, int index) {
        final entity = snapshot.data!.docs[index].data();
        final date = entity.hashtagName;
        return ListTile(
          title: Text(
            date,
          ),
        );
      },
    );
  }

  Stream<QuerySnapshot<HashtagEntity>> _searchName(String queryString) {
    return hashtagsRef
        .where('hashtagOption', arrayContains: queryString)
        .snapshots();
  }
}
