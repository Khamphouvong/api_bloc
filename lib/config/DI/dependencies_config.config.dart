// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/services/daily_news_api.dart' as _i5;
import '../../features/daily_news/data/datasource/daily_news_remote_datasource.dart'
    as _i6;
import '../../features/daily_news/data/repositories/article_repo_impl.dart'
    as _i8;
import '../../features/daily_news/domain/repositories/article_repo.dart' as _i7;
import '../../features/daily_news/domain/usecases/get_new_artcle_usecase.dart'
    as _i9;
import '../../features/daily_news/presentation/bloc/daily_news_bloc.dart'
    as _i10;
import '../routes/app_router.dart' as _i3;
import 'modules.dart' as _i11;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter());
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i5.DailyNewsApi>(() => _i5.DailyNewsApi(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.DailyNewsRemoteDataSource>(
        () => _i6.DailyNewsRemoteDataSourceImpl(gh<_i5.DailyNewsApi>()));
    gh.lazySingleton<_i7.ArticleRepo>(
        () => _i8.ArticleRepoImpl(gh<_i6.DailyNewsRemoteDataSource>()));
    gh.lazySingleton<_i9.GetNewsArticleUsecase>(
        () => _i9.GetNewsArticleUsecase(gh<_i7.ArticleRepo>()));
    gh.factory<_i10.DailyNewsBloc>(
        () => _i10.DailyNewsBloc(gh<_i9.GetNewsArticleUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
