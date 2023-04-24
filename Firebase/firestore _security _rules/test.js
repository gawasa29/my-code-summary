const fs = require("fs");
const firebase = require("@firebase/testing");

const MY_PROJECT_ID = "1057000074229";
const myId = "user_abc";
const theirId = "user_xyz";
const myAuth = { uid: myId, email: "abc@gmail.com" };

before(async () => {
    await firebase.loadFirestoreRules({
        projectId: MY_PROJECT_ID,
        rules: fs.readFileSync("./firestore.rules", "utf-8"),
    });
});

after(async () => {
    await firebase.clearFirestoreData({ projectId: MY_PROJECT_ID });
});

describe("User collection rules", () => {
    function getFirestore(auth) {
        return firebase.initializeTestApp({ projectId: MY_PROJECT_ID, auth: auth }).firestore();
    }

    function getAdminFirestore() {
        return firebase.initializeAdminApp({ projectId: MY_PROJECT_ID }).firestore();
    }

    const validUserData = {
        name: "John",
        userId: "user_abc",
        bio: "Hi, I am John.",
        profilePic: "https://example.com/john.jpg",
        followerNum: 0,
        followingNum: 0,
        createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    };
    //認証されたユーザーは、任意のユーザードキュメントを読むことができます
    it("Authenticated user can read any user document", async () => {
        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(theirId);
        await firebase.assertSucceeds(testDoc.get());
    });
    //認証されていないユーザーはユーザードキュメントを読むことができない
    it("Unauthenticated user cannot read user documents", async () => {
        const db = getFirestore(null);
        const testDoc = db.collection("users").doc(myId);
        await firebase.assertFails(testDoc.get());
    });
    //認証されたユーザーは、自分のIDで有効なユーザードキュメントを作成できる
    it("Authenticated user can create a valid user document with their own ID", async () => {
        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(myId);
        await firebase.assertSucceeds(testDoc.set(validUserData));
    });
    //認証されたユーザーが、異なるIDのユーザー文書を作成することはできない
    it("Authenticated user cannot create a user document with a different ID", async () => {
        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(theirId);
        await firebase.assertFails(testDoc.set(validUserData));
    });
    //認証されたユーザーは、名前と経歴のフィールドを更新することができます。
    it("Authenticated user can update their name and bio fields", async () => {
        const admin = getAdminFirestore();
        const setupDoc = admin.collection("users").doc(myId);
        await setupDoc.set(validUserData);

        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(myId);
        await firebase.assertSucceeds(testDoc.update({ name: "Jane", bio: "Hi, I am Jane." }));
    });
    //認証されたユーザーは他のフィールドを更新できない
    it("Authenticated user cannot update other fields", async () => {
        const admin = getAdminFirestore();
        const setupDoc = admin.collection("users").doc(myId);
        await setupDoc.set(validUserData);

        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(myId);
        await firebase.assertFails(testDoc.update({ followerNum: 1 }));
    });
    //認証されたユーザーは、自分のユーザードキュメントを削除することができます。
    it("Authenticated user can delete their user document", async () => {
        const admin = getAdminFirestore();
        const setupDoc = admin.collection("users").doc(myId);
        await setupDoc.set(validUserData);

        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(myId);
        await firebase.assertSucceeds(testDoc.delete());
    });
    //認証されたユーザーは、他のユーザーのドキュメントを削除できない
    it("Authenticated user cannot delete another user's document", async () => {
        const admin = getAdminFirestore();
        const setupDoc = admin.collection("users").doc(theirId);
        await setupDoc.set(validUserData);

        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(theirId);
        await firebase.assertFails(testDoc.delete());
    });
});

describe("PrivateInfo collection rules", () => {
    function getFirestore(auth) {
        return firebase.initializeTestApp({ projectId: MY_PROJECT_ID, auth: auth }).firestore();
    }
    function getAdminFirestore() {
        return firebase.initializeAdminApp({ projectId: MY_PROJECT_ID }).firestore();
    }

    const privateInfoData = {
        email: "abc@gmail.com",
        phone: "123-456-7890",
    };
    //認証されたユーザーは、自分のprivateInfoドキュメントを作成することができます。
    it("Authenticated user can create their privateInfo document", async () => {
        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(myId).collection("privateInfo").doc();
        await firebase.assertSucceeds(testDoc.set(privateInfoData));
    });
    //認証されたユーザーは、他のユーザーのprivateInfoドキュメントを作成することはできません。
    it("Authenticated user cannot create another user's privateInfo document", async () => {
        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(theirId).collection("privateInfo").doc();
        await firebase.assertFails(testDoc.set(privateInfoData));
    });
    //認証されたユーザは、自分のprivateInfoドキュメントを削除することができます。
    it("Authenticated user can delete their privateInfo document", async () => {
        const admin = getAdminFirestore();
        const setupDoc = admin.collection("users").doc(myId).collection("privateInfo").doc();
        await setupDoc.set(privateInfoData);

        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(myId).collection("privateInfo").doc(setupDoc.id);
        await firebase.assertSucceeds(testDoc.delete());
    });
    //認証されたユーザーは、他のユーザーのprivateInfoドキュメントを削除できない
    it("Authenticated user cannot delete another user's privateInfo document", async () => {
        const admin = getAdminFirestore();
        const setupDoc = admin.collection("users").doc(theirId).collection("privateInfo").doc();
        await setupDoc.set(privateInfoData);

        const db = getFirestore(myAuth);
        const testDoc = db.collection("users").doc(theirId).collection("privateInfo").doc(setupDoc.id);
        await firebase.assertFails(testDoc.delete());
    });
});