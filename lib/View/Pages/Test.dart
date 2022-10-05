import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ViewModel/Bloc/Test/test_cubit.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Test")
      ),
      body: BlocProvider(
        create: (context) => TestCubit(),
        child: BlocConsumer<TestCubit, TestState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            TestCubit test = TestCubit.get(context);
            return Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.end,
                    controller: test.testController,
                    onChanged: (value) => test.onChanged(value),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      test.print();
                    },
                    child: Text("Submit"),
                  ),

                  Container(
                    child: Text(test.testController.text.toString()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
