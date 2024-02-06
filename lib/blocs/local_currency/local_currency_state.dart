part of 'local_currency_cubit.dart';

@immutable
abstract class LocalCurrencyState {}

class LocalCurrencyInitial extends LocalCurrencyState {}

class LocalCurrencyLoaded extends LocalCurrencyState {
  final List<SaveConvertCurrencyDto> data;

  LocalCurrencyLoaded(this.data);
}
