import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirebaseClients {
  final CollectionReference<Map<String, dynamic>> questionsDb =
      FirebaseFirestore.instance.collection('question');

  final CollectionReference<Map<String, dynamic>> answersDb =
      FirebaseFirestore.instance.collection('reponse');

  AutoDisposeProvider<CollectionReference<Map<String, dynamic>>>
      get questionsDbProvider =>
          Provider.autoDispose<CollectionReference<Map<String, dynamic>>>(
            (AutoDisposeProviderRef<CollectionReference> ref) =>
                FirebaseClients().questionsDb,
          );

  AutoDisposeProvider<CollectionReference<Map<String, dynamic>>>
      get answersDbProvider =>
          Provider.autoDispose<CollectionReference<Map<String, dynamic>>>(
            (AutoDisposeProviderRef<CollectionReference> ref) =>
                FirebaseClients().answersDb,
          );
}
