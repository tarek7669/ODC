import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ViewModel/Bloc/Signup/signup_cubit.dart';

Widget Dropdown<String>(tvalue, list) {
  return BlocProvider(
    create: (context) => SignupCubit(),
    child: BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        SignupCubit sign = SignupCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: DropdownButton<String>(
            value: tvalue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            // style: TextStyle(color: Colors.deepOrange),
            underline: Container(
              height: 1,
              color: Colors.deepOrange,
            ),

            borderRadius: BorderRadius.all(Radius.circular(20)),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              // setState(() {
              //   tvalue = value!;
              // });
              sign.droplist(value.toString());
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(value.toString())),
              );
            }).toList(),
          ),
        );
      },
    ),
  );
}