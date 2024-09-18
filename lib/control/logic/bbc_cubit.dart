import 'package:amitfluttertasknewsui/control/data/online/dio.dart';
import 'package:amitfluttertasknewsui/model/NewsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../data/online/endpoints.dart';

part 'bbc_state.dart';

class BbcCubit extends Cubit<BbcState> {
  final DioHelper dioHelper;
   BBCModel? bbcModel;
  BbcCubit({required this.dioHelper}) : super(BbcInitial());

  Future<Future<Response>?>getBbcNews()async{
    try{
      return dioHelper?.getData(url: '$newsBBcList=$apiKey').then((value){
        print(value);
        if(value.data != null){
          print(value.data);
          bbcModel = BBCModel.fromJson(value.data);
          emit(BbcLoaded());
        }
      });

    }catch(e){
      print('BBC Error =======> $e');
    }

  }


}
