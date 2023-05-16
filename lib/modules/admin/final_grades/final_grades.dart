import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/create_final_grade/create_final_grade.dart';
import 'package:graduation_project_app/modules/admin/final_grades/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/final_grades/cubit/states.dart';

class FinalGradesScreen extends StatelessWidget {
  const FinalGradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FinalGradesCubit(),
      child: BlocConsumer<FinalGradesCubit, FinalGradesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            FinalGradesCubit cubit = FinalGradesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Final Grades",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "Abdallah Salama Abdallah",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 18.0,
                          ),
                        ),
                        subtitle: Text(
                          "1827060",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 14.0,
                          ),
                        ),
                        trailing: Text(
                          "60 / 60",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateFinalGradeScreen()),
                          );
                        },
                      );
                    }),
              ),
            );
          }),
    );
  }
}
