import 'package:strike_d_type/application/requests/HandleLocalRequests.dart';
import '../../game_page/components/statusBoard/modes/TimerMode.dart';
import '../requests/HandleRequests.dart';
import 'package:strike_d_type/application/modes/Mode.dart';

class Timer extends Mode
{
  HandleRequestsLocal req;
  TimerMode boardType;

  Timer()
  {
    req = HandleRequestsLocal();
    boardType = TimerMode();
  }


  @override
  String mode() { return 'local'; }

  @override
  HandleRequests getRequest()  { return req;  }

  @override
  dynamic getStatusBoardContent() {
    return boardType;
  }


}