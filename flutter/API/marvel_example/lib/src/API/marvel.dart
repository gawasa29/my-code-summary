import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) => Dio());

final repositoryProvider = Provider(MarvelRepository.new);

const privateKey = "5fdd0ef46d2f7096b99cbe1495b7408315d4602b";
const publicKey = "cf4a151a0940a3bba281414c192cd438";

class MarvelRepository {
  MarvelRepository(
    this.ref, {
    int Function()? getCurrentTimestamp,
  }) : _getCurrentTimestamp = getCurrentTimestamp ??
            (() => DateTime.now().millisecondsSinceEpoch);

  final Ref ref;
  final int Function() _getCurrentTimestamp;
  final _characterCache = <String, Character>{};

  Future<MarvelListCharactersResponse> fetchCharacters({
    int? limit,
  }) async {
    final response = await _get(
      'characters',
      queryParameters: <String, Object?>{
        if (limit != null) 'limit': limit,
      },
    );
    final result = MarvelListCharactersResponse(
      characters: response.data.results.map((e) {
        return Character.fromJson(e);
      }).toList(),
      totalCount: response.data.total,
    );
    for (final character in result.characters) {
      _characterCache[character.id.toString()] = character;
    }

    return result;
  }

  Future<Character> fetchCharacter({
    required String id,
  }) async {
    // Don't fetch the Character if it was already obtained previously, either
    // in the home page or in the detail page.
    if (_characterCache.containsKey(id)) {
      return _characterCache[id]!;
    }

    final response = await _get('characters/$id');
    return Character.fromJson(response.data.results.single);
  }

  Future<MarvelResponse> _get(
    String path, {
    Map<String, Object?>? queryParameters,
  }) async {
    //marvel APIは3つのパラメータを渡す必要があります
    //apikey - publicKey
    //ts - タイムスタンプ（またはリクエストごとに変更可能なその他の長い文字列）。
    //hash - tsパラメータ、秘密鍵、公開鍵のmd5ダイジェスト（例：md5（ts+privateKey+publicKey））
    //例えば、公開鍵が「1234」、秘密鍵が「abcd」のユーザーは、次のように有効な通話を構築できます。
    //http://gateway.marvel.com/v1/public/comics?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150
    //（ハッシュ値は、1abcd1234のmd5ダイジェストです）
    final timestamp = _getCurrentTimestamp();
    final hash = md5
        .convert(
          utf8.encode('$timestamp$privateKey$publicKey'),
        )
        .toString();

    final result = await ref.read(dioProvider).get<Map<String, Object?>>(
      'https://gateway.marvel.com/v1/public/$path',
      queryParameters: <String, Object?>{
        'apikey': publicKey,
        'ts': timestamp,
        'hash': hash,
        ...?queryParameters,
      },
    );
    return MarvelResponse.fromJson(Map<String, Object>.from(result.data!));
  }
}

class MarvelListCharactersResponse {
  final int totalCount;
  final List<Character> characters;

  MarvelListCharactersResponse({
    required this.totalCount,
    required this.characters,
  });
}

// MarvelResponseクラスの定義
class MarvelResponse {
  final MarvelData data; // MarvelDataオブジェクト

  // MarvelResponseクラスのコンストラクタ
  MarvelResponse(this.data);

  // JSONからMarvelResponseオブジェクトを作成するためのファクトリメソッド
  factory MarvelResponse.fromJson(Map<String, Object?> json) {
    // JSONデータからdataを取得し、MapからMarvelDataオブジェクトを作成する
    final data = MarvelData.fromJson(
      Map<String, Object?>.from(json['data'] as Map<String, Object?>),
    );
    // MarvelResponseオブジェクトを作成して返す
    return MarvelResponse(data);
  }
}

class MarvelData {
  final List<Map<String, Object?>> results;
  final int total;

  MarvelData({
    required this.results,
    required this.total,
  });

  factory MarvelData.fromJson(Map<String, dynamic> json) {
    final List<Map<String, Object?>> results = (json['results'] as List)
        .map((result) => result as Map<String, Object?>)
        .toList();

    final int total = json['total'] as int;

    return MarvelData(
      results: results,
      total: total,
    );
  }
}

class Character {
  final int id;
  final String name;
  final Thumbnail thumbnail;

  // constructor
  Character({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  // JSONマップからCharacterオブジェクトを生成するためのファクトリーメソッド。
  factory Character.fromJson(Map<String, Object?> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      thumbnail: Thumbnail.fromJson(json['thumbnail'] as Map<String, Object?>),
    );
  }
}

class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });

  // 必須項目
  final String path;
  final String extension;

  // factoryコンストラクタ
  factory Thumbnail.fromJson(Map<String, Object?> json) {
    final path = json['path'] as String?;
    final extension = json['extension'] as String?;

    if (path == null || extension == null) {
      throw ArgumentError('path and extension are required');
    }

    return Thumbnail(path: path, extension: extension);
  }

  // url getter
  String get url => '${path.replaceFirst('http://', 'https://')}.$extension';
}
