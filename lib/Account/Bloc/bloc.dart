// counter_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../HiveDataBase/acount_regeirstor.dart';
import '../../HiveDataBase/boxes.dart';
import '../../HiveDataBase/user_account_model.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';


class AccountBloc extends Bloc<CounterEvent, CounterState> {
  AccountBloc() : super(CounterInitial(counter: 0));

  Future<void> addAccountRegiseristion(
      List<UserAccountModel> userAccount) async {
    final transaction = AccountRegiersterion()
      ..userAccount = userAccount
      ..createdDate = DateTime.now();


    // Print the details of the transaction for debugging
    print("Transaction Details:");
    print("Created Date: ${transaction.createdDate}");
    print("User Accounts:");
    for (var account in transaction.userAccount) {
      print(" - UserName: ${account.userName}, Password ${account.password}");
    }
    print("Lectures:");

    final box = Boxes.getAccountRegiersterion();
    box.add(transaction);

    print("Transaction added to the box.");
  }

  void deleteAccount (account) {
    account.delete();
  }
}
