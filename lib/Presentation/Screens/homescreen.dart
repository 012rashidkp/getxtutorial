
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxexample/Model/myMenus.dart';
import 'package:getxexample/Routes/routeNames.dart';
import 'package:getxexample/Utility/colors.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth=MediaQuery.of(context).size.width;
    final mheight=MediaQuery.of(context).size.height;

    List<MyMenus> menus=[];
    menus.clear();
    menus.add(MyMenus(id: 1,name: 'Hive',icon: Icons.people));
    menus.add(MyMenus(id: 2,name: 'Sqlite',icon: Icons.storage));
    menus.add(MyMenus(id: 3,name: 'Dio  ',icon: Icons.storage));
    menus.add(MyMenus(id: 4,name: 'Pagination',icon: Icons.pages));
    menus.add(MyMenus(id: 5,name: 'Responsive',icon: Icons.pages));
    return Container(
      width: mwidth,
      height:mheight,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 15.0, // spacing between rows
              crossAxisSpacing: 6.0, // spacing between columns
              childAspectRatio: 2/0.8
            ),



          itemCount: menus.length,
            // padding: EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index){
            final datas=menus[index];

            return GestureDetector(
              onTap: (){

                switch(datas.id){
                  case 1:
                    print('myid... ${datas.id}');
                  context.push(hive);
                    break;
                  case 2:
                    context.push(sqflite);
                    break;
                  case 3:
                    context.push(api);
                    break;
                  case 4:
                    context.push(pagination);
                    break;
                  case 5:
                    context.push(responsive);
                    break;




                }
              },
              child: Container(
                width: mwidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  color: tealcolor
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      datas.icon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      datas.name??'',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white,fontSize: 16.0,
                          decoration: TextDecoration.none
                      ),

                    ),

                  ],
                ),


              )
            );
            }
        ),
      )
    );
  }
}
