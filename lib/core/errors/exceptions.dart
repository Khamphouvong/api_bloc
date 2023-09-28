// TODO: ທັ້ງສາມຄາສລຼກຂອງ AppException ມີຄຸນສົມບັດແລະ ເມຕອດຄືກັບ AppException ເຖິງຈະບໍ່ມີການກຳໜົດຄຸນສົມບັດ ຫຼື ເມດຕອດສະເພາະໃດໆໃນຄາສລູກທັງສາມ
abstract class AppException {
  final String message;

  AppException(this.message);
}

class ServerException extends AppException implements Exception {
  ServerException(String message) : super(message);
}

class CacheException extends AppException implements Exception {
  CacheException(String message) : super(message);
}

class ConnectionException extends AppException implements Exception {
  ConnectionException(String message) : super(message);
}

// คลาส AppException เป็นคลาสแม่ที่กำหนดข้อผิดพลาดที่เกิดขึ้นในแอปพลิเคชัน โดยมีคุณสมบัติและเมธอดดังนี้:

// message เป็นสตริงที่เก็บข้อความของข้อผิดพลาดที่เกิดขึ้น
// AppException มีคอนสตรัคเตอร์ที่รับพารามิเตอร์เป็น message และกำหนดค่าให้กับตัวแปร message
// ServerException, CacheException, และ ConnectionException เป็นคลาสลูกของ AppException และทั้งสามคลาสเป็น Exception ที่ระบุว่าเป็นตัวกำหนดข้อผิดพลาดที่เกิดขึ้นในแอปพลิเคชัน
// ServerException เป็นคลาสที่กำหนดข้อผิดพลาดที่เกิดขึ้นที่เซิร์ฟเวอร์ โดยมีคอนสตรัคเตอร์ที่รับพารามิเตอร์เป็น message และส่งต่อไปยังคลาสแม่ AppException เพื่อกำหนดค่าให้กับตัวแปร message

// CacheException เป็นคลาสที่กำหนดข้อผิดพลาดที่เกิดขึ้นในการเข้าถึงแคช (cache) โดยมีคอนสตรัคเตอร์ที่รับพารามิเตอร์เป็น message และส่งต่อไปยังคลาสแม่ AppException เพื่อกำหนดค่าให้กับตัวแปร message

// ConnectionException เป็นคลาสที่กำหนดข้อผิดพลาดที่เกิดขึ้นในการเชื่อมต่อ โดยมีคอนสตรัคเตอร์ที่รับพารามิเตอร์เป็น message และส่งต่อไปยังคลาสแม่ AppException เพื่อกำหนดค่าให้กับตัวแปร message

// โดยทั้งสามคลาสลูกของ AppException มีคุณสมบัติและเมธอดเหมือนกับ AppException แม้จะไม่มีการกำหนดคุณสมบัติหรือเมธอดเฉพาะใด ๆ ในคลาสลูก