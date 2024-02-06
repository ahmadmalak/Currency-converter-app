// currency_state.dart

part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyStateLoading extends CurrencyState {}

class CurrencyStateLoaded extends CurrencyState {
  final List<Currency> currencies;

  const CurrencyStateLoaded({required this.currencies});

  @override
  List<Object> get props => [currencies];
}

class CurrencyStateError extends CurrencyState {
  final Exception error;

  const CurrencyStateError({required this.error});

  @override
  List<Object> get props => [error];
}
