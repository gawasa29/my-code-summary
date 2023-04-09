// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../API/marvel.dart';
import '../widgets/loading_image.dart';

final character = FutureProvider.autoDispose
    .family<Character, String>((ref, selectedCharacterId) async {
  final repository = ref.watch(repositoryProvider);
  Character character =
      await repository.fetchCharacter(id: selectedCharacterId);

  /// Cache the Character once it was successfully obtained.
  ref.keepAlive();
  return character;
});

class CharacterView extends ConsumerWidget {
  const CharacterView({
    Key? key,
    required this.selectedCharacterId,
  }) : super(key: key);

  final String selectedCharacterId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("🐯 CharacterView きたよ");
    return ref.watch(character(selectedCharacterId)).when(
      loading: () {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
      error: (err, stack) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
        );
      },
      data: (character) {
        return Scaffold(
          appBar: AppBar(
            title: Text(character.name),
          ),
          body: LoadingImage(url: character.thumbnail.url),
        );
      },
    );
  }
}
