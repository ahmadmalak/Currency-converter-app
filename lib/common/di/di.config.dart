// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter_app/blocs/currency/currency_bloc.dart'
    as _i7;
import 'package:currency_converter_app/common/route/route.dart' as _i3;
import 'package:currency_converter_app/network_config/network.dart' as _i4;
import 'package:currency_converter_app/repositories/currency_imp_repo.dart'
    as _i6;
import 'package:currency_converter_app/repositories/currency_repo.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.factory<_i4.RemoteCurrency>(() => _i4.RemoteCurrency());
    gh.factory<_i5.CurrencyRepo>(() =>
        _i6.CurrencyImpRepository(remoteDataSource: gh<_i4.RemoteCurrency>()));
    gh.factory<_i7.CurrencyBloc>(
        () => _i7.CurrencyBloc(currencyRepository: gh<_i5.CurrencyRepo>()));
    return this;
  }
}
