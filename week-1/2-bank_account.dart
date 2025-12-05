class BankAccount {
  num _balance = 0;

  /// Creates a bank account with an initial balance
  /// If initialValue is negative, balance defaults to 0
  BankAccount(num initialValue)
    : _balance = initialValue >= 0 ? initialValue : 0;

  num get balance => _balance;

  // only accepts non-negative values
  set balance(num value) {
    if (value >= 0) {
      _balance = value;
    } else {
      print('Invalid balance value');
    }
  }

  void deposit(num value) {
    if (value <= 0) {
      print('Please enter a valid amount');
    } else {
      _balance += value;
      print('Current balance is $_balance');
    }
  }

  void withdraw(num value) {
    if (value <= 0) {
      print('Please enter a valid amount');
    } else if (value > _balance) {
      print('Insufficient balance');
    } else {
      _balance -= value;
    }
  }
}
