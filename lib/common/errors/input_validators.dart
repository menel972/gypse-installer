import 'package:gypse_installer/common/enums.dart';

String? isEmpty(String value) {
  if (value.isEmpty) return 'Ce champs est requis.';
  return null;
}

String? charLimit(String value, int limit) {
  if (value.length > limit) return 'Max $limit caractères.';
  return null;
}

String? isBook(String value) {
  if (!Book.values.map((book) => book.label).contains(value)) {
    return '$value n\'est pas un livre.';
  }
  return null;
}

String? isUrl(String value) {
  if (!value.startsWith('https://')) {
    return 'Mauvais lien.';
  }
  return null;
}
