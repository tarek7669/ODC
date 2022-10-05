
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/ViewModel/Bloc/News/news_cubit.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:share/share.dart';
import 'InNews.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("News", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
        child: BlocProvider(
        create: (context) => NewsCubit()..getNews(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            NewsCubit news = NewsCubit.get(context);
            return news.newsModel == null ? Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ),
            )
            :ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: news.newsModel!.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  // color: Colors.grey[300],
                  height: 300,
                  child: InkResponse(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InNews()),
                      );
                    },
                    child: Card(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.grey[400],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(news.newsModel!.data![index].imageUrl.toString(),
                                          color: Colors.grey[400]!.withOpacity(0.8), colorBlendMode: BlendMode.modulate,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(news.newsModel!.data![index].title.toString(),
                              style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
                                Container(
                                    width: 100,
                                    height: 60,
                                    // color: Colors.deepOrange,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.deepOrange,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkResponse(
                                                onTap: () {
                                                  Share.share(news.newsModel!.data![index].linkUrl.toString());
                                                },
                                                child: Icon(Icons.share_outlined, color: Colors.white)),
                                            Container(
                                              height: 20,
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                            InkResponse(
                                                onTap: () {
                                                  Clipboard.setData(
                                                    ClipboardData(text: news.newsModel!.data![index].linkUrl.toString())).then((_) {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(content: Text("Link copied successfullly"))
                                                      );
                                                    });

                                                },
                                                child: SvgPicture.asset("assets/icons/copy.svg", color: Colors.white)
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(news.newsModel!.data![index].body.toString(),
                                    style: TextStyle(color: Colors.white, fontSize: 20))

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        ),
      ),
    );
  }
}
