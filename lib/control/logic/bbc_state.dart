part of 'bbc_cubit.dart';

@immutable
sealed class BbcState {}

final class BbcInitial extends BbcState {}
final class BbcLoaded extends BbcState {}