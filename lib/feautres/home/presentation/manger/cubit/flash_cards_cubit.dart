import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/feautres/home/data/flashcard_model.dart';
import 'package:hive/hive.dart';

part 'flash_cards_state.dart';

class FlashCardsCubit extends Cubit<FlashCardsState> {
  final Box<FlashcardModel> box;

  FlashCardsCubit(this.box) : super(FlashCardsInitial()){
    loadFlashCards();
  }


void loadFlashCards(){
emit(FlashCardsLoading());
final flashcards = box.values.toList().cast<FlashcardModel>();
if(flashcards.isNotEmpty){
  emit(FlashCardsSuccess(flashcards));
}else{
  emit(FlashCardsFailure('No FlashCards '));
}
}

void addFlashCards(FlashcardModel flashcard) {
    try {
      box.add(flashcard);
      loadFlashCards(); // تحديث القائمة بعد الإضافة
    } catch (e) {
      emit(FlashCardsFailure('Failed to add flashcard'));
    }
  }

  void deleteFlashcard(int index) async {
    try {
      await box.deleteAt(index);
      loadFlashCards();
    } catch (e) {
      emit(FlashCardsFailure('Failed to delete flashcard'));
    }
  }

   void startQuiz() {
    if (box.isNotEmpty) {
      emit(FlashCardQuiz(box.values.toList(), 0, 0));
    } else {
      emit(FlashCardsInitial());
    }
  }

  void answerQuestion(String answer) {
    final currentState = state;
    if (currentState is FlashCardQuiz) {
      final isCorrect = currentState.flashcards[currentState.currentIndex].answer == answer;
      final newScore = currentState.score + (isCorrect ? 1 : 0);
      final nextIndex = currentState.currentIndex + 1;

      if (nextIndex < currentState.flashcards.length) {
        emit(FlashCardQuiz(currentState.flashcards, nextIndex, newScore));
      } else {
        emit(FlashCardCompleted(newScore));
      }
    }

  }
   void resetQuiz() {
    loadFlashCards();
  }

}
