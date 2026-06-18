enum Skill {
  flutter,
  dart,
  other;

  @override
  String toString() {
    switch (this) {
      case Skill.flutter:
        return "flutter";
      case Skill.dart:
        return "dart";
      case Skill.other:
        return "other";
    }
  }
}

class Address {
  String city;
  String street;
  String zipCode;

  Address(this.street, this.city, this.zipCode);

  @override
  String toString() {
    return "\n\tst: $street, \n\tcity: $city, \n\tzip code: $zipCode";
  }
}

class Employee {
  final String _name;
  static const double baseSalary = 200;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._address, this._skills, this._yearsOfExperience);

  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
    : _name = name,
      _skills = [Skill.flutter, Skill.dart],
      _address = address,
      _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = baseSalary;
    salary += yearsOfExperience * 1000;

    for (var skill in skills) {
      switch (skill) {
        case Skill.flutter:
          salary += 200;
          break;
        case Skill.dart:
          salary += 100;
          break;
        case Skill.other:
          salary += 100;
          break;
      }
    }
    return salary;
  }

  @override
  String toString() {
    return "Employee: $_name"
        "\nSalary: ${computeSalary()}"
        "\nSkills: ${skills.join(', ')}"
        "\nAddress: $_address"
        "\nYear of experience: $_yearsOfExperience";
  }
}

void main() {
  var add1 = Address("420", "Phnom Penh", "1200");
  var add2 = Address("120", "Battam Bong", "1221");

  var emp1 = Employee("Denno", add1, [Skill.flutter, Skill.other], 6);
  var emp2 = Employee.mobileDeveloper("Xios", add2, 7);

  print(emp1);
  print(emp2);
}
