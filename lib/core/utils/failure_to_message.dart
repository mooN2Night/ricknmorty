import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/core/error/failure.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppConstants.serverFailure;
    case CacheFailure:
      return AppConstants.cacheFailure;
    default:
      return AppConstants.unexpectedFailure;
  }
}