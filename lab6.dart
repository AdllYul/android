import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget{
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}
class _RegistrationPageState extends State<RegistrationPage>{
  final _formKey = GlobalKey<FormState>();

  void _submit(){
    if (_formKey.currentState!.validate()){
      print('Form is valid');
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Register')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}