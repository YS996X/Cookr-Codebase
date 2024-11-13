import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.chevron_left,color: Colors.white,size: 30,)),backgroundColor: Colors.black,),
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Cook more with Cookr Pro',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'FREE',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    'PRO',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              _buildFeatureRow('Unlimited Scrolls', true, true),
              _buildFeatureRow('Unlimited Notes', false, true),
              _buildFeatureRow('AI Personal Learning', false, true),
              _buildFeatureRow('Aura Boost - 1.5x', false, true),
              _buildFeatureRow('No ads', false, true),
              const SizedBox(height: 20),
              Padding(
                padding:  const EdgeInsets.symmetric(vertical: 30.0,),
                child: MyButton(onPress: (){},width: Get.width*0.6,borderRadios: 10,color: Colors.yellow[700],titleColor: Colors.black,title: 'Try Cookr Pro',),
              ),
              // MyButton(onPress: (){}),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.amber,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   onPressed: () {
              //     // Handle Pro Upgrade action
              //   },
              //   child: Text(
              //     'Try Pro Now',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),
              const Text(
                '\$2/month, no hidden fees',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String feature, bool freeIncluded, bool proIncluded) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            feature,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),

          Row(
            children: [
              Icon(
                freeIncluded ? Icons.check : Icons.clear,
                color: freeIncluded ? Colors.white : Colors.grey,
              ),
              const SizedBox(width: 35),
              Icon(
                proIncluded ? Icons.check : Icons.clear,
                color: proIncluded ? Colors.white : Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UpgradeDialogue extends StatelessWidget {
  const UpgradeDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title:Text('Are you Sure You Wanna Cancel?') ,
    );
  }
}

