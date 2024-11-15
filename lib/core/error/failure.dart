///Ошибки будут использоваться в различныз методах и слоях приложения
//TODO в примере Failure наследуется от Equatable, но библиотека старая, вместо неё нужно использовать Freezed
abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}