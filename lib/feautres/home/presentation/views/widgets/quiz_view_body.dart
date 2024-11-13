import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/presentation/manger/cubit/flash_cards_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashCardsCubit, FlashCardsState>(
      builder: (context, state) {
         if(state is FlashCardQuiz){
          final flashcard = state.flashcards[state.currentIndex];
        return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Q${state.currentIndex + 1}: ${flashcard.question}"),
          const SizedBox(height: 20),
          ...flashcard.options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<FlashCardsCubit>().answerQuestion(option);
                      },
                      child: Text(option),
                    ),
                  );
                }).toList(),
          const SizedBox(height: 20),
                Text(
                  "Question ${state.currentIndex + 1} of ${state.flashcards.length}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

        ],
      ),
    );

         }else if (state is FlashCardCompleted){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your Score", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("${state.score}", style: TextStyle(fontSize: 32, color: Colors.blue)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<FlashCardsCubit>().resetQuiz();
                    Navigator.pop(context);
                  },
                  child: const Text("Back to Home"),
                ),
              ],
            ),
          );
         }else{
          return Center(child: const CircularProgressIndicator());
         }
      },
    );

  }
}