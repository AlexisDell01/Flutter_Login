import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/login_form_provider.dart';
import 'package:flutter_application_2/ui/input_decorations.dart';
import 'package:flutter_application_2/widgets/auth_background.dart';
import 'package:flutter_application_2/widgets/card_container.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 // final _usernameController = TextEditingController();
  ///final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 250,
        ),
        CardContainer(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text('Login', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 20),
              ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: _loginForm(),
                ),
              const SizedBox(height: 50),
              const Text(
                'Sign in or create a new account',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 50)
            ],
          ),
        )
      ]),
    )));
  }


}

// ignore: camel_case_types
class _loginForm extends StatelessWidget{
  @override
    Widget build(BuildContext context){
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
            //controller: _usernameController,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Ingresa un nombre propio solamente sin apellidos",
                labelText: "Usuario",
                prefixIcon: Icons.email),
              validator :(value) {
                String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                ?null
                :'Input a valid Email';


                 },
                ),

        TextFormField(
          
          decoration: InputDecorations.authInputDecoration(
            hintText: "Debe tener letras y numeros",
            labelText: "Password",
            prefixIcon: Icons.lock_open,
          ),
          validator: (value){
            return (value != null && value.length>=6)
            ?null
            :'Password must have minimum 6 chars';

          },
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        Container(
            margin: const EdgeInsets.only(top: 20.0),
            child:
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                  elevation: 0,
                  disabledColor: Color(0xFF2D2929),
                  color: Color.fromRGBO(170, 15, 217, 1),
                  onPressed: loginForm.isLoading ? null : ()async {
                    FocusScope.of(context).unfocus();

                    if(!loginForm.isValidForm()){
                      return;
                    }
                    else{
                      loginForm.isLoading=true;

                      await Future.delayed(Duration(seconds: 2));

                      //TO DO Login Authentication

                      loginForm.isLoading=false;
                      Navigator.pushReplacementNamed(context, 'home');
                    }

                  },
                   child: Text(
                    loginForm.isLoading ? 'Wait':'Sign in',
                    style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    ),
                    )
      ]),
    );
  }

  void onLogin() {
    //final username = _usernameController.text.trim();
    //final password = _passwordController.text.trim();

    //print("username: $username");
    //print("password: $password");
  }

}