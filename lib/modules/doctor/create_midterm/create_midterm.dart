import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_midterm/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/create_midterm/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/doctor_midterm_details.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateMidTermScreen extends StatelessWidget {
  final Respone group;
  const CreateMidTermScreen({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateMidTermCubit()..changeMidtermAllStudents(group.students!),
      child: BlocConsumer<CreateMidTermCubit, CreateMidTermStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CreateMidTermCubit cubit = CreateMidTermCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Create Midterm",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: group.students!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          group.students![index],
                          style: TextStyle(
                              color:
                              Theme.of(context).textTheme.bodyText1!.color),
                        ),
                        trailing: SizedBox(
                          width: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!))),
                            onChanged: (value) {
                              cubit.changeMidterm(index, value);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  cubit.isLoading
                      ? Center(
                    child: CircularProgressIndicator(
                      color: colorButton,
                    ),
                  )
                      : Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        cubit.addMidterm(group: group, context: context);
                      },
                      color: Colors.green[600],
                      height: 50.0,
                      child: const Text(
                        'Create Midterm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
