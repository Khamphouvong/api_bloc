import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}
// TODO: ການໃຊ້ຄາສ Failure ແລະ ຄາສລຼກເຊັ່ນ ServerFailure ແລະ ConnectionFailure ຈະຊ່ວຍໃນການຈັດການຂໍ້ຜິດພາດໃນແອບ ພິເຄຊັນ 
//ແລະ ສາມາດສືບທອດຄຸນສົມບັດຂອງ Equatable ເພື່ອໃຊ້ໃນການປຽບທຽບ ແລະ ກວດສອບຂໍ້ຜິດພາດທີ່ເກີດຂື້ນໃນສະຖານະການຕ່າງໆໄດ້