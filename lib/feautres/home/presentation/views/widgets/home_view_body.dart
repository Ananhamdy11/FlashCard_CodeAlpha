import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/presentation/manger/cubit/flash_cards_cubit.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/quiz_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashCardsCubit, FlashCardsState>(
      builder: (context, state) {
        if(state is FlashCardsLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else if (state is FlashCardsSuccess){
          return Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.flashCards.length,
                  itemBuilder: (context,index){
                    final flashcard=state.flashCards[index];
                  return ListTile(
                    title: Text(flashcard.question),
                    subtitle: Text(flashcard.options.join(',')),
                    trailing: IconButton(
                                onPressed: (){
                                 context.read<FlashCardsCubit>().deleteFlashcard(index);
                                 // print("Options: ${flashcard.options}");
                              },
                               icon:const Icon(Icons.delete)),
                  );
                  
                }),
                
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      context.read<FlashCardsCubit>().startQuiz();
                      return const QuizView();
                      }
                  
                  ));
                }, child:const Text('Start Quiz')),
              )
            ],
            
          ),
        );
        }else{
          return const Center(child: Text( "No FlashCards "));
        }
      },
    );
  }
}