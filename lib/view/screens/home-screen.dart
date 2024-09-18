import 'package:amitfluttertasknewsui/control/logic/bbc_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BbcCubit,BbcState>(builder: (context,state){

      final news = context.read<BbcCubit>();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BBC', style: TextStyle(color: Colors.red, fontSize: 15.sp)),
              Text('News', style: TextStyle(color: Colors.white, fontSize: 15.sp)),
            ],
          ),
          centerTitle: true,
        ),
        body: news.bbcModel != null
            ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200.h, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: news.bbcModel!.articles!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150.w, // Adjust the width as needed
                      margin: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Center(
                        child: Image.network(
                          news.bbcModel!.articles![index].urlToImage.toString(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200.h, // Adjust the height to fill the remaining space
                child: ListView.builder(
                  itemCount: news.bbcModel!.articles!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0).r,
                      child: ListTile(
                        leading: Image.network(news.bbcModel!.articles![index].urlToImage.toString()),
                        title: Text('Article ${news.bbcModel!.articles![index].title}'),
                        subtitle: Text('Subtitle ${news.bbcModel!.articles![index].description}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
            : Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      );
    }, listener: (context, state){});
  }
}
