import 'package:amitfluttertasknewsui/control/data/online/dio.dart';
import 'package:amitfluttertasknewsui/control/data/online/repo.dart';
import 'package:amitfluttertasknewsui/model/NewsModel.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../data/online/endpoints.dart';

part 'bbc_state.dart';

class BbcCubit extends Cubit<BbcState> {
  BBCModel? bbcModel;
  final Repository repository;

  BbcCubit(this.repository) : super(BbcInitial());

  Future<void>? getBbcNews() async {
    try {
      return repository.getNewData().then((value) {
        if (value!.data != null) {
          bbcModel = BBCModel.fromJson(value.data);
          emit(BbcLoaded());
        }
      });
    }


    catch (e) {
      print('BBC Error =======> $e');
    }
  }
}