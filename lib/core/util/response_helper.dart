import 'dart:io';
import 'package:api_bloc/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
// TODO: ໃຊ້ສຳຫຼັບຈັດການຂໍ້ຜິດພາດທີ່ເກີດຂື້ນລະຫວ່າງການເຮັດວຽກຂອງ Dio ແລະ ຈະສົ່ງຂໍ້ຜຶດພາດມາຕາມຮູບແບບທີ່ເກິດຂື້ນໃນຂໍ້ຜິດພາດໃນແອບ

class ResponseHelper {
  static Exception returnResponse(DioException dioException) {
    try {
      if (dioException.error.runtimeType == SocketException &&
          dioException.type == DioExceptionType.connectionError) {
        return const SocketException("No Internet");
      } else if (dioException.type == DioExceptionType.connectionTimeout) {
        return ConnectionException("Connection Timeout");
      } else {
        return ServerException(
          dioException.message!,
        );
      }
    } catch (e) {
      return ServerException(e.toString());
    }
  }
}
