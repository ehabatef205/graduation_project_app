import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/view_table/cubit/cubit.dart';
import 'package:graduation_project_app/modules/view_table/cubit/states.dart';


class ViewTableScreen extends StatelessWidget {
  const ViewTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index1 = 0;
    Color? color1 = Theme.of(context).textTheme.bodyText1!.color;
    Color? color2 = Theme.of(context).textTheme.bodyText2!.color;
    Color? color3 = Theme.of(context).textTheme.headline1!.color;
    Color? color4 = Theme.of(context).textTheme.headline2!.color;
    Color? color5 = Theme.of(context).textTheme.headline3!.color;
    Color? color6 = Theme.of(context).textTheme.headline4!.color;
    Color? color7 = Theme.of(context).textTheme.headline5!.color;
    Color? color8 = Theme.of(context).textTheme.headline6!.color;
    Color? coloWhite = Colors.white;
    return BlocProvider(
      create: (BuildContext context) => ViewTableCubit(),
      child: BlocConsumer<ViewTableCubit, ViewTableStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewTableCubit cubit = ViewTableCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.date_range_sharp,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "My Courses",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: color1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                        border: BorderDirectional(
                                          top: BorderSide(width: 0.5 , color: color1!),
                                          bottom: BorderSide(width: 0.5 , color: color1!),
                                          start: BorderSide(width: 0.5 , color: color1!),
                                        ),
                                      ),
                                      child: Text(
                                        "Date/Time",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(width: 0.5 , color: color1!),
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
                                          start: BorderSide(width: 0.5 , color: color1!),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        cubit.time[1],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: color1
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: BorderDirectional(
                                          start: BorderSide(width: 0.5 , color: color1!),
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
                                          start: BorderSide(width: 0.5 , color: color1!),
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
                                          start: BorderSide(width: 0.5 , color: color1!),
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
                                          start: BorderSide(width: 0.5 , color: color1!),
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
                                          start: BorderSide(width: 0.5 , color: color1!),
                                          bottom: BorderSide(width: 0.5 , color: color1!),
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
                                              width: 80,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: BorderDirectional(
                                                    top: BorderSide(width: 0.5 , color: color1!),
                                                    start: BorderSide(width: 0.5 , color: color1!),
                                                    end: BorderSide(width: 0.5 , color: color1!),
                                                    bottom: BorderSide(width: 0.5 , color: color1!),
                                                  )
                                              ),
                                              child: Text(
                                                cubit.days[index],
                                                style: TextStyle(
                                                  color: color1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            buildContainerData(
                                              "Math",
                                              2,
                                              "10",
                                              color2!,
                                              color1!,
                                              coloWhite!,
                                              0,
                                            ),
                                            buildContainerData(
                                              "Math",
                                              2,
                                              "10",
                                              color3!,
                                              color1!,
                                              coloWhite!,
                                              0,
                                            ),
                                            buildContainerData(
                                              "Math",
                                              2,
                                              "10",
                                              color4!,
                                              color1!,
                                              coloWhite!,
                                              0,
                                            ),
                                            buildContainerData(
                                              "Math",
                                              2,
                                              "10",
                                              color5!,
                                              color1!,
                                              coloWhite!,
                                              0,
                                            ),
                                            buildContainerData(
                                              "Math",
                                              2,
                                              "10",
                                              color6!,
                                              color1!,
                                              coloWhite!,
                                              0,
                                            ),
                                            buildContainerData(
                                              "Math",
                                              2,
                                              "10",
                                              color7!,
                                              color1!,
                                              coloWhite!,
                                              0,
                                            ),
                                            buildContainerData(
                                              "Math",
                                              2,
                                              "10",
                                              color8!,
                                              color1!,
                                              coloWhite!,
                                              -1,
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
            ),
          );
        },
      ),
    );
  }

  Widget buildContainerData(String name , int group , String place , Color color , Color color1 , Color color2, int end){
    if(end != -1){
      return Container(
        height: 120,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(width: 0.5 , color: color1),
              end: BorderSide(width: 0.5 , color: color1),
            )
        ),
        child: Container(
          height: 100,
          width: 70,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Text(
            "${name} \n ${group} \n ${place}",
            style: TextStyle(
                color: color2
            ),
          ),
        ),
      );
    }else{
      return Container(
        height: 120,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(width: 0.5 , color: color1),
              end: BorderSide(width: 0.5 , color: color1),
              bottom: BorderSide(width: 0.5 , color: color1),
            )
        ),
        child: Container(
          height: 100,
          width: 70,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Text(
            "${name} \n ${group} \n ${place}",
            style: TextStyle(
                color: color2
            ),
          ),
        ),
      );
    }
  }
}
