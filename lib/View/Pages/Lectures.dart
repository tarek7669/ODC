import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/View/Components/Core/CoursesComp.dart';
import 'package:untitled/ViewModel/Bloc/Lectures/lecture_cubit.dart';

class Lectures extends StatelessWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LectureCubit()..getLectures(),
      child: BlocConsumer<LectureCubit, LectureState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LectureCubit myCub = LectureCubit.get(context);
          return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 3,
                  backgroundColor: Colors.white,
                  leading: InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.deepOrange,)),
                  title: Text("Lectures", style: TextStyle(color: Colors.black)),
                  actions: [
                    Icon(Icons.filter_alt, color: Colors.deepOrange,)
                  ],
                ),
                body: Container(
                  padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
                  child: myCub.lectureModel == null ? Center(child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ))
                      :ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: myCub.lectureModel!.data!.length,
                    itemBuilder: (context, index) {
                      return CoursesComp(myCub.lectureModel!.data![index].lectureSubject.toString(),
                        myCub.lectureModel!.data![index].lectureDate.toString(),
                        myCub.lectureModel!.data![index].lectureStartTime.toString(),
                        myCub.lectureModel!.data![index].lectureEndTime.toString(),);
                    },
                  )
                  // child: Column(
                  //   children: [
                  //     CoursesComp("Flutter"),
                  //     CoursesComp("React"),
                  //     CoursesComp("Vue"),
                  //   ],
                  // ),
                ),
              );
        },
      ),
    );
  }
}
