import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykart/widgets/add_cloth.dart';
import 'package:mykart/widgets/add_electronic.dart';

class Sales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Person'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
            margin: EdgeInsets.all(18.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Electronic()));
              },
              child: Center(
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children:[
                      Icon(
                        EvaIcons.bulbOutline,
                        size:70.0,
                        color: Colors.limeAccent,
                        ),
                      Text(
                        'Add Electronic',
                        style: GoogleFonts.mcLaren(
                          fontSize: 17.0,
                          color:Colors.yellow,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
           Card(
            margin: EdgeInsets.all(18.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Cloth()));
              },
              child: Center(
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children:[
                      Icon(
                        Icons.add,
                        size: 70.0,
                        color: Colors.green,
                      ),
                      Text(
                        'Add cloth',
                        style: GoogleFonts.mcLaren(
                          fontSize: 17.0,
                          color:Colors.lime,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
