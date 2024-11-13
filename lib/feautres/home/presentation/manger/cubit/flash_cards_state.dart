part of 'flash_cards_cubit.dart';

sealed class FlashCardsState {}

 class FlashCardsInitial extends FlashCardsState {}
class FlashCardsLoading extends FlashCardsState {}
class FlashCardsSuccess extends FlashCardsState {

final List<FlashcardModel> flashCards;
  FlashCardsSuccess(this.flashCards);
}
class FlashCardsFailure extends FlashCardsState {
  final String message;

  FlashCardsFailure(this.message);
}

class FlashCardQuiz extends FlashCardsState {
  final List<FlashcardModel> flashcards;
  final int currentIndex;
  final int score;

  FlashCardQuiz(this.flashcards, this.currentIndex, this.score);
}

class FlashCardCompleted extends FlashCardsState {
  final int score;

  FlashCardCompleted(this.score);
}
