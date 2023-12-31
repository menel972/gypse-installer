enum Screen {
  add('/'),
  get('/get');

  final String path;
  const Screen(this.path);
}

enum Book {
  gen('Genèse', 'GEN'),
  ex('Exode', 'EXO'),
  lev('Lévitique', 'LEV'),
  nom('Nombres', 'NUM'),
  deut('Deutéronome', 'DEU'),
  jos('Josué', 'JOS'),
  jug('Juges', 'JDG'),
  ruth('Ruth', 'RUT'),
  sam1('1 Samuel', '1SA'),
  sam2('2 Samuel', '2SA'),
  roi1('1 Rois', '1KI'),
  roi2('2 Rois', '2KI'),
  chr1('1 Chroniques', '1CH'),
  chr2('2 Chroniques', '2CH'),
  esd('Esdras', 'EZR'),
  neh('Néhémie', 'NEH'),
  est('Esther', 'EST'),
  job('Job', 'JOB'),
  ps('Psaumes', 'PSA'),
  prov('Proverbes', 'PRO'),
  eccl('Ecclésiaste', 'ECC'),
  cant('Cantique', 'CAN'),
  es('Ésaïe', 'ISA'),
  jer('Jérémie', 'JER'),
  lam('Lamentations', 'LAM'),
  eze('Ézékiel', 'EZK'),
  dan('Daniel', 'DAN'),
  os('Osée', 'HOS'),
  joel('Joël', 'JOL'),
  am('Amos', 'AMO'),
  abd('Abdias', 'OBA'),
  jon('Jonas', 'JON'),
  mich('Michée', 'MIC'),
  nah('Nahum', 'NAM'),
  hab('Habacuc', 'HAB'),
  soph('Sophonie', 'ZEP'),
  ag('Aggée', 'HAG'),
  zach('Zacharie', 'ZEC'),
  mal('Malachie', 'MAL'),
  mat('Matthieu', 'MAT'),
  mc('Marc', 'MRK'),
  lc('Luc', 'LUK'),
  jn('Jean', 'JHN'),
  act('Actes', 'ACT'),
  rom('Romains', 'ROM'),
  cor1('1 Corinthiens', '1CO'),
  cor2('2 Corinthiens', '2CO'),
  gal('Galates', 'GAL'),
  eph('Éphésiens', 'EPH'),
  phi('Philippiens', 'PHP'),
  col('Colossiens', 'COL'),
  thes1('1 Thessaloniciens', '1TH'),
  thes2('2 Thessaloniciens', '2TH'),
  tim1('1 Timothée', '1TI'),
  tim2('2 Timothée', '2TI'),
  ti('Tite', 'TIT'),
  phile('Philémon', 'PHM'),
  heb('Hébreux', 'HEB'),
  jacq('Jacques', 'JAS'),
  pier1('1 Pierre', '1PE'),
  pier2('2 Pierre', '2PE'),
  jn1('1 Jean', '1JN'),
  jn2('2 Jean', '2JN'),
  jn3('3 Jean', '3JN'),
  jud('Jude', 'JUD'),
  ap('Apocalypse', 'REV');

  final String label;
  final String suffix;
  const Book(this.label, this.suffix);
}

/** LOGIN STATE */

///## Authentication state enumeration
///
///It represents the login state of a user.<br>
///Four possible states :<br>
///<li>uninitialized
///<li>loading
///<li>unauthenticated
///<li>authenticated
enum LoginState { uninitialized, loading, unauthenticated, authenticated }

/** LOCALES */

///## Supported languages enumeration
///
///It represents the available locales or languages.<br>
///Three possible locales :<br>
///<li>fr - français
///<li>en - english
///<li>es - español
enum Locales {
  fr('français'),
  en('English'),
  es('español');

  final String language;
  const Locales(this.language);
}

/** LEVEL */

///## Difficulty levels enumeration
///
///It represents the different difficulty levels and the associated number of proposition.<br>
///Three possible levels :<br>
///<li>easy - 2 propositions
///<li>medium - 3 propositions
///<li>hard - 4 propositions
enum Level {
  easy(1, 2),
  medium(2, 3),
  hard(3, 4);

  final int id;
  final int propositions;
  const Level(this.id, this.propositions);
}

/** TIME */

///## Time laps enumeration
///
///It represents the durations allocated to answer questions and the number of second associated.<br>
///Three possible levels :<br>
///<li>easy - 30 seconds
///<li>medium - 20 seconds
///<li>hard - 12 seconds
enum Time {
  easy(30),
  medium(20),
  hard(12);

  final int seconds;
  const Time(this.seconds);
}

/** BOOKS */

///## Bible's books enumeration
///
///It represents the list of bible's books and their relative names in three different languages : fr, en, es.<br>
///66 possible books :
///<li> gen - Genèse • Genesis • Génesis<br>
///...
///<li> ap - Apocalypse • Revelation • Apocalipsis
enum Books {
  gen('Genèse', en: 'Genesis', es: 'Génesis', enCode: '', esCode: ''),
  ex('Exode', en: 'Exodus', es: 'Éxodo'),
  lev('Lévitique', en: 'Leviticus', es: 'Levítico'),
  nom('Nombres', en: 'Numbers', es: 'Números'),
  deut('Deutéronome', en: 'Deteronomy', es: 'Deuteronomio'),
  jos('Josué', en: 'Joshua', es: 'Josué'),
  jug('Juges', en: 'Judges', es: 'Jueces'),
  ruth('Ruth', en: 'Ruth', es: 'Rut'),
  sam1('1 Samuel', frCode: '1 sam', en: '1 Samuel', es: '1 Samuel'),
  sam2('2 Samuel', frCode: '2 sam', en: '2 Samuel', es: '2 Samuel'),
  roi1('1 Rois', frCode: '1 roi', en: '1 Kings', es: '1 Reyes'),
  roi2('2 Rois', frCode: '2 roi', en: '2 Kings', es: '2 Reyes'),
  chr1('1 Chroniques', frCode: '1 chr', en: '1 Chronicles', es: '1 Crónicas'),
  chr2('2 Chroniques', frCode: '2 chr', en: '2 Chronicles', es: '2 Crónicas'),
  esd('Esdras', en: 'Ezra', es: 'Esdras'),
  neh('Néhémie', en: 'Nehemiah', es: 'Nehemías'),
  est('Esther', en: 'Esther', es: 'Ester'),
  job('Job', en: 'Job', es: 'Job'),
  ps('Psaumes', en: 'Psalms', es: 'Salmos'),
  prov('Proverbes', en: 'Proverbs', es: 'Proverbios'),
  eccl('Ecclésiaste', en: 'Ecclesiaste', es: 'Eclesiastés'),
  cant('Cantique', en: 'Song of Songs', es: 'Cantares'),
  esa('Ésaïe', frCode: 'es', en: 'Isaiah', es: 'Isaías'),
  jer('Jérémie', en: 'Jeremiah', es: 'Jeremías'),
  lam('Lamentations', en: 'Lamentations', es: 'Lamentaciones'),
  eze('Ézékiel', en: 'Ezekiel', es: 'Ezequiel'),
  dan('Daniel', en: 'Daniel', es: 'Daniel'),
  os('Osée', en: 'Hosea', es: 'Oseas'),
  joel('Joël', en: 'Joel', es: 'Joel'),
  am('Amos', en: 'Amos', es: 'Amós'),
  abd('Abdias', en: 'Obadiah', es: 'Abdías'),
  jon('Jonas', en: 'Jonah', es: 'Jonás'),
  mich('Michée', en: 'Micah', es: 'Miqueas'),
  nah('Nahum', en: 'Nahum', es: 'Nahúm'),
  hab('Habacuc', en: 'Habakkuk', es: 'Habacuc'),
  soph('Sophonie', en: 'Zephaniah', es: 'Sofonías'),
  ag('Aggée', en: 'Haggai', es: 'Hageo'),
  zach('Zacharie', en: 'Zechariah', es: 'Zacarías'),
  mal('Malachie', en: 'Malachi', es: 'Malaquías'),
  mat('Matthieu', en: 'Matthew', es: 'Mateo'),
  mc('Marc', en: 'Mark', es: 'Marcos'),
  lc('Luc', en: 'Luke', es: 'Lucas'),
  jn('Jean', en: 'John', es: 'Juan'),
  act('Actes', en: 'Acts', es: 'Hechos'),
  rom('Romains', en: 'Romans', es: 'Romanos'),
  cor1('1 Corinthiens',
      frCode: '1 cor', en: '1 Corinthians', es: '1 Corintios'),
  cor2('2 Corinthiens',
      frCode: '2 cor', en: '2 Corinthians', es: '2 Corintios'),
  gal('Galates', en: 'Galatians', es: 'Gálatas'),
  eph('Éphésiens', en: 'Ephésians', es: 'Efesios'),
  phi('Philippiens', en: 'Philippians', es: 'Filipenses'),
  col('Colossiens', en: 'Colossians', es: 'Colosenses'),
  thes1('1 Thessaloniciens',
      frCode: '1 thes', en: '1 Thessalonicians', es: '1 Tesalonicenses'),
  thes2('2 Thessaloniciens',
      frCode: '2 thes', en: '2 Thessalonicians', es: '2 Tesalonicenses'),
  tim1('1 Timothée', frCode: '1 tim', en: '1 Timothy', es: '1 Timoteo'),
  tim2('2 Timothée', frCode: '2 tim', en: '2 Timothy', es: '2 Timoteo'),
  ti('Tite', en: 'Titus', es: 'Tito'),
  phile('Philémon', en: 'Philemon', es: 'Filemón'),
  heb('Hébreux', en: 'Hebrews', es: 'Hebreos'),
  jacq('Jacques', en: 'James', es: 'Santiago'),
  pier1('1 Pierre', frCode: '1 pier', en: '1 Peter', es: '1 Pedro'),
  pier2('2 Pierre', frCode: '2 pier', en: '2 Peter', es: '2 Pedro'),
  jn1('1 Jean', frCode: '1 jn', en: '1 John', es: '1 Juan'),
  jn2('2 Jean', frCode: '2 jn', en: '2 John', es: '2 Juan'),
  jn3('3 Jean', frCode: '3 jn', en: '3 John', es: '3 Juan'),
  jud('Jude', en: 'Jude', es: 'Judas'),
  ap('Apocalypse', en: 'Revelation', es: 'Apocalipsis');

  final String fr;
  final String en;
  final String es;
  final String? frCode;
  final String? enCode;
  final String? esCode;

  const Books(
    this.fr, {
    required this.en,
    required this.es,
    this.frCode,
    this.enCode,
    this.esCode,
  });
}
