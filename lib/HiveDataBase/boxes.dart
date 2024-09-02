import 'package:hive/hive.dart';

import 'acount_regeirstor.dart';



class Boxes {
  static Box<AccountRegiersterion> getAccountRegiersterion() =>
      Hive.box<AccountRegiersterion>('userAccount');
}
