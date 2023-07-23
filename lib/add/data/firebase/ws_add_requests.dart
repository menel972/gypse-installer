import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gypse_installer/add/data/models/ws_answer.dart';
import 'package:gypse_installer/add/data/models/ws_question.dart';
import 'package:gypse_installer/common/firebase_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WsAddRequests {
  final CollectionReference<Map<String, dynamic>> questionClient;
  final CollectionReference<Map<String, dynamic>> answersClient;

  WsAddRequests({required this.questionClient, required this.answersClient});

  Future<String> addQuestion(WsQuestion question) async =>
      await _addContent(true, question.toMap());

  Future<String> addAnswer(WsAnswer answer) async =>
      await _addContent(false, answer.toMap());

  Future<String> _addContent(
      bool isQuestion, Map<String, dynamic> content) async {
    try {
      if (isQuestion) {
        final DocumentReference<Map<String, dynamic>> doc =
            questionClient.doc();
        content['id'] = doc.id;

        await doc.set(content);

        return doc.id;
      } else {
        final DocumentReference<Map<String, dynamic>> doc = answersClient.doc();
        content['id'] = doc.id;

        await doc.set(content);

        return doc.id;
      }
    } on FirebaseException catch (e) {
      isQuestion
          ? throw Exception('[FIREBASE] - Question : ${e.code} | ${e.message}')
          : throw Exception('[FIREBASE] - Answer : ${e.code} | ${e.message}');
    }
  }

  static AutoDisposeProvider<WsAddRequests> wsAddRequestsProvider() =>
      Provider.autoDispose<WsAddRequests>(
        (AutoDisposeProviderRef<WsAddRequests> ref) => WsAddRequests(
            questionClient: ref.read(FirebaseClients().questionsDbProvider),
            answersClient: ref.read(FirebaseClients().answersDbProvider)),
      );
}
