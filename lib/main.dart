import 'package:amitfluttertasknewsui/control/data/online/repo.dart';
import 'package:amitfluttertasknewsui/control/logic/bbc_cubit.dart';
import 'package:amitfluttertasknewsui/model/NewsModel.dart';
import 'package:amitfluttertasknewsui/view/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'control/constants/di.dart';
import 'control/data/online/dio.dart';

void main() async{
  await init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<BbcCubit>(
              create: (context) => di<BbcCubit>()..getBbcNews(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
