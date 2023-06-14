import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_example/features/chat/domain/message_entity.dart';
import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/extensions/date_time.dart';
import '../../user/query/user_query.dart';
import '../command/chat_command.dart';
import '../query/chat_query.dart';
import '../repo/refs/chat_refs.dart';

class ChatRoomScreen extends ConsumerStatefulWidget {
  const ChatRoomScreen({
    super.key,
    required this.userId,
  });
  final String userId;
  static const routeName = 'ChatRoom';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends ConsumerState<ChatRoomScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(chatAsyncNotifierCommand.notifier)
          .markAsReadEvent(receiverUserId: widget.userId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FirestoreQueryBuilder(
              pageSize: 30,
              query: messagesRef(
                      userId: authRef.currentUser!.uid,
                      chatRoomId: widget.userId)
                  .orderBy('createdAt', descending: true),
              builder: (context, snapshot, _) {
                if (snapshot.isFetching) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    // 最後から５個前に行くとデータを取得し直す。
                    final isLastItem = index + 5 == snapshot.docs.length;
                    if (isLastItem && snapshot.hasMore) snapshot.fetchMore();
                    final messages = snapshot.docs;
                    final message = messages[index].data();

                    bool isMyMessage =
                        message.senderId == authRef.currentUser!.uid;
                    return _MessageItem(
                      message: message,
                      isMyMessage: isMyMessage,
                      showDate: _showDate(
                        itemCount: messages.length,
                        index: index,
                        messages: messages,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _RoomMessageInput(userId: widget.userId),
          Container(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }
}

/// 日付を表示するかどうか
bool _showDate({
  required int itemCount,
  required int index,
  required List<QueryDocumentSnapshot<MessageEntity>> messages,
}) {
  if (itemCount == 1) {
    return true;
  }
  if (index == itemCount - 1) {
    return true;
  }
  final lastCreatedAt = messages[index].data().createdAt.dateTime;
  final previouslyCreatedAt = messages[index + 1].data().createdAt.dateTime;
  if (lastCreatedAt == null || previouslyCreatedAt == null) {
    return false;
  }
  if (sameDay(lastCreatedAt, previouslyCreatedAt)) {
    return false;
  }
  return true;
}

class _RoomMessageInput extends ConsumerWidget {
  const _RoomMessageInput({
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = ref.watch(messageInputControllerProvider);
    final textController = userController.getController(userId);
    final chatCommand = ref.read(chatAsyncNotifierCommand.notifier);
    final chatCount = ref.watch(
        chatRoomProvider(userId).select((value) => value.value?.messageCount));
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.image),
          onPressed: () {},
        ),
        Expanded(
          child: TextFormField(
            controller: textController,
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            if (textController.text != '') {
              chatCommand.sendEvent(
                content: textController.text.trim(),
                receiverId: userId,
                messageCount: chatCount,
              );
              textController.clear();
            }
          },
        ),
      ],
    );
  }
}

/// メッセージ、日付、相手のアイコン、送信日時のウィジェット
class _MessageItem extends ConsumerWidget {
  const _MessageItem({
    required this.message,
    required this.showDate,
    required this.isMyMessage,
  });

  final MessageEntity message;
  final bool showDate;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment:
          isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (showDate && message.createdAt.dateTime != null)
          _DateOnChatRoom(message.createdAt.dateTime!),
        Row(
          mainAxisAlignment:
              isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMyMessage) ...[
              const Icon(Icons.person),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMyMessage) ...[
                  _SenderName(message.senderId),
                ],
                _MessageContentWidget(
                  message: message,
                  isMyMessage: isMyMessage,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// メッセージの送り主（相手）の名前を表示するウィジェット。
class _SenderName extends ConsumerWidget {
  const _SenderName(this.senderId);

  final String senderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appUserProvider(senderId)).when(
          data: (appUser) =>
              appUser == null ? const SizedBox() : Text(appUser.name),
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const SizedBox(),
        );
  }
}

/// メッセージの本文を表示するウィジェット。
class _MessageContentWidget extends ConsumerWidget {
  const _MessageContentWidget({
    required this.message,
    required this.isMyMessage,
  });

  final MessageEntity message;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: (MediaQuery.of(context).size.width - 24 - 8 * 3) * 0.9,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(8),
          topRight: const Radius.circular(8),
          bottomLeft: Radius.circular(isMyMessage ? 8 : 0),
          bottomRight: Radius.circular(isMyMessage ? 0 : 8),
        ),
        color: isMyMessage ? Colors.red : Colors.green,
      ),
      child: findUrl(message.content)
          ? TextButton(
              child: Text(
                message.content,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                final url = Uri.parse(extractUrls(message.content));
                launchUrl(url);
              },
            )
          : Text(
              message.content,
              style: isMyMessage
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white)
                  : Theme.of(context).textTheme.bodySmall,
            ),
    );
  }
}

/// チャットメッセージの日付
class _DateOnChatRoom extends StatelessWidget {
  const _DateOnChatRoom(this.dateTime);

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            humanReadableDateTimeString(dateTime),
          ),
        ),
      ),
    );
  }
}

final messageInputControllerProvider =
    Provider<MessageInputController>((ref) => MessageInputController());

// メッセージ入力欄にユーザごとの値をキャッシュしておく。
class MessageInputController {
  Map<String, TextEditingController> controllerMap = {};

  // uidをキーとしてTextEditingControllerを取得する関数
  TextEditingController getController(String uid) {
    // 既に該当のuidに対応するTextEditingControllerが存在する場合
    if (controllerMap.containsKey(uid)) {
      // 既存のコントローラを返す
      return controllerMap[uid]!;
    }
    // uidに対応するTextEditingControllerが存在しない場合
    else {
      // 新しいTextEditingControllerを生成
      var controller = TextEditingController();
      // uidをキーとして新しく生成したコントローラをマップに保存
      controllerMap[uid] = controller;
      // 新しく生成したコントローラを返す
      return controller;
    }
  }
}

// String splittingMessage(String message) {
//   final RegExp urlRegExp = RegExp(
//       r'((https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-zA-Z0-9()]{2,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?');
//   final Iterable<RegExpMatch> urlMatches = urlRegExp.allMatches(message);

//   final List<String> splittingMessage = <String>[];
//   int lastIndex = 0;

//   for (RegExpMatch urlMatch in urlMatches) {
//     final String url = message.substring(urlMatch.start, urlMatch.end);
//     final String precedingText =
//         message.substring(lastIndex, urlMatch.start).trim();

//     if (precedingText.isNotEmpty) {
//       splittingMessage.add(precedingText);
//     }
//     splittingMessage.add(url);
//     lastIndex = urlMatch.end;
//   }

//   final String remainingText = message.substring(lastIndex).trim();
//   if (remainingText.isNotEmpty) {
//     splittingMessage.add(remainingText);
//   }

//   return splittingMessage.join('\n');
// }

bool findUrl(String message) {
  final RegExp urlRegExp = RegExp(
      r'((https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-zA-Z0-9()]{2,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?');

  // 正規表現に一致するものがメッセージ内に存在するかどうかを返す
  return urlRegExp.hasMatch(message);
}

String extractUrls(String message) {
  final RegExp urlRegExp = RegExp(
      r'((https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-zA-Z0-9()]{2,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?');

  final Iterable<RegExpMatch> urlMatches = urlRegExp.allMatches(message);

  // URLを抽出し、それらをリストに変換します。
  List<String> urls = urlMatches
      .map((urlMatch) => message.substring(urlMatch.start, urlMatch.end))
      .toList();

  // URLリストを改行で区切った一つの文字列に変換して返す
  return urls.join('\n');
}
