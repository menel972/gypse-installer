import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gypse_installer/questions/data/models/ws_question_response.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/common/firebase_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WsAddRequests {
  final CollectionReference<Map<String, dynamic>> questionClient;

  WsAddRequests(this.questionClient);

  Future<void> addQuestion(WsQuestionResponse question) async {
    try {
      DocumentReference<Map<String, dynamic>> doc = questionClient.doc();
      await questionClient.doc().set(question.toMap(doc.id));
    } on FirebaseException catch (e) {
      e.log(tag: 'AddQuestion');
      rethrow;
    }
  }

  static AutoDisposeProvider<WsAddRequests> wsAddRequestsProvider() =>
      Provider.autoDispose<WsAddRequests>(
          (AutoDisposeProviderRef<WsAddRequests> ref) => WsAddRequests(
                ref.read(FirebaseClients().questionsDbProvider),
              ));
}
