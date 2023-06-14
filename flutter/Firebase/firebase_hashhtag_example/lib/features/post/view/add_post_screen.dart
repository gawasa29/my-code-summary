import 'package:detectable_text_field/detector/detector.dart';
import 'package:detectable_text_field/detector/sample_regular_expressions.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:firebase_hashhtag_example/features/post/command/post_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddPostScreen extends ConsumerWidget {
  const AddPostScreen({super.key});
  static const routeName = 'AddPost';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final postCommand = ref.read(postAsyncNotifierCommand.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.send,
            ),
            onPressed: () {
              final detections =
                  extractDetections(controller.text, hashTagRegExp);
              final hashtag = detections.isNotEmpty ? detections.first : '';

              postCommand.createPostEvent(
                content: controller.text,
                hashtag: hashtag,
              );
              context.pop();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Text('userPhoto'),
            title: Text('user.name'),
          ),
          DetectableTextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'ここに投稿',
              hintStyle: TextStyle(fontSize: 15),
            ),
            maxLength: 144,
            detectionRegExp: hashTagRegExp,
            onDetectionTyped: print,
            onDetectionFinished: () {
              print('finished');
            },
          ),
        ],
      ),
    );
  }
}

/// Extract detections from the text
List<String> extractDetections(String value, RegExp detectionRegExp) {
  const decoratedTextColor = Colors.blue;
  final decorator = Detector(
    textStyle: const TextStyle(),
    detectedStyle: const TextStyle(color: decoratedTextColor),
    detectionRegExp: detectionRegExp,
  );
  final decorations = decorator.getDetections(value);
  final taggedDecorations = decorations
      .where((decoration) => decoration.style!.color == decoratedTextColor)
      .toList();
  final result = taggedDecorations.map((decoration) {
    final text = decoration.range.textInside(value);
    return text.trim();
  }).toList();
  return result;
}
