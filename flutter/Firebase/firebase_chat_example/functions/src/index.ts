// Firebase Admin SDKをインポート
import * as admin from 'firebase-admin';
// Firebase Cloud Functions SDKをインポート
import * as functions from 'firebase-functions';

// Firebaseアプリを初期化
admin.initializeApp();
// Firestoreデータベースへの参照を作成
export const firestore = admin.firestore();

// プッシュ通知を送信する関数
const sendPushNotification = async (token: string, title: string, body: string, badge: string): Promise<void> => {
    console.log('🐯 プッシュ通知の送信を開始');

    // 通知の内容を定義
    const payload = {
        notification: {
            title,
            body,
            badge,
            sound: "default"
        }
    };

    // 通知のオプションを定義
    const option = {
        priority: "high"
    };

    // メッセージングサービスを利用して通知を送信
    try {
        await admin.messaging().sendToDevice(token, payload, option);
        console.log("🐯 新しいメッセージが送信完了。");
    } catch (error) {
        console.log("🐯 通知の送信に失敗しました：", error);
    }
}

// Firestoreに新しいユーザーメッセージが作成されたときの処理
export const createMessage = functions.firestore.document('users/{userId}/chatRooms/{chatRoomId}/messages/{messageId}')
    .onCreate(async (snapshot, context) => {
        console.log('🐯 新しいメッセージ作成の処理を開始');
        // 新しく作成されたメッセージのデータを取得
        const message = snapshot.data();

        if (!message) {
            console.log('🐯 メッセージのデータが見つかりませんでした。');
            return;
        }
        // イベントのコンテキストからユーザーIDを取得
        const { userId } = context.params;
        // 受信者が送信者と同じ場合は何もしない
        if (userId === message["senderId"]) {
            console.log("🐯 送信者と受信者が同一です。処理をスキップします。");
            return;
        }
        // メッセージ受信者のFirestoreドキュメントの参照を作成
        const receiverRef = firestore.collection("users").doc(message["receiverId"]);
        // メッセージ送信者のFirestoreドキュメントの参照を作成
        const senderRef = firestore.collection("users").doc(message["senderId"]);

        const senderDoc = await senderRef.get();
        const receiverDoc = await receiverRef.get();

        if (!senderDoc.exists || !receiverDoc.exists) {
            console.log("🐯 ドキュメントが存在しません。");
            return;
        }

        const sender = senderDoc.data();
        const receiver = receiverDoc.data();

        if (!sender || !receiver) {
            console.log("🐯 送信者または受信者のデータが見つかりませんでした。");
            return;
        }

        // 受信者のFCMトークンを取得
        const fcmToken = receiver["fcmToken"];
        const name = sender["name"];
        const content = message["content"];

        // 通知のタイトルと内容を定義
        const title = `${name}`;
        const body = `${content}`;

        // プッシュ通知を送信
        await sendPushNotification(fcmToken, title, body, "1");

    });