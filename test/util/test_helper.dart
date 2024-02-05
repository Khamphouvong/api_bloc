// Error class
import 'package:api_bloc/core/errors/failure.dart';

class FetchDataError extends Failure {
  const FetchDataError(super.message);
}
