import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../API/marvel.dart';
import '../widgets/loading_image.dart';
import '../widgets/marvel_logo.dart';

const kCharactersPageLimit = 50;

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: SizedBox(
                height: 40,
                child: marvelLogo,
              ),
              centerTitle: true,
              background: Image.asset(
                'assets/marvel_background.jpeg',
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.multiply,
                color: Colors.grey.shade500,
              ),
              titlePadding: const EdgeInsetsDirectional.only(bottom: 8),
            ),
            pinned: true,
            actions: const [],
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, left: 3, right: 3),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: 50,
                (c, index) {
                  //overrideWithValueを使用するためにProviderScopeを使用
                  //overrideWithValueは値を更新するメソッド
                  return ProviderScope(
                    overrides: [
                      //これでindexの値に更新している。
                      _characterIndex.overrideWithValue(index),
                    ],
                    child: const CharacterItem(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _characterIndex = Provider<int>((ref) => 0);

class CharacterItem extends ConsumerWidget {
  const CharacterItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(_characterIndex);

    final character = ref.watch(characterAtIndex(index));
//.whenはAsyncValueを処理するときに使うRiverpod版FutureBuilderみたいな感じ。
    return character.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text('Error $err'),
      data: (character) {
        return GestureDetector(
          onTap: () {
            //TODO画面遷移後のキャラクターページ作成
            print(character.thumbnail.url);
          },
          //XXXここがキャラクターのカードのところ
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: 'character-${character.id}',
                    child: LoadingImage(url: character.thumbnail.url),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  //XXXここがキャラクターの名前
                  child: Text(character.name),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//AsyncValueクラスは非同期処理で発生するloading/error状態を簡単にハンドリングできるクラスです。
final characterAtIndex =
    Provider.autoDispose.family<AsyncValue<Character>, int>((ref, index) {
  //whenDataは、AsyncDataクラスを加工した後にAsyncValueクラスを返却する動きをします。
  //なのでProvider内でAsyncDataを加工する用途で用意されているのだと思います。
  return ref.watch(characterPages).whenData(
        (value) => value.characters[index],
      );
});

final characterPages = FutureProvider.autoDispose<MarvelListCharactersResponse>(
  (ref) async {
    // APIの使用しすぎを防ぐためにある?。
    await Future<void>.delayed(const Duration(seconds: 2));

    final repository = ref.watch(repositoryProvider);
    final charactersResponse = await repository.fetchCharacters(
      limit: kCharactersPageLimit,
    );
    return charactersResponse;
  },
);
