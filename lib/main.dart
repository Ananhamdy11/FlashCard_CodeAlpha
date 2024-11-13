import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/data/flashcard_model.dart';
import 'package:flutter_application_1/feautres/home/presentation/manger/cubit/flash_cards_cubit.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(FlashcardModelAdapter());
  final boxFlashCard = await Hive.openBox<FlashcardModel>('flashCards');
  runApp( MyApp(box:boxFlashCard,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.box});
final Box<FlashcardModel> box;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlashCardsCubit(box),
      child:const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: HomeView()
        ),
    );
  }
}

