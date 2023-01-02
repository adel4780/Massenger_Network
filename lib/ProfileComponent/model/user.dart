class User {
  late String imagePath;
  late String name;
  late String email;
  late String phone;
  late String password;
/*  bool showName;
  bool showEmail;
  bool showPhone;
  Erfsn
  Showing Information for Other Users. How can we Write ?
*/
  User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}
// Erfan
// inja ye user sakhtam, bayad vaghti miad profile,
// information ro befreste bara profie Page
// user ba server besaz
User user = User(
  imagePath:
  'img/person.png',
  name: 'Sara',
  email: 'sarah.abs@gmail.com',
  phone: '09138795463',
  password: '123456',
);
