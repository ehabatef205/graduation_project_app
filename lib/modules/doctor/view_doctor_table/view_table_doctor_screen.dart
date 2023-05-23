import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/view_doctor_table/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/view_doctor_table/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';

class ViewDoctorTableScreen extends StatelessWidget {
  const ViewDoctorTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color? color1 = Theme.of(context).textTheme.bodyText1!.color;
    Color? color2 = Theme.of(context).textTheme.bodyText2!.color;
    Color? color3 = Theme.of(context).textTheme.headline1!.color;
    Color? color4 = Theme.of(context).textTheme.headline2!.color;
    Color? color5 = Theme.of(context).textTheme.headline3!.color;
    Color? color6 = Theme.of(context).textTheme.headline4!.color;
    Color? color7 = Theme.of(context).textTheme.headline5!.color;
    Color? color8 = Theme.of(context).textTheme.headline6!.color;
    List<Color> colors = [
      color2!,
      color3!,
      color4!,
      color5!,
      color6!,
      color7!,
      color8!
    ];
    Color? coloWhite = Colors.white;
    return BlocProvider(
      create: (BuildContext context) => ViewDoctorTableCubit()..getGroups(),
      child: BlocConsumer<ViewDoctorTableCubit, ViewDoctorTableStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewDoctorTableCubit cubit = ViewDoctorTableCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              title: Text(
                "My Courses",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              centerTitle: true,
            ),
            body: cubit.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: colorButton,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: SizedBox(
                            height: 1000,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.5, color: color1!)),
                                      child: Text(
                                        "Date/Time",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: color1),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(
                                              width: 0.5, color: color1),
                                          end: BorderSide(
                                              width: 0.5, color: color1),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[0],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(
                                              width: 0.5, color: color1),
                                          end: BorderSide(
                                              width: 0.5, color: color1),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[1],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: color1),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(
                                              width: 0.5, color: color1),
                                          end: BorderSide(
                                              width: 0.5, color: color1),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[2],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(
                                              width: 0.5, color: color1),
                                          end: BorderSide(
                                              width: 0.5, color: color1),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[3],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(
                                              width: 0.5, color: color1),
                                          end: BorderSide(
                                              width: 0.5, color: color1),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[4],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(
                                              width: 0.5, color: color1),
                                          end: BorderSide(
                                              width: 0.5, color: color1),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[5],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(
                                              width: 0.5, color: color1),
                                          end: BorderSide(
                                              width: 0.5, color: color1),
                                          bottom: BorderSide(
                                              width: 0.5, color: color1),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[6],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: cubit.days.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 120,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: BorderDirectional(
                                                top: BorderSide(
                                                    width: 0.5, color: color1),
                                                start: BorderSide(
                                                    width: 0.5, color: color1),
                                                end: BorderSide(
                                                    width: 0.5, color: color1),
                                                bottom: BorderSide(
                                                    width: 0.5, color: color1),
                                              )),
                                              child: Text(
                                                cubit.days[index],
                                                style: TextStyle(
                                                  color: color1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 900,
                                              width: 120,
                                              child: ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount:
                                                      cubit.list[index].length,
                                                  itemBuilder:
                                                      (context, index2) {
                                                    if (cubit.list[index]
                                                            [index2] ==
                                                        "") {
                                                      if (index2 ==
                                                          cubit.list[index]
                                                                  .length -
                                                              1) {
                                                        return Container(
                                                          height: 120,
                                                          width: 120,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border:
                                                                      BorderDirectional(
                                                            start: BorderSide(
                                                                width: 0.5,
                                                                color: color1),
                                                            end: BorderSide(
                                                                width: 0.5,
                                                                color: color1),
                                                            bottom: BorderSide(
                                                                width: 0.5,
                                                                color: color1),
                                                          )),
                                                        );
                                                      } else {
                                                        return Container(
                                                          height: 120,
                                                          width: 120,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border:
                                                                      BorderDirectional(
                                                            start: BorderSide(
                                                                width: 0.5,
                                                                color: color1),
                                                            end: BorderSide(
                                                                width: 0.5,
                                                                color: color1),
                                                          )),
                                                        );
                                                      }
                                                    } else {
                                                      if (index2 ==
                                                          cubit.list[index]
                                                                  .length -
                                                              1) {
                                                        return buildContainerData(
                                                            text: cubit
                                                                    .list[index]
                                                                [index2],
                                                            color:
                                                                colors[index2],
                                                            color1: color1,
                                                            color2: coloWhite,
                                                            end: -1);
                                                      } else {
                                                        return buildContainerData(
                                                            text: cubit
                                                                    .list[index]
                                                                [index2],
                                                            color:
                                                                colors[index2],
                                                            color1: color1,
                                                            color2: coloWhite,
                                                            end: 0);
                                                      }
                                                    }
                                                  }),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          )),
                    ]),
                  ),
          );
        },
      ),
    );
  }

  Widget buildContainerData(
      {required String text,
      required Color color,
      required Color color1,
      required Color color2,
      required int end}) {
    if (end != -1) {
      return Container(
        height: 120,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: BorderDirectional(
          start: BorderSide(width: 0.5, color: color1),
          end: BorderSide(width: 0.5, color: color1),
        )),
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Text(
            "$text",
            style: TextStyle(color: color2),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Container(
        height: 120,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: BorderDirectional(
          start: BorderSide(width: 0.5, color: color1),
          end: BorderSide(width: 0.5, color: color1),
          bottom: BorderSide(width: 0.5, color: color1),
        )),
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Text(
            "$text",
            style: TextStyle(color: color2),
          ),
        ),
      );
    }
  }
}
