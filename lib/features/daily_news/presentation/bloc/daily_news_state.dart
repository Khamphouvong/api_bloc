part of 'daily_news_bloc.dart';

sealed class DailyNewsState extends Equatable {
  const DailyNewsState();

  @override
  List<Object> get props => [];
}

class DailyNewsLoading extends DailyNewsState {
  const DailyNewsLoading();
}

class DailyNewsLoaded extends DailyNewsState {
  final ArticlesListEntity? listNewsArticle;
  const DailyNewsLoaded(this.listNewsArticle);
}

class DailyNewsError extends DailyNewsState {
  final String? error;
  const DailyNewsError(this.error);
}
//  โค้ดที่คุณให้มากำหนดการแสดงสถานะสำหรับคุณลักษณะข่าวประจำวัน โครงสร้างของคลาสที่ถูกใช้ในการแทนสถานะมีลักษณะดังนี้:

//  คลาส DailyNewsState เป็นคลาสหลักในโครงสร้างของสถานะและสืบทอดมาจากคลาส Equatable ซึ่งแสดงว่าสามารถเปรียบเทียบความเท่ากันได้กับ
// อินสแตนซ์อื่นของคลาสเดียวกัน

//  คลาส DailyNewsLoading แสดงสถานะเมื่อข้อมูลข่าวประจำวันกำลังโหลดหรือกำลังรับข้อมูล โดยไม่มีข้อมูลเพิ่มเติมและมีการสร้างอินสแตนซ์เดียวโดย
//ใช้คอนสตรักเตอร์ const

//  คลาส DailyNewsLoaded แสดงสถานะเมื่อข้อมูลข่าวประจำวันถูกโหลดเสร็จสมบูรณ์ มีการรับพารามิเตอร์ ArticlesListEntity ที่เป็นอ็อบเจกต์ที่เก็บ
//รายการข่าว ใช้คอนสตรักเตอร์ const พร้อมกับการส่งอ็อบเจกต์ ArticlesListEntity เป็นพารามิเตอร์

//  คลาส DailyNewsError แสดงสถานะเมื่อเกิดข้อผิดพลาดในระหว่างการโหลดข้อมูลข่าวประจำวัน มีการรับพารามิเตอร์ String ที่เป็นข้อความข้อผิดพลาด
//เป็นอ็อบเจกต์ ใช้คอนสตรักเตอร์ const พร้อมกับการส่งข้อความข้อผิดพลาดเป็นพารามิเตอร์

//  ทั้งสามคลาสมีการแทนที่เมธอด props จากคลาส Equatable โดยเมธอดนี้คืนค่ารายการของคุณสมบัติที่ใช้ในการกำหนดความเท่ากันระหว่างอินสแตนซ์ของ
//คลาส ในกรณีนี้ รายการ props ว่างเปล่าสำหรับทุกคลาส เป็นสัญลักษณ์ว่าอินสแตนซ์ของคลาสเดียวกันถือว่าเท่ากันหากประเภทคลาสตรงกัน

//  โดยรวมแล้ว โค้ดนี้ให้การแสดงสถานะพื้นฐานสำหรับการจัดการสถานะของคุณลักษณะข่าวประจำวันใน Dart หรือ Flutter
