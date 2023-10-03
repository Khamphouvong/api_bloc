part of 'daily_news_bloc.dart';

sealed class DailyNewsEvent extends Equatable {
  const DailyNewsEvent();

  @override
  List<Object> get props => [];
}

final class GetNewsArticleEvent extends DailyNewsEvent {
  const GetNewsArticleEvent();
}

// โค้ดนี้เป็นส่วนหนึ่งของการสร้าง Bloc (DailyNewsBloc) สำหรับการจัดการสถานะและเหตุการณ์ที่เกี่ยวข้องกับข่าวประจำวันในแอปพลิเคชัน โดยมีคุณสมบัติและเมธอดดังนี้:

// 1 DailyNewsBloc เป็นคลาสที่สืบทอดมาจาก Bloc และระบุการใช้งานของ Bloc สำหรับการจัดการสถานะและเหตุการณ์ที่เกี่ยวข้องกับข่าวประจำวัน
//โดยมีเมธอด onGetNewsArticle เพื่อรองรับเหตุการณ์ DailyNewsEvent และ emit เพื่อส่งสถานะ DailyNewsState

// 2 GetNewsArticleUsecase เป็น Use Case สำหรับการดึงข้อมูลบทความข่าว

// 3 DailyNewsEvent เป็นส่วนหนึ่งของเหตุการณ์ที่เกี่ยวข้องกับ Daily News Bloc ซึ่งอาจประกอบด้วยเหตุการณ์ต่าง ๆ ที่เกี่ยวข้องกับการดึงข้อมูลข่าวประจำวัน

// 4 DailyNewsState เป็นส่วนหนึ่งของสถานะที่เกี่ยวข้องกับ Daily News Bloc ซึ่งอาจประกอบด้วยสถานะต่าง ๆ ที่เกี่ยวข้องกับการดึงข้อมูลข่าวประจำวัน
//เช่น Loading, Loaded, หรือ Error

// 5 onGetNewsArticle เป็นเมธอดที่ใช้ในการรองรับเหตุการณ์ Daily News Event และดำเนินการดึงข้อมูลข่าวประจำวันโดยเรียกใช้เมธอด call
//ของ _getNewsArticleUsecase และส่งพารามิเตอร์ country, category, และ apiKey เพื่อดึงข้อมูล จากนั้นใช้ emit เพื่อส่งสถานะ
//DailyNewsState ที่เกี่ยวข้องกับการดึงข้อมูลข่าวประจำวัน