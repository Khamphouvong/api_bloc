import 'dart:io';

import 'package:api_bloc/core/errors/exceptions.dart';
import 'package:api_bloc/core/errors/failure.dart';
import 'package:api_bloc/features/daily_news/data/datasource/daily_news_remote_datasource.dart';
import 'package:api_bloc/features/daily_news/data/models/article_model.dart';
import 'package:api_bloc/features/daily_news/domain/repositories/article_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ArticleRepo)
class ArticleRepoImpl implements ArticleRepo {
  final DailyNewsRemoteDataSource _dailyNewsRemoteDataSource;

  ArticleRepoImpl(this._dailyNewsRemoteDataSource);

  @override
  Future<Either<Failure, ArticlesListModel>> getNewsArticle(
      String country, String category, String apiKey) async {
    try {
      final httpResponse = await _dailyNewsRemoteDataSource.getNewsArticle(
        country: country,
        category: category,
        apiKey: apiKey,
      );
      return Right(httpResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on SocketException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message.toString()));
    }
  }
}
// โค้ดนี้เป็นส่วนหนึ่งของการสร้าง Repository (ArticleRepo) ในแอปพลิเคชัน โดยมีคลาส ArticleRepoImpl
//เป็นคลาสที่ทำหน้าที่เรียกใช้แหล่งข้อมูล (DataSource) และจัดการกับข้อผิดพลาดที่อาจเกิดขึ้น ซึ่งประกอบด้วยเมธอดดังนี้:

// 1 DailyNewsRemoteDataSource เป็นแหล่งข้อมูลระยะไกลที่ใช้ในการเรียกข้อมูลบทความข่าวรายวัน

// 2 ArticleRepoImpl เป็นคลาสที่สืบทอดจาก ArticleRepo และทำหน้าที่สร้างอ็อบเจกต์ ArticleRepoImpl
//โดยรับพารามิเตอร์ _dailyNewsRemoteDataSource และกำหนดค่าให้กับตัวแปรที่เกี่ยวข้อง

// 3 getNewsArticle เป็นเมธอดที่ใช้ในการดึงข่าวบทความรายวัน โดยรับพารามิเตอร์ country,
//category, และ apiKey เพื่อส่งต่อไปยัง _dailyNewsRemoteDataSource เพื่อดึงข้อมูล โดยใช้ await เพื่อรอให้การเรียก
//_dailyNewsRemoteDataSource.getNewsArticle เสร็จสิ้น และคืนค่า Right ของ httpResponse ในกรณีที่ไม่เกิดข้อผิดพลาด

// 4 ในกรณีที่เกิดข้อผิดพลาดแบบเซิร์ฟเวอร์ (ServerException) หรือข้อผิดพลาดของเชื่อมต่อ
//(SocketException, ConnectionException) จะถูกจับและคืนค่า Left ของ ServerFailure หรือ ConnectionFailure ตามลำดับ
//โดยระบุข้อความของข้อผิดพลาดในพารามิเตอร์