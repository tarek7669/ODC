import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:untitled/ViewModel/Bloc/TermsConditions/terms_cubit.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text("Terms & Conditions",
              style: TextStyle(
                  fontSize: 25,
                color: Colors.black
              )),
          leading: InkResponse(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,),
          ),
        ),
        body: BlocProvider(
          create: (context) => TermsCubit()..fetchTerms(),
          child: BlocConsumer<TermsCubit, TermsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              TermsCubit term = TermsCubit.get(context);
              return term.termsModel == null ? Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              )
              :SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: RichText(
                  text: HTML.toTextSpan(context,
                      term.termsModel!.data!.terms.toString()),
                ),
              );
            },
          ),
        )
    );
  }
}
