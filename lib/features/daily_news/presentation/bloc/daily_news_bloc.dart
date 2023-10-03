import 'package:api_bloc/core/usecase/usecase.dart';
import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:api_bloc/features/daily_news/domain/usecases/get_new_artcle_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'daily_news_event.dart';
part 'daily_news_state.dart';

@injectable
class DailyNewsBloc extends Bloc<DailyNewsEvent, DailyNewsState> {
  final GetNewsArticleUsecase _getNewsArticleUsecase;
  DailyNewsBloc(this._getNewsArticleUsecase) : super(const DailyNewsLoading()) {
    on<DailyNewsEvent>(onGetNewsArticle);
  }
  Future<void> onGetNewsArticle(
      DailyNewsEvent event, Emitter<DailyNewsState> emit) async {
    final dataState = await _getNewsArticleUsecase(
      const GetNewsArticle(
          country: 'us',
          category: 'business',
          apiKey: 'bdf2f746bb904107be9d6cdfa91a6829'),
    );
    emit(const DailyNewsLoading());
    dataState.fold(
      (error) {
        emit(DailyNewsError(error.message));
      },
      (dailyNews) => emit(DailyNewsLoaded(dailyNews)),
    );
  }
}

// โค้ดนี้เป็นส่วนหนึ่งของการสร้าง Bloc (DailyNewsBloc) สำหรับการจัดการสถานะและเหตุการณ์ที่เกี่ยวข้องกับข่าวประจำวันในแอปพลิเคชัน โดยมีคุณสมบัติและเมธอดดังนี้:

// 1 DailyNewsBloc เป็นคลาสที่สืบทอดมาจาก Bloc และระบุการใช้งานของ Bloc สำหรับการจัดการสถานะและเหตุการณ์ที่เกี่ยวข้องกับข่าวประจำวัน
//โดยมีเมธอด onGetNewsArticle เพื่อรองรับเหตุการณ์ DailyNewsEvent และ emit เพื่อส่งสถานะ DailyNewsState

// 2 GetNewsArticleUsecase เป็น Use Case สำหรับการดึงข้อมูลบทความข่าว

// 3 DailyNewsEvent เป็นส่วนหนึ่งของเหตุการณ์ที่เกี่ยวข้องกับ Daily News Bloc ซึ่งอาจประกอบด้วยเหตุการณ์ต่าง ๆ ที่เกี่ยวข้องกับการดึงข้อมูลข่าวประจำวัน

// 4 DailyNewsState เป็นส่วนหนึ่งของสถานะที่เกี่ยวข้องกับ Daily News Bloc ซึ่งอาจประกอบด้วยสถานะต่าง ๆ ที่เกี่ยวข้องกับการดึงข้อมูลข่าวประจำวัน
//เช่น Loading, Loaded, หรือ Error

// 5 onGetNewsArticle เป็นเมธอดที่ใช้ในการรองรับเหตุการณ์ Daily News Event และดำเนินการดึงข้อมูลข่าวประจำวันโดยเรียกใช้เมธอด call ของ
//_getNewsArticleUsecase และส่งพารามิเตอร์ country, category, และ apiKey เพื่อดึงข้อมูล จากนั้นใช้ emit เพื่อส่งสถานะ DailyNewsState
//ที่เกี่ยวข้องกับการดึงข้อมูลข่าวประจำวัน