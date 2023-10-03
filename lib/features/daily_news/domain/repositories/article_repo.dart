import 'package:api_bloc/core/errors/failure.dart';
import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepo {
  Future<Either<Failure, ArticlesListEntity>> getNewsArticle(
    String country,
    String category,
    String apiKey,
  );
}

// โค้ดนี้เป็นส่วนหนึ่งของการกำหนด Repository Interface (ArticleRepo) สำหรับการดึงข้อมูลบทความข่าวในแอปพลิเคชัน โดยประกอบด้วย:

// 1 ArticleRepo เป็นคลาสที่ระบุแบบสร้างของ Repository Interface สำหรับการดึงข้อมูลบทความข่าว โดยมีเมธอดเดียวคือ getNewsArticle
//ที่รับพารามิเตอร์ country, category, และ apiKey เพื่อดึงข้อมูลบทความข่าว และคืนค่าเป็น Future ของ Either ที่มีพารามิเตอร์แรกเป็น Failure
//และพารามิเตอร์ที่สองเป็น ArticlesListEntity

// 2 Failure เป็นคลาสที่ระบุข้อผิดพลาดที่อาจเกิดขึ้นในกระบวนการดึงข้อมูลบทความข่าว

// 3 ArticlesListEntity เป็นคลาส Entity ที่ใช้ในการระบุรายการของอ็อบเจกต์ ArticleEntity ในรูปแบบของ List