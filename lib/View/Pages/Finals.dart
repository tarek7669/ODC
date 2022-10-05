import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/View/Components/Core/CoursesComp.dart';
import 'package:untitled/ViewModel/Bloc/Finals/finals_cubit.dart';

class Finals extends StatelessWidget {
  const Finals({Key? key}) : super(key: key);

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
            child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.deepOrange,)),
        title: Text("Finals", style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.filter_alt, color: Colors.deepOrange,),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => FinalsCubit()..getFinals(),
        child: BlocConsumer<FinalsCubit, FinalsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            FinalsCubit mid = FinalsCubit.get(context);
            return mid.finalsModel == null ? Center(child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ))
                :ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: mid.finalsModel!.data!.length,
              itemBuilder: (context, index) {

                return CoursesComp(mid.finalsModel!.data![index].examSubject.toString(),
                  mid.finalsModel!.data![index].examDate.toString(),
                  mid.finalsModel!.data![index].examStartTime.toString(),
                  mid.finalsModel!.data![index].examEndTime.toString(),);
              },
            );
          },
        ),
      )
    );
  }
}
