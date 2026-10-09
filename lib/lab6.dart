import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  void _submit() {
    if (_formKey.currentState!.validate()) {
      print('Form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                  children: [


          @override
          void dispose(){
    _passwordController.dispose();
    super.dispose();
    }

      TextFormField(
      decoration: const InputDecoration(
      labelText: 'Full Name',
      border: OutlineInputBorder(),
    ),
    validator: (value){
    if (value == null || value.trim().isEmpty){
    return 'Full name is required';
    }
    return null;
    },
    ),
    const SizedBox(height: 16,),
    TextFormField(keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(
    labelText: 'Email',
    hintText:'name@narxoz.kz',
    border: OutlineInputBorder(),
    ),
    validator: (value){
    if(value == null || value.trim().isEmpty){
    return 'Email is required';
    }
    if(!value.contains('@')||!value.contains('.')){
    return 'Enter a valid email';
    }
    return null;

    },
    ),
    const SizedBox(height: 16,),
    TextFormField(
    controller: _paswordController,
    obscureText: true,
    decoration: const InputDecoration(
    labelText: 'Password',
    hintText: '8 chars',
    border: OutlineInputBorder(),
    ),
    validator: (value){
    if (value == null || value.isEmpty){
    return 'Password is required';
    }
    if (value.length < 6){
    return 'Password must be at least 6 chars';
    }
    return null;
    },
    ),
    const SizerBox(height:16,),
    TextFormField(
    obscureText: true,
    decoration:const InputDecoration(
    labelText: 'Confirm password',
    border: OutlineInputBorder(),
    ),
    validator(value){
    if (value == null || value.isEmpty) {
    return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
    return 'Passwords do not match';
    }
    return null;
    },
    ),



    const SizedBox(height: 24),
    SizedBox(
    width: double.infinity,
    child: ElevatedButton(
    onPressed: _submit,
    child: const Text('Register')
    ),
    ),
    ],
    )
    ,
    )
    ,
    )
    ,
    );
  }
}