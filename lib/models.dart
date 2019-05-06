class Employee {
  final String name;
  final String id;
  final String age;
  final String salary;

  Employee(
      {this.name,
        this.id,
        this.age,
        this.salary});

  factory Employee.fromJson(Map<String, dynamic> json){
    return Employee(
      name: json["employee_name"],
      id: json["id"],
      age: json["employee_age"],
      salary: json["employee_salary"]
    );
  }
}
