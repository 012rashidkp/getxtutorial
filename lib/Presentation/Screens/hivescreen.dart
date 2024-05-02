
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxexample/InputController.dart';
import 'package:getxexample/Model/persons.dart';
import 'package:getxexample/Presentation/Dialogs/createdialog.dart';
import 'package:getxexample/Presentation/Dialogs/updatedialog.dart';
import 'package:getxexample/Utility/colors.dart';
import 'package:getxexample/controller/personController.dart';

class HiveScreen extends StatelessWidget {
  const HiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth=MediaQuery.of(context).size.width;
    final mheight=MediaQuery.of(context).size.height;
    final controller=Get.put(InputController());

    personcontroller.getAllpersons();

    return Scaffold(
      backgroundColor: bodycolor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: tealcolor,
          child: Icon(Icons.add),
          onPressed: (){
            controller.clearfields();

           adddialog(context: context,controller: controller);
          }
          ),

      body: Obx(
        ()=> Container(
          width: mwidth,
          height: mheight,
          color: bodycolor,
          margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
          child:personcontroller.persons.isEmpty?_alert()
              : ListView.builder(
            scrollDirection: Axis.vertical,
              itemCount: personcontroller.persons.length,
              itemBuilder:(BuildContext context,int index){

             final datas =personcontroller.persons.value[index];
             print('mydata... ${datas}');
              return InkWell(
                onTap: ()async{
                 personcontroller.updatedetails(index: index, name: datas.name,age: datas.age);
                await updatedialog(context: context, controller: controller);
                },
                child: Card(
                  margin: EdgeInsets.only(top: 15.0),
                 shape: RoundedRectangleBorder(
                   borderRadius:BorderRadius.circular(12.0)
                 ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                '${datas?.name}',
                              style: const TextStyle(color: tealcolor,fontSize: 16.0),
                            ),


                            InkWell(
                                onTap: (){
                                 personcontroller.remove(index: index);

                                },
                                child: Icon(Icons.delete,color: tealcolor,))

                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${datas?.age}',
                          style: const TextStyle(color: Colors.black,fontSize: 16.0),
                        ),


                      ],
                    ),
                  ),

                ),
              );


              }
          ),

        ),
      ),
    );
  }
  Widget _alert(){
    return const Center(
      child: Text(
        'Database is Empty',
        style: TextStyle(fontSize: 18.0,color: Colors.black,fontStyle: FontStyle.normal),
      ),
    );
  }
}
