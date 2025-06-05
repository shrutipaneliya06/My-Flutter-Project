void main(List<String> args) {
  List empp = [
    {"name": "shruti", "category": "s1", "salary": 40000},
    {"name": "pooja", "category": "s1", "salary": 30000},
    {"name": "mancy", "category": "s2", "salary": 50000},
    {"name": "harsh", "category": "s3", "salary": 5000},
    {"name": "hiren", "category": "s4", "salary": 6000},
    {"name": "krina", "category": "s2", "salary": 40000},
    {"name": "tisha", "category": "s3", "salary": 20000},
  ];

  emp(name: 'shruti', category: 's1', salary: 10000);

  switch(){

  }
}

class emp {
  String name;
  String category;
  int salary;
  emp({required this.name, required this.category, required this.salary});
}
