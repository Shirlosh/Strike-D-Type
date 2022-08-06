import 'package:strike_d_type/application/requests/HandleOnlineRequests.dart';

import '../../game_page/components/statusBoard/types/PvPType.dart';
import '../requests/HandleRequests.dart';
import 'Mode.dart';

class PvPMode extends Mode
{
  HandleRequestsOnline req;
  PvPType boardType;


  PvPMode()
  {
    req = new HandleRequestsOnline();
    boardType = new PvPType();


  }

  @override
  String mode() { return 'PvP'; }

  @override
  HandleRequests getRequest()  { return req;  }

  @override
  dynamic getStatusBoardContent() {
    return boardType;
  }


}