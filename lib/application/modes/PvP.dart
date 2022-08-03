import 'package:strike_d_type/application/requests/HandleOnlineRequests.dart';
import '../../game_page/components/statusBoard/modes/PvPMode.dart';
import '../requests/HandleRequests.dart';
import 'Mode.dart';

class PvP extends Mode
{
  HandleRequestsOnline req;
  PvPMode boardType;


  PvP()
  {
    req = new HandleRequestsOnline();
    boardType = new PvPMode();
  }

  @override
  String mode() { return 'online'; }

  @override
  HandleRequests getRequest()  { return req;  }

  @override
  dynamic getStatusBoardContent() {
    return boardType;
  }

}