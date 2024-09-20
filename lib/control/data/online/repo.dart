import 'package:amitfluttertasknewsui/control/data/online/dio.dart';
import 'package:dio/dio.dart';

import 'endpoints.dart';

abstract class Repository{
  final DioHelper? dioHelper;

  Repository(this.dioHelper);
  Future<Response?> getNewData();


}

class RepoImplementation extends Repository{
  RepoImplementation(super.dioHelper);

  @override
  Future<Response?> getNewData() async{
    return await dioHelper?.getData(url: '$newsBBcList=$apiKey');
  }
}
