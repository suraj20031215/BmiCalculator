import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var result="";
  var wtController =TextEditingController();
  var ftController =TextEditingController();
  var inController =TextEditingController();
var bgColor;
  @override
  Widget build(BuildContext context) {
    var md= MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('BMI Calculator',style: TextStyle(color: Colors.white),),
      ),


      body: Center(
        child: Container(
          color: bgColor,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text('BMI',style: TextStyle(fontSize: 34,color: Colors.black),),

            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: wtController,
                    decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    label: Text('Enter your Weight'),
                      prefixIcon: Icon(Icons.line_weight),

                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(
                      height:20
                  ),

                  Row(

                    children: [
                      Expanded(

                        child: TextFormField(
                          controller: ftController,
                          decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                            label: Text('Height in FT'),
                            prefixIcon: Icon(Icons.height),

                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),



                      const SizedBox(
                        width: 10,
                      ),




                      Expanded(
                        child: TextFormField(
                          controller: inController,
                          decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                            label: Text('Height in IN'),
                            prefixIcon: Icon(Icons.height),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),

                    ],
                  ) ,

                  const SizedBox(
                      height:10
                  ),


                  SizedBox(
                    width: md.width*0.9,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                      onPressed: (){
                        var wt=wtController.text.toString();
                        var ft= ftController.text.toString();
                        var inch= inController.text.toString();
                        if(wt!="" && ft!="" && inch!=""){
                          var iwt= int.parse(wt);
                          var ift= int.parse(ft);
                          var iInch= int.parse(inch);
                          var tInch= (ift*12)+iInch;
                          var tcm=tInch*2.54;
                          var tM= tcm/100;
                          var bmi= iwt/(tM*tM);
                          var msg="";

                          if(bmi<18){
                            msg="You're UnderWeight";
                            bgColor=Colors.yellow.shade100;
                          }
                          else if(bmi>=18&& bmi<25){
                            msg="You're Healthy";
                            bgColor=Colors.lightGreen.shade100;
                          }
                          else{
                            msg="You're OverWeight";
                            bgColor=Colors.red.shade100;
                          }

                          setState(() {
                            result= "$msg \n Your BMI = ${bmi.toStringAsFixed(2)}";
                          });
                        }
                        else
                        {
                          bgColor=Colors.white;
                          setState(() {
                            result = "Please Enter requied Filled";
                          });
                        }

                      },
                      child: const Text('Calculate',style: TextStyle(fontSize: 19,color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(result,style: const TextStyle(fontSize:24),),



                ],
              ),



            ),


          ],),
        ),
      )
    );
  }
}
