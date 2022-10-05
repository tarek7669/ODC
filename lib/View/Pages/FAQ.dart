import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ViewModel/Bloc/FAQ/faq_cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: BlocProvider(
          create: (context) => FaqCubit()..getFaq(),
          child: BlocConsumer<FaqCubit, FaqState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              FaqCubit cub = FaqCubit.get(context);
               return Container(
                padding: EdgeInsets.all(20),
                // child: Column(
                //   children: [
                //     InkResponse(
                //       onTap: () {
                //         cub.tapped();
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: Colors.deepOrange,
                //             borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: Row(
                //             children: [
                //               Expanded(
                //                 child: Text("Q1: How many countries Orange Digital Center is in ?",
                //                     style: TextStyle(
                //                         color: Colors.white,
                //                         fontSize: 20
                //                     )
                //                 ),
                //               ),
                //               Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,)
                //             ],
                //           ),
                //         ),
                //       )),
                //     AnimatedContainer(
                //
                //       child: Center(
                //         child: Text("16 Countries",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 20
                //                 )),
                //       ),
                //
                //       height: cub.height,
                //       width: double.infinity,
                //
                //       decoration: BoxDecoration(
                //           color: Colors.grey[500],
                //           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                //       ),
                //
                //       duration: Duration(milliseconds: 500),
                //     )
                //   ],
                // )

                 child: cub.faqModel == null ? Center(child: CircularProgressIndicator(
                   color: Colors.deepOrange,
                 ))
                     :ListView.builder(
                   physics: BouncingScrollPhysics(),
                   itemCount: cub.faqModel!.data!.length,
                   itemBuilder: (context, index) {
                     return Column(
                       children: [
                         InkResponse(
                             onTap: () {
                               cub.tapped();
                             },
                             child: Container(
                               decoration: BoxDecoration(
                                   color: Colors.deepOrange,
                                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Row(
                                   children: [
                                     Expanded(
                                       child: RichText(text: HTML.toTextSpan(
                                                context,
                                                cub.faqModel!.data![index].question.toString(),
                                                defaultTextStyle: TextStyle(color: Colors.white),
                                                overrideStyle: <String, TextStyle>{
                                                  'p': const TextStyle(
                                                      fontSize: 20),
                                                  'a': const TextStyle(
                                                      wordSpacing: 2),
                                                }),
                                           // style: TextStyle(
                                           //     color: Colors.white,
                                           //     fontSize: 20
                                           // )
                                          textScaleFactor: 1.5,

                                       ),
                                     ),
                                     Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,)
                                   ],
                                 ),
                               ),
                             )),
                         AnimatedContainer(

                           child: Center(
                             child: RichText(text: HTML.toTextSpan(
                                 context,
                                 cub.faqModel!.data![index].answer.toString(),
                                 defaultTextStyle: TextStyle(color: Colors.white),
                                 overrideStyle: <String, TextStyle>{
                                   'p': const TextStyle(
                                       fontSize: 20),
                                   'a': const TextStyle(
                                       wordSpacing: 2),
                                 }),
                               // style: TextStyle(
                               //     color: Colors.white,
                               //     fontSize: 20
                               // )
                               textScaleFactor: 1.5,

                             ),
                           ),

                           height: cub.height,
                           width: double.infinity,

                           decoration: BoxDecoration(
                               color: Colors.grey[500],
                               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                           ),

                           duration: Duration(milliseconds: 500),
                         )
                       ],
                     );
                   },
                 ),
      );}))
    );
  }
}

