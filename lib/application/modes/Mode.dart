import '../requests/HandleRequests.dart';

abstract class Mode
{
  String mode();
  HandleRequests getRequest();
  dynamic getStatusBoardContent();
}