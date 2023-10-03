import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? dioException;

  DataState({this.data, this.dioException});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioException dioException) : super(dioException: dioException);
}
//  TODO: ການໃຊ້ຄາສ DataState<T> ແລະ ຄາສລູກເຊັ່ນ DataSuccess<T> ແລະ DataFailure<T> ຈະຊ່ວຍໃນການສະແດງສະຖານະຂໍ້ມູນທີ່ໄດ້ຮັບຈາກການດືງຂໍ້ມູນ ຫຼື ປະມວນຜົນ ໂດຍສາມາດເກັບຂໍ້ມູນຫຼືຂໍ້ຜິດພາດທີ່ເກີດຂື້ນໄດ້ ແລະ ໃຊ້ໃນການກວດສອບສະຖານະ ແລະ ປັບປຸງຂໍ້ມູນທີ່ສະແດງໃນອິນເຈີເັສຜູ້ໃຊ້ແບບເໝາະສົມ