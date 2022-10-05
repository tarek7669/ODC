import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/View/Components/Core/CoursesComp.dart';
import 'package:untitled/ViewModel/Bloc/Midterms/midterm_cubit.dart';

class Midterms extends StatelessWidget {
  const Midterms({Key? key}) : super(key: key);

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
          title: Text("Midterms", style: TextStyle(color: Colors.black)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.filter_alt, color: Colors.deepOrange,),
            )
          ],
        ),
        body: BlocProvider(
          create: (context) => MidtermCubit()..getMidterms(),
          child: BlocConsumer<MidtermCubit, MidtermState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              MidtermCubit mid = MidtermCubit.get(context);
              return mid.midtermsModel == null ? Center(child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ))
                  :ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: mid.midtermsModel!.data!.length,
                itemBuilder: (context, index) {

                  return CoursesComp(mid.midtermsModel!.data![index].examSubject.toString(),
                    mid.midtermsModel!.data![index].examDate.toString(),
                    mid.midtermsModel!.data![index].examStartTime.toString(),
                    mid.midtermsModel!.data![index].examEndTime.toString(),);
                },
              );
            },
          ),
        )
    );
  }
}
