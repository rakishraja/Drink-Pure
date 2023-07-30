// import 'package:flutter/material.dart';
// class output extends StatelessWidget {
//   // const output({Key? key}) : super(key: key);
//   String va;
//   Icon fg = Icon(Icons.block_outlined,size: 150,color: Colors.red,);
//   Icon xg = Icon(Icons.check_circle,size: 150,color: Colors.green,);
//   output({required this.va});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "output"
//         ),
//       ),
//       body: Container(
//         child: Center(
//           child: Text(
//           ),
//
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
class Predict2 extends StatelessWidget {
  // const Predict({Key? key}) : super(key: key);
  Icon fg = Icon(Icons.block_outlined,size: 150,color: Colors.red,);
  // Icon xg = Icon(Icons.check_circle,size: 150,color: Colors.green,);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            fg,
            Text(
              "WARNING",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lora',
                  color: Colors.red

              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Not suitable for drinking',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lora'
              ),
            ),
          ],
        ),
      ),
    );
  }
}