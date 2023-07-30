import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'output.dart';
import 'output2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'api.dart';
import 'package:audioplayers/audioplayers.dart';
import 'auto api.dart';

import 'autofill.dart';
class inputpage extends StatefulWidget {
  late List<num> auto;
  inputpage(List<num> aut){
    auto = aut;
  }
  @override
  State<inputpage> createState() => _inputpageState(auto);
}
class _inputpageState extends State<inputpage> {
  late List<num> auto;
  var take;
  _inputpageState(List<num> aut){
    auto = aut;
  }
  void fillup(){
    take = auto[10].toString();
    pHc.text = this.auto[1].toString()=="-1"?"":this.auto[1].toString();
    hardnessc.text = this.auto[2].toString()=="-1"?"":this.auto[2].toString();
    solidsc.text = this.auto[3].toString()=="-1"?"":this.auto[3].toString();
    chloraminesc.text = this.auto[4].toString()=="-1"?"":this.auto[4].toString();
    sulphatesc.text = this.auto[5].toString()=="-1"?"":this.auto[5].toString();
    conductivityc.text = this.auto[6].toString()=="-1"?"":this.auto[6].toString();
    organiccarbonc.text = this.auto[7].toString()=="-1"?"":this.auto[7].toString();
    trihalomethanesc.text = this.auto[8].toString()=="-1"?"":this.auto[8].toString();
    turbidityc.text = this.auto[9].toString()=="-1"?"":this.auto[9].toString();
  }
  void autofill() async{
    var ph = pHc.text;
    var hardness = hardnessc.text;
    var solids = solidsc.text;
    var chloramines = chloraminesc.text;
    var sulphates = sulphatesc.text;
    var conductivity = conductivityc.text;
    var organiccarbon = organiccarbonc.text;
    var trihalomethanes = trihalomethanesc.text;
    var turbidity = turbidityc.text;
    dynamic map = {
      "ph": ph,
      "Hardness": hardness,
      "Solids": solids,
      "Chloramines": chloramines,
      "Sulfate": sulphates,
      "Conductivity": conductivity,
      "Organic_carbon": organiccarbon,
      "Trihalomethanes": trihalomethanes,
      "Turbidity": turbidity
    };
    Map<String, dynamic> df = await autoFill(map);
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Listvalues(df)));
  }
  final player = AudioPlayer();
  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
  var pHc = TextEditingController();
  var hardnessc = TextEditingController();
  var solidsc = TextEditingController();
  var chloraminesc = TextEditingController();
  var sulphatesc = TextEditingController();
  var conductivityc = TextEditingController();
  var organiccarbonc = TextEditingController();
  var trihalomethanesc = TextEditingController();
  var turbidityc = TextEditingController();
  Future<String> fun(int n) async{
    dynamic map = {
      "ph": pHc.text,
      "Hardness": hardnessc.text,
      "Solids": solidsc.text,
      "Chloramines": chloraminesc.text,
      "Sulfate": sulphatesc.text,
      "Conductivity": conductivityc.text,
      "Organic_carbon": organiccarbonc.text,
      "Trihalomethanes": trihalomethanesc.text,
      "Turbidity": turbidityc.text
    };

    var abc =await callApi(map,n);
    String edo=abc.toString();
    if(edo=='Unsafe to drink'){
      edo='not suitable for drinking';
    }
    else
      {
        edo='suitable';
      }
    return edo;
  }
  void clearTextEditingControllers() {
    pHc.clear();
    hardnessc.clear();
    solidsc.clear();
    chloraminesc.clear();
    sulphatesc.clear();
    conductivityc.clear();
    organiccarbonc.clear();
    trihalomethanesc.clear();
    turbidityc.clear();
// Clear other text editing controllers as needed
  }
  // void cun(){
  //   pHc.text = "9.44513";
  //   hardnessc.text = "145.8054";
  //   solidsc.text = "13168.53";
  //   chloraminesc.text="9.444471";
  //   sulphatesc.text="310.5834";
  //   conductivityc.text="529.659";
  //   organiccarbonc.text="8.6097";
  //   trihalomethanesc.text="77.57746";
  //   turbidityc.text="3.875165";
  // }
  @override
  Widget build(BuildContext context) {
    fillup();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //scaffoldMessengerKey: _messangerKey,
      home: SafeArea(
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Drink Pure',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF000000),
            elevation: 0.0,
            actions: [
              TextButton.icon(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Color(0xFF1A1D1F),
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '   Specify values',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color(
                            0xFFFAFAFA)
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                      ),
                      child: Text(
                        'Autofill',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        autofill();
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: pHc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/PH");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'pH',

                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color:Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: hardnessc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Hardness");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45,)
                        ),
                        hintText: 'Hardness',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: solidsc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Solid");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'Solids',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: chloraminesc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Chloramines");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'Chloramines',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: sulphatesc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Sulfate");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'Sulfate',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: conductivityc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Conductivity");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'Conductivity',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: organiccarbonc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Total_organic_carbon");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'Organic_carbon',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: trihalomethanesc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Trihalomethane");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'Trihalomethanes',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                      //controller: rollnumberController,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: turbidityc,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await  goToWebPage("https://en.wikipedia.org/wiki/Turbidity");
                            },
                            icon: Icon(Icons.ac_unit_outlined,color: Colors.black45)
                        ),
                        hintText: 'Turbidity',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Visibility(visible: this.auto[10].toString()=='-1'?false:true,
                      child: Text("Ground Truth : $take",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Text('METHOD',style: TextStyle(color: Color(0xFFF1F6F5),fontSize: 17,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: () async{
                          String a=await fun(1);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Predict(abcd: a.toString())));
                          a=='suitable'?player.play(AssetSource('drinkaudio.mp3')):player.play(AssetSource('notdrinkaudio.mp3'));
                        },style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                        child: Text(
                          '    XG boost    ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async{
                          String a=await fun(2);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Predict(abcd: a.toString())));
                          a=='suitable'?player.play(AssetSource('drinkaudio.mp3')):player.play(AssetSource('notdrinkaudio.mp3'));
                        },style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                        child: Text(
                          '    Random forest    ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async{
                          String a=await fun(2);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Predict(abcd: a.toString())));
                          a=='suitable'?player.play(AssetSource('drinkaudio.mp3')):player.play(AssetSource('notdrinkaudio.mp3'));
                        },style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                        child: Text(
                          '    Logistic regression    ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                      ),
                      child: Text(
                        'Clear',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        clearTextEditingControllers();
                      },
                    ),
                    ],
                  )
                ),
              ),
            ),
          ),
        ),
    );
  }
}