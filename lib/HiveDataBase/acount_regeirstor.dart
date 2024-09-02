import 'package:hive/hive.dart';
import 'package:your_project_name/HiveDataBase/user_account_model.dart';

part 'acount_regeirstor.g.dart';
@HiveType(typeId: 1)
class AccountRegiersterion extends HiveObject{
  @HiveField(2)
  late DateTime createdDate;
  @HiveField(3)
  late List<UserAccountModel> userAccount;

}