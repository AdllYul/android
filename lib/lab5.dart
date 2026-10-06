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
      body: SingleChildScrollView(
      child:Column(
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
          Padding(
            padding: const EdgeInsets.all(16),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wireless Headphone',
                      style: TextStyle(fontSize:22,fontWeight:FontWeight.bold  ),
                    ),
                    const Text(
                      '\$79.99',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                const Row(
                  children:[
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Icon(Icons.star_half, color: Colors.amber, size: 20),
                    SizedBox(width:8),
                    Text('4.5 (128 reviews)'),
                  ],
                ),
                const SizedBox(height: 16),
                const Wrap(
                  spacing:8,
                  runSpacing: 8,
                  children:[
                    Chip(label: Text('Electronics')),
                    Chip(label: Text('Audio')),
                    Chip(label: Text('Wireless')),
                    Chip(label: Text('Bluetooth 5.0')),
                    Chip(label: Text('Noise Cancelling')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding:EdgeInsets.all(16),
          child:Row(
            children:[
              Expanded(
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                child: const Text('Add to cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



