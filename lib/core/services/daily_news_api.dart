import 'package:api_bloc/config/constants/api_constant.dart';
import 'package:api_bloc/features/daily_news/data/models/article_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'daily_news_api.g.dart';

// TODO:ໂຄ້ດກຳນົດ ຂໍ້ມູນເພື່ອ GENERATED ໄຟລ daily_news_api.g.dart
@lazySingleton
// TODO: ກຳໜົດຄາສ DailyNewsApi ເປັນອິນເຕີເຟສ Retrofit ແລະ ກຳໜົດ URL ຂອງ Api ດ້ວຍ baseUrlApiNews
@RestApi(baseUrl: baseUrlApiNews)
abstract class DailyNewsApi {
  @factoryMethod
  factory DailyNewsApi(Dio dio) = _DailyNewsApi;
// TODO: @GET(topHeadlines) กำหนดเมธอด getNewsArticle ในการเรียก API เพื่อรับข้อมูลบทความข่าว
  @GET(topHeadlines)

  // TODO: Future<ArticlesListModel> เป็นประเภทข้อมูลที่ส่งกลับจาก API ซึ่งในที่นี้เป็น ArticlesListModel ซึ่งเป็นโมเดลข้อมูลที่ใช้ในการแปลงค่า JSON จาก API เป็นออบเจ็กต์แบบ Dart
  Future<ArticlesListModel> getNewsArticle({
    @Query('country') String? country,
    @Query('category') String? category,
    @Query('apiKey') String? apiKey,
  });
}
// TODO: สุดท้ายคือการใช้ @lazySingleton เพื่อให้ DailyNewsApi เป็น Singleton object ที่ถูกสร้างขึ้นเพียงครั้งเดียวในระหว่างการทำงานของแอปพลิเคชัน ซึ่งจะถูกใช้ในการอินเจกเตอร์ (Dependency Injection) ในระบบโดยใช้ Injectable library