import 'package:hive/hive.dart';
part 'flashcard_model.g.dart';
@HiveType(typeId: 0)
class FlashcardModel  extends HiveObject{

@HiveField(0)
final String question;

@HiveField(1)
final List<String> options;

@HiveField(2)
final String answer;

  FlashcardModel({required this.question, required this.options, required this.answer});

}