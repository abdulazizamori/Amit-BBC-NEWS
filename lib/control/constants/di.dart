import 'package:amitfluttertasknewsui/control/data/online/dio.dart';
import 'package:amitfluttertasknewsui/control/data/online/repo.dart';
import 'package:amitfluttertasknewsui/control/logic/bbc_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async{
  di.registerFactory<DioHelper>(() => DioImplementation());
  di.registerFactory<Repository>(()=> RepoImplementation(di<DioHelper>()));
  di.registerFactory<BbcCubit>(() => BbcCubit(di<Repository>()));

}