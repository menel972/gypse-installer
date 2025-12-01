import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gypse_installer/common/extensions.dart';
import 'package:gypse_installer/common/firebase_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WsDeleteRequests {
  final CollectionReference<Map<String, dynamic>> questionClient;

  WsDeleteRequests(this.questionClient);

  Future<void> deleteQuestion(String id) async {
    try {
      await questionClient.doc(id).delete();
    } on FirebaseException catch (e) {
      e.log(tag: 'DeleteQuestion');
      rethrow;
    }
  }

  static AutoDisposeProvider<WsDeleteRequests> wsDeleteRequestsProvider() =>
      Provider.autoDispose<WsDeleteRequests>(
          (AutoDisposeProviderRef<WsDeleteRequests> ref) => WsDeleteRequests(
                ref.read(FirebaseClients().questionsDbProvider),
              ));
}
