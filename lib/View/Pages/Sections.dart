import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/View/Components/Core/CoursesComp.dart';
import 'package:untitled/ViewModel/Bloc/Sections/section_cubit.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.white,
        leading: InkResponse(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp, color: Colors.deepOrange,)),
        title: Text("Sections", style: TextStyle(color: Colors.black)),
        actions: [
          Icon(Icons.filter_alt, color: Colors.deepOrange,)
        ],
      ),
      body:
      BlocProvider(
        create: (context) => SectionCubit()..getSections(),
        child: BlocConsumer<SectionCubit, SectionState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            SectionCubit sect = SectionCubit.get(context);

            return sect.sectionModel == null ? Center(child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ))
            :ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: sect.sectionModel!.data!.length,
              itemBuilder: (context, index) {

                return CoursesComp(sect.sectionModel!.data![index].sectionSubject.toString(),
                  sect.sectionModel!.data![index].sectionDate.toString(),
                  sect.sectionModel!.data![index].sectionStartTime.toString(),
                  sect.sectionModel!.data![index].sectionEndTime.toString(),);
              },
            );
          },
        ),
      ),
    );;
  }
}
