class User{
  String? id;
  String? name;
  int? age;
  String? gender;

  User(
    {
      required this.id,
      required this.name,
      this.age,
      this.gender
    }
  );

}