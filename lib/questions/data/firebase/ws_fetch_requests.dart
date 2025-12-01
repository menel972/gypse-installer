import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gypse_installer/questions/data/models/ws_question_response.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/common/firebase_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WsFetchRequests {
  final CollectionReference<Map<String, dynamic>> questionClient;

  WsFetchRequests(this.questionClient);

  Future<List<WsQuestionResponse>> fetchQuestionsByBook(String book) async {
    try {
      return await questionClient.where('fr.book', isEqualTo: book).get().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
              .map((QueryDocumentSnapshot<Map<String, dynamic>> changes) =>
                  WsQuestionResponse.fromMap(changes.data()))
              .toList());
    } on FirebaseException catch (e) {
      e.log(tag: 'FetchQuestionsByBook');
      rethrow;
    }
  }

  Future<List<WsQuestionResponse>> fetchQuestionsByText(String question) async {
    try {
      return await questionClient
          .where('fr.question', isEqualTo: question)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
              .map((QueryDocumentSnapshot<Map<String, dynamic>> changes) =>
                  WsQuestionResponse.fromMap(changes.data()))
              .toList());
    } on FirebaseException catch (e) {
      e.log(tag: 'FetchQuestionsByText');
      rethrow;
    }
  }

  static AutoDisposeProvider<WsFetchRequests> wsFetchRequestsProvider() =>
      Provider.autoDispose<WsFetchRequests>(
          (AutoDisposeProviderRef<WsFetchRequests> ref) => WsFetchRequests(
                ref.read(FirebaseClients().questionsDbProvider),
              ));
}
