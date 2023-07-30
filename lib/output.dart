
import 'package:flutter/material.dart';
class Predict extends StatelessWidget {
  // const Predict({Key? key}) : super(key: key);
  Text w=Text(
  'Caution',
  style: TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lora',
      color: Colors.red
  ),
  );
  Text r=Text(
    'Pure',
    style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lora',
        color: Colors.green
    ),
  );
  Icon fg = Icon(Icons.close,size: 150,color: Colors.red,);
  Icon xg = Icon(Icons.check_circle,size: 150,color: Colors.green,);
  Row d=Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 20,),
      Container(
        padding: EdgeInsets.all(20),
        child: Image(
          //alignment: Alignment.center,
          height: 300,
          width: 280,
          image: NetworkImage(
              'https://i.pinimg.com/564x/ce/4e/6e/ce4e6eb2b32c86a000cbca990953765a.jpg'
          ),
        ),
      ),
      SizedBox(width: 20,)
    ],
  );
  Row n= Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 20,),
      Container(
        padding: EdgeInsets.all(20),
        child: Image(
          height: 300,
          width: 280,
          image: NetworkImage(
            'https://i.pinimg.com/564x/1f/3c/73/1f3c736a02d5c1d5af7646499fa4aae5.jpg'
          ),
        ),
      ),
      SizedBox(width: 20,)
    ],
  );
  String abcd;
  Predict({required this.abcd});
  late String bc;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('RESULT',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 22
          ),

        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0,
        actions: [

        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.abcd=="not suitable for drinking"?fg:xg,
              Text(
                this.abcd=="not suitable for drinking"?"":"",
                ),
                this.abcd=="not suitable for drinking"? w:r,
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.water_drop,color: Colors.blue,size: 35,),
                  Text(
                    abcd,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora',
                        color: Colors.black
                    ),
                  ),

                ],

              ),
              Row(
                children: [
                  this.abcd=="not suitable for drinking"? n:d,
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}