import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ViewModel/Bloc/Counter/counter_cubit.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            CounterCubit myCub = CounterCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(myCub.counter.toString(),
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold
                    )),

                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            myCub.incCounter();
                          },
                          icon: Icon(CupertinoIcons.plus, size: 40,)
                      ),
                      IconButton(
                          onPressed: () {
                            myCub.decCounter();
                          },
                          icon: Icon(CupertinoIcons.minus, size: 40)
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       setState((){
    //         if(res.length % 2 == 0)
    //           res.add(Text("Flutter"));
    //         else
    //           res.add(Text("Dart"));
    //       });
    //       print(res.toString());
    //     },
    //     child: Icon(CupertinoIcons.plus),
    //   ),
    //   body: Column(
    //     children: res,
    //   ),
    // );

    // ANIMATED CONTAINER
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: Center(
    //     child: InkResponse(
    //       onTap: () {
    //         setState((){
    //           if(!changed){
    //             _width = 100;
    //             _height = 200;
    //             _color = Colors.deepOrange;
    //             changed = !changed;
    //           }
    //           else{
    //             _width = 50;
    //             _height = 50;
    //             _color = Colors.green;
    //             changed = !changed;
    //           }
    //         });
    //       },
    //       child: AnimatedContainer(
    //         width: _width,
    //         height: _height,
    //         decoration: BoxDecoration(
    //           color: _color,
    //
    //         ),
    //         duration: Duration(seconds: 1),
    //         curve: Curves.easeInCubic,
    //       ),
    //     )
    //   ),
    // );
  }
}

