import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'Color.dart';
void main()
{
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  /////////////////variable//////////////
  var input="";
  var output="";

  onButtonclick(value)
  {
    if(value=="AC")
      {
        input="";
        output="";
      }else if(value=="<")
        {
          input=input.substring(0,input.length-1);
        }
       else if(value=="=")
      {
        var userinput=input;
        userinput=input.replaceAll("x","*");
        Parser parser=new Parser();
        Expression expression=parser.parse(userinput);
        ContextModel cm = ContextModel();
        var finalval=expression.evaluate(EvaluationType.REAL,cm);
        print(finalval);
        output=finalval.toString();

      }else{
         input=input+value;
    }
    setState(() {});

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            width: double.maxFinite,
            color: Colors.red,
            child: Column(
              children: [
                Expanded(flex:1,
                    child: Container(
                      alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(input,style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),))),
                Expanded(flex:1,
                    child: Container(
                        alignment: Alignment.topRight,
                        child: Text(output,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.normal),)))
              ],
            ),

          )),
          ///////////button//////////////
          Row(
            children: [
              button(text:"AC"),
              button(text:"<"),
              button(text:"%"),
              button(text:"/"),
            ],
          ),
          Row(
            children: [
              button(text:"7"),
              button(text:"8"),
              button(text:"9"),
              button(text:"x"),
            ],
          ),
          Row(
            children: [
              button(text:"4"),
              button(text:"5"),
              button(text:"6"),
              button(text:"-"),
            ],
          ),
          Row(
            children: [
              button(text:"1"),
              button(text:"2"),
              button(text:"3"),
              button(text:"+"),
            ],
          ),
          Row(
            children: [
              button(text:"%"),
              button(text:"0"),
              button(text:"."),
              button(text:"="),
            ],
          ),
        ],
      ),
    );
  }
  Widget button({text})
  {
    return
      Expanded(child:Container(
      margin: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: buttoncolor,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ),
        child: Text("$text",style: TextStyle(fontSize: 18,color: textcolor),),
        onPressed: (){
          onButtonclick(text);
        },),
    )
    );
  }
}
