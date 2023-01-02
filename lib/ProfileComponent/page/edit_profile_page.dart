import 'package:flutter/material.dart';
import 'package:massenger/ProfileComponent/model/user.dart';
import 'package:massenger/ProfileComponent/widget/appbar_widget.dart';
import 'package:massenger/ProfileComponent/widget/button_widget.dart';
import 'package:massenger/ProfileComponent/widget/profile_widget.dart';
import 'package:massenger/ProfileComponent/widget/textfield_widget.dart';
import 'package:validators/validators.dart';
import '../../services/socket_service.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}
class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController = TextEditingController(text: user.name);
  late TextEditingController emailController= TextEditingController(text: user.email);
  late TextEditingController phoneController= TextEditingController(text: user.phone);
  late TextEditingController passwordController= TextEditingController(text: user.password);
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) =>
      Builder(
          builder: (context) =>
              Scaffold(
                key: scaffoldkey,
                appBar: buildAppBar(context),
                body: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  physics: BouncingScrollPhysics(),
                  children: [
                    ProfileWidget(
                      imagePath: user.imagePath,
                      isEdit: true,
                      //Erfan Choose profile Picture
                      onClicked: () async {
                        //Choose Profile picture from User
                      /*  var message;
                        SocketService.setReceiverID("Server");
                        SocketService.sendMessage("SetProfile",message);
                      */},
                    ),
                    const SizedBox(height: 24),
                    Form(
                      key: formkey,
                      child: Column(
                        children:[
                          TextFieldWidget(
                            label: 'Name',
                            text: user.name,
                            textcontroller: nameController,
                            validator: (value) {},
                          ),
                          SizedBox(height: 24),
                          TextFieldWidget(
                            label: 'Email',
                            text: user.email,
                            textcontroller: emailController,
                            validator: (value) {
                              if (!isEmail(value!)) {
                                return "E-mail is not valid";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFieldWidget(
                            label: 'Phone',
                            text: user.phone,
                            textcontroller: phoneController,
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Please Enter a Phone Number";
                              }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                                return "Please Enter a Valid Phone Number";
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          TextFieldWidget(
                            label: 'Password',
                            text: user.password,
                            textcontroller: passwordController,
                            validator: (value) {
                              if (value!.toString().length < 5) {
                                // mistake
                                return "Password > 5 character";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(child: buildSaveButton(context)),
                  ],
                ),
              ),
        );
  Widget buildSaveButton(BuildContext context) => ButtonWidget(
    text: 'Save',
    onClicked: () {
     // Erfan
      // Edit profile ro befrest be server
      // baraye user ham zakhirash kon
    if(formkey.currentState!.validate()){
      user.name = nameController.text;
      user.email = emailController.text;
      user.phone = phoneController.text;
      user.password = passwordController.text;
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, "/home");
      /* var message ;
      SocketService.setReceiverID("Server");
      SocketService.sendMessage("ChangeInfo",message.toString());
      Navigator.pop(context);
      Navigator.push(context,MaterialPageRoute(builder: (context) =>ProfilePage()));
    */
      }
    },
  );
}
