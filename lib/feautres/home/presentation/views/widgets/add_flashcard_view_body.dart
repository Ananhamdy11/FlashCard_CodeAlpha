import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/data/flashcard_model.dart';
import 'package:flutter_application_1/feautres/home/presentation/manger/cubit/flash_cards_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddflashcardViewBody extends StatefulWidget {
  const AddflashcardViewBody({super.key});

  @override
  State<AddflashcardViewBody> createState() => _AddflashcardViewBodyState();
}

class _AddflashcardViewBodyState extends State<AddflashcardViewBody> {
  final questionController = TextEditingController();

  final optionControllers = List.generate(4, (_) => TextEditingController());

  String? correctAnswer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: questionController,
             decoration: const InputDecoration(labelText: 'Question')
          ),
          ...List.generate(optionControllers.length, (index){
            return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Radio<String>(
                    value: optionControllers[index].text, 
                    groupValue: correctAnswer,
                     onChanged: (value){
                      setState(() {
                        correctAnswer=value;
                      });
                     }
                ),
                Expanded(
                        child: TextField(
                          controller: optionControllers[index],
                          decoration: InputDecoration(labelText: "Option ${index + 1}"),
                          onChanged: (text) {
                          if (correctAnswer == optionControllers[index].text) {
                            setState(() {
                              correctAnswer = text;
                            });
                          }
                        },
                      ),
      
                        
                      ),
                ]));
      
      
          }),
           const SizedBox(height: 50,),
        ElevatedButton(
          onPressed: (){
            final flashcard=FlashcardModel(
              question: questionController.text,
               options: optionControllers.map((controller) => controller.text).toList(),
                answer: correctAnswer??''
              );
            context.read<FlashCardsCubit>().addFlashCards(flashcard);
            Navigator.pop(context);
      
          },
           child: Text('Add FlashCard ')
        )
        ],
      ),
    );
  }
}