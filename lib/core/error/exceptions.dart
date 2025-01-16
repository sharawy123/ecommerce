abstract class AppExceptions  implements Exception{
  final String message;
  const AppExceptions(this.message);
}
class RemoteException extends AppExceptions{
  RemoteException(super.message);
}
class localException  extends AppExceptions{
  localException (super.message);
}