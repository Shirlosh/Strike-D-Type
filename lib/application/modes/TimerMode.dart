import 'package:strike_d_type/application/requests/HandleLocalRequests.dart';
import '../../game_page/components/statusBoard/types/TimerType.dart';
import '../requests/HandleRequests.dart';
import 'package:strike_d_type/application/modes/Mode.dart';

class TimerMode extends Mode
{
  HandleRequestsLocal req;
  TimerType boardType;

  TimerMode()
  {
    req = HandleRequestsLocal();
    boardType = TimerType();
  }


  @override
  String mode() { return 'Timer'; }

  @override
  HandleRequests getRequest()  { return req;  }

  @override
  dynamic getStatusBoardContent() {
    return boardType;
  }


}