import 'package:api_bloc/core/errors/failure.dart';

import 'package:api_bloc/core/usecase/usecase.dart';
import 'package:api_bloc/features/daily_news/domain/entities/article_entity.dart';
import 'package:api_bloc/features/daily_news/domain/repositories/article_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNewsArticleUsecase
    implements Usecase<Either<Failure, ArticlesListEntity>, GetNewsArticle> {
  final ArticleRepo _articleRepo;

  GetNewsArticleUsecase(this._articleRepo);
  @override
  Future<Either<Failure, ArticlesListEntity>> call(
      GetNewsArticle getNewsArticleParams) {
    return _articleRepo.getNewsArticle(getNewsArticleParams.country,
        getNewsArticleParams.category, getNewsArticleParams.apiKey);
  }
}

// โค้ดนี้เป็นส่วนหนึ่งของการสร้าง Use Case (GetNewsArticleUsecase) สำหรับการดึงข้อมูลบทความข่าวในแอปพลิเคชัน โดยมีคุณสมบัติและเมธอดดังนี้:

// 1 GetNewsArticleUsecase เป็นคลาสที่สืบทอดมาจาก Usecase และระบุการใช้งานของ Use Case สำหรับการดึงข้อมูลบทความข่าว โดยมีเมธอด
//call ที่รับพารามิเตอร์ getNewsArticleParams จากนั้นเรียกใช้เมธอด getNewsArticle ของ _articleRepo โดยส่งพารามิเตอร์ country,
//category, และ apiKey จาก getNewsArticleParams และคืนค่าเป็น Future ของ Either ที่มีพารามิเตอร์แรกเป็น Failure
//และพารามิเตอร์ที่สองเป็น ArticlesListEntity

// 2 ArticleRepo เป็น Repository Interface สำหรับการดึงข้อมูลบทความข่าว

// 3 Failure เป็นคลาสที่ระบุข้อผิดพลาดที่อาจเกิดขึ้นในกระบวนการดึงข้อมูลบทความข่าว

// 4 ArticlesListEntity เป็นคลาส Entity ที่ใช้ในการระบุรายการของอ็อบเจกต์ ArticleEntity ในรูปแบบของ List

// 5 lazySingleton เป็นตัวสั่งให้ตัวแปรหรือคลาสให้ถูกสร้างเป็น Singleton โดยใช้ injectable เพื่อให้สามารถใช้ Dependency Injection 
//ในการสร้างตัวแปร GetNewsArticleUsecase ในที่นี้