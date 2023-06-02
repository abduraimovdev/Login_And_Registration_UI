class User {
  String id;
  String name;
  String email;
  String password;

  User(this.id, this.name, this.email,  this.password);

  @override
  String toString() {
    return 'User{name: $name, email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              email == other.email &&
              password == other.password;

  @override
  int get hashCode => Object.hash(id, name);
}