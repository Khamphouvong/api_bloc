import 'package:equatable/equatable.dart';

class ArticlesListEntity extends Equatable {
  final List<ArticleEntity>? articlesEntity;

  const ArticlesListEntity({
    this.articlesEntity,
  });

  @override
  List<Object?> get props => [articlesEntity];
}

class ArticleEntity extends Equatable {
  final String? authorEntity;
  final String? titleEntity;
  final String? descriptionEntity;
  final String? urlEntity;
  final String? urlToImageEntity;
  final String? publishedAtEntity;
  final String? contentEntity;

  const ArticleEntity({
    this.authorEntity,
    this.titleEntity,
    this.descriptionEntity,
    this.urlEntity,
    this.urlToImageEntity,
    this.publishedAtEntity,
    this.contentEntity,
  });

  @override
  List<Object?> get props => [
        authorEntity,
        titleEntity,
        descriptionEntity,
        urlEntity,
        urlToImageEntity,
        publishedAtEntity,
        contentEntity
      ];
}

// โค้ดนี้เป็นส่วนหนึ่งของการกำหนด Entity (Entity) สำหรับข้อมูลบทความข่าวในแอปพลิเคชัน โดยประกอบด้วยคลาส ArticlesListEntity
//และ ArticleEntity ที่สืบทอดมาจาก Equatable ซึ่งเป็นไลบรารีที่ช่วยในการเปรียบเทียบและระบุความเท่ากันของอ็อบเจกต์ใน Dart โดยมีคุณสมบัติและเมธอดดังนี้:

// 1 ArticlesListEntity เป็นคลาสที่ระบุรายการของอ็อบเจกต์ ArticleEntity ในรูปแบบของ List โดยมีตัวแปร articlesEntity เป็น
//List ของ ArticleEntity ซึ่งสามารถเป็นค่า null ได้

// 2 ArticleEntity เป็นคลาสที่ระบุรายละเอียดของอ็อบเจกต์บทความข่าว ซึ่งประกอบด้วยตัวแปรต่าง ๆ เช่น authorEntity, titleEntity,
//descriptionEntity, urlEntity, urlToImageEntity, publishedAtEntity, และ contentEntity ซึ่งสามารถเป็นค่า null ได้

// 3 props เป็นเมธอดที่ใช้ในการเปรียบเทียบและระบุความเท่ากันของอ็อบเจกต์ ArticlesListEntity และ ArticleEntity
//โดยระบุว่าคุณสมบัติทั้งหมดของอ็อบเจกต์คือ articlesEntity หรือคุณสมบัติทั้งหมดของอ็อบเจกต์ ArticleEntity