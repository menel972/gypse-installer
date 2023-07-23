import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gypse_installer/add/presentation/state/add_question_bloc.dart';
import 'package:gypse_installer/add/presentation/widgets/add_question_form.dart';
import 'package:gypse_installer/add/presentation/widgets/home_appbar.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(context),
      body: BlocProvider(
        create: (_) => AddQuestionBloc(),
        child: AddQuestionForm(),
      ),
    );
  }
}
