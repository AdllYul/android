
void checkBalance({required String name, required double balance}) =>
    print('User name: $name || Balance: $balance');
double deposit({required double currentBalance, required double amount}) {
  double depositAmount = amount ?? 0.0;

  if (depositAmount <= 0) {
    print('Fail: Invalid amount ($depositAmount).');
    return currentBalance;
  }
  double newBalance = currentBalance + depositAmount;
  print('Deposit receipt');
  print('Deposited this value: $amount');
  print('New balance: $newBalance');
  return newBalance;
}

  double withdraw({
    required String name,
    required double currentBalance,
    double? amount,
    int? pinCode}){

    print("TRANSACTION ATTEMPT ($name)");
    int enteredPin = pinCode ?? 0000;
    if (enteredPin != 1234){
      print('Transaction declined: Incorrect pin code $enteredPin.\n');
      return currentBalance;
    }
    double withdrawAmount = amount ?? 0.0;
    if (withdrawAmount <= 0){
      print('Transaction failed. Invalid withdraw amount $withdrawAmount');
      return currentBalance;
    }
    if(withdrawAmount > currentBalance){
      print('Transaction declined: insufficient fund');
      print('Requested: $withdrawAmount || Avaliable: $currentBalance');
      return currentBalance;
    }
    double newBalance = currentBalance - withdrawAmount;
    return newBalance;


  }

void main(){
  double myBalance = 10000.0;
  String userName = 'Adilbek';

  checkBalance(name: userName, balance: myBalance);

  myBalance = deposit(currentBalance: myBalance, amount: 2000.0);

  myBalance = withdraw(name: userName, currentBalance: myBalance,amount: 2000.0,pinCode: 1234);
}
