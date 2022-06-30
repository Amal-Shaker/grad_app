import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grad_app/helper/auth_helper.dart';
import 'package:grad_app/model/register_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  addToFirestore(RegisterRequest registerRequest) async {
    //firebaseFirestore.collection('Users').add(registerRequest.toMap());
    await firebaseFirestore
        .collection('Users')
        .doc(registerRequest.sid)
        .set(registerRequest.toMap());
  }

  addMessageChatRoom(Map map, String twoId, String from) async {
    firebaseFirestore
        .collection('Chat')
        .doc(twoId)
        .collection('chatRoom')
        .add({...map, 'From': from});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirestoreStreamChatRoom(
      String twoId) {
    return firebaseFirestore
        .collection('Chat')
        .doc(twoId)
        .collection('chatRoom')
        .snapshots();
  }

  List idDoc = [];
  getAllDocumentInChatFirestore() async {}

  getAllChatDoc() async {
    // final listOfDoc = await firebaseFirestore
    //     .collection('Chat')
    //     .doc('14054321')
    //     .collection('chatRoom')
    //     .get();
    // print(listOfDoc.size);
    // print(listOfDoc.docs);
    // print('last section last section last section last section last section');
    // final listOf = await firebaseFirestore.collection('Chat').get();
    // print(listOf.size);
    // print(listOf.docs);
    QuerySnapshot<Map<String, dynamic>> chatCol =
        await FirebaseFirestore.instance.collection("Chat").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> chatDocs = chatCol.docs;
    print('chatDocschatDocs${chatDocs.length}');
    // List ss = listOfDoc.docs.map((doc) => doc.data()).toList();
    // print("ss${ss}");
    //listOfDoc.docs.map((doc) => doc.data());
    // print('4444444');
    // print(listOfDoc.id);
    // print(listOfDoc.doc().get().);
    //listOfDoc.docs.map((e) => print(e.id)).toList();
    // {
    //   Map map = e.data();
    //   map['id'] = e.id;
    //   CountryModel.fromJson(map);
    // }

    // List<CountryModel> cou = countries;
    // print(cou.first.name);
    // print(countries.length);
    // print(countries.first.cities);

    //return listOfDoc.docs.map((doc) => doc.data());
  }
}
