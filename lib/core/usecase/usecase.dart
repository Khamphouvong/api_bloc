import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Type> call(Params params);
}
// TODO:โค้ดนี้เป็นส่วนหนึ่งของการใช้งาน Usecase (ยูสเคส) ในแอปพลิเคชัน โดยมีคลาส Usecase<Type, Params> เป็นคลาสแม่ที่กำหนดโครงสร้างของ Usecase ที่ใช้ในการประมวลผลหรือการดำเนินการต่าง ๆ ซึ่งประกอบด้วยเมธอดดังนี้:

class GetNewsArticle extends Equatable {
  // TODO: ต่อมาคลาส GetNewsArticle เป็นตัวอย่างของการสร้าง Usecase ที่สืบทอดมาจาก Equatable ซึ่งเป็นไลบรารีที่ช่วยในการเปรียบเทียบและระบุความเท่ากันของอ็อบเจกต์ใน Dart โดยมีคุณสมบัติและเมธอดดังนี้:
  final String country;
  final String category;
  final String apiKey;
  // TODO: country, category, apiKey เป็นพารามิเตอร์ที่จำเป็นสำหรับการดึงข่าวบทความ ซึ่งระบุประเทศ (country), หมวดหมู่ (category), และกุญแจ API (apiKey)

  const GetNewsArticle({
    required this.country,
    required this.category,
    required this.apiKey,
  });
  // TODO: const GetNewsArticle() เป็นคอนสตรัคเตอร์ที่ใช้ในการสร้างอ็อบเจกต์ GetNewsArticle โดยรับพารามิเตอร์ country, category, และ apiKey และกำหนดค่าให้กับตัวแปรที่เกี่ยวข้อง

  @override
  List<Object> get props => [country, category, apiKey];
  // TODO: prop ເປັນເມດຕອດທີ່ໃຊ້ໃນການປຽບທຽບ ແລະ ລະບຸຄວາມເທົ່າກັນຂອງ ອອບເຈກ GetNewsArticle ໂດຍລະບຸວ່າຄຸນສົມບັດທັ້ງໝົດຂອງອອບເຈກຄື country, category, ແລະ apiKey
}
