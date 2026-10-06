import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:ProductPage(),
      );
  }
}
class ProductPage extends StatelessWidget{
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Column(
        children:[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Stack(
              children:[
                Container(
                  color: Colors.indigo.shade100,
                  child: const Center(
                    child: Icon(Icons.image, size: 80),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.bookmark, color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



