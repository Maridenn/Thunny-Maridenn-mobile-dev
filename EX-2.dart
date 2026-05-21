class BankAccount {
  final String _name;
  final int _id;
  double _balance;

  BankAccount({required String name, required int id, double balance = 0})
    : _name = name,
      _id = id,
      _balance = balance;

  String get name => _name;
  int get id => _id;
  double get balance => _balance;

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception("Inefficient balance! could not withdraw.");
    } else {
      _balance -= amount;
    }
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  final List<BankAccount> _account = [];
  final String name;

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _account) {
      if (account.id == accountId) {
        throw Exception("ID already exists!");
      }
    }

    BankAccount newAccount = BankAccount(name: accountOwner, id: accountId);
    _account.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
