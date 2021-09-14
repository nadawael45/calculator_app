
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {


runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Calc() ,

    );
  }
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String input= '';
  String output= '';

  List<String>numbers=[
    'C','Del','%','/',
    '9','8','7','*',
    '6','5','4','+',
    '3','2','1','-',
    '0','.','Ans','=',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Expanded(flex: 1,child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Align(alignment: Alignment.topLeft,child: Text(input,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 20,),
                Align(alignment: Alignment.topRight,child: Text(output,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
              ],),
            ),
          )),

          Expanded(flex: 2,child: Container(
            child: GridView.builder(
              itemCount: numbers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(onTap: (){
                    if(numbers[index]=='C'){
                      setState(() {
                        input='';
                        output='';
                      });
                    }else if(numbers[index]=='Del'){
                      setState(() {
                        input=input.substring(0,input.length-1);
                      });
                    } else if(numbers[index]=='*'||numbers[index]=='%'||numbers[index]=='-'||numbers[index]=='+'||numbers[index]=='/'){
                      setState(() {
                        if(input.endsWith('+')||input.endsWith('-')||input.endsWith('*')||input.endsWith('%')||input.endsWith('/')){
                          null;

                        }else{
                          input=input+numbers[index];

                        }
                      });



                    }else if (numbers[index]=='='){
                      //محتاجه اعمل  تحويل ومعادله لقيمه الانبوت
                      //انا حولت الانبوت من استرينج لاكسبرشن
                      Expression exp= Parser().parse(input);
                      double result=exp.evaluate(EvaluationType.REAL, ContextModel());
                      setState(() {
                        output = result.toString();
                      });
                    }else if(numbers[index]=='Ans'){
                      setState(() {
                        input=output;
                        output='';
                      });

                    }
                    else{
                      setState(() {
                        input=input+numbers[index];
                      });
                    }

    
                  },
                    child: Container(
                      decoration: BoxDecoration(color: btncolor(numbers[index]),
                      borderRadius: BorderRadius.circular(15)),
                      child: Center(child: Text(numbers[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: txtcolor(numbers[index])),)),
                    ),
                  ),
                );
            },
          ))),
        ],),

    );
  }
  Color btncolor(String n){
    if(n=='C'){
      return Colors.green;
    }else if (n=='Del'){
      return Colors.red;

    }else if (n=='%'||n=='/'||n=='='||n=='-'||n=='+'||n=='*'){
      return Colors.blue;

    }else{
      return Colors.grey;

    }
  }
  Color txtcolor(String n){
    if (n=='%'||n=='/'||n=='='||n=='-'||n=='+'||n=='*'||n=='C'||n=='Del'){
      return Colors.white;

    }else{
      return Colors.black;

    }
  }

}

