import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../models/convert_currency_dto.dart';
import '../../repositories/currency_repo.dart';

part 'local_currency_state.dart';

class LocalCurrencyCubit extends Cubit<LocalCurrencyState> {
  LocalCurrencyCubit(this.currencyRepository) : super(LocalCurrencyInitial()) {
    refresh();
  }

  final CurrencyRepo currencyRepository;

  Future<void> refresh() async {
    final data = await currencyRepository.getSavedCurrencyRate();
    if (data == null) return;
    emit(LocalCurrencyLoaded(data));
  }
}
