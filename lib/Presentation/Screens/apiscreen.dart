
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxexample/Utility/colors.dart';
import 'package:getxexample/controller/userController.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth=MediaQuery.of(context).size.width;
    final mheight=MediaQuery.of(context).size.height;
    final controller=Get.put(UserController());
    controller.fetchUsers();

    return Obx(
      ()=> Container(
        width: mwidth,
        height: mheight,
        color: bodycolor,
        child: controller.isloading.value?_loadingbar():

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
          child: ListView.builder(

            scrollDirection: Axis.vertical,
             itemCount:controller.users.length ,
              itemBuilder:(BuildContext context,int index){
              final datas=controller.users[index];
              print('myresponse... ${controller.users}');
              return Card(
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
                            '${datas.name}',
                            style: const TextStyle(color: tealcolor,fontSize: 16.0),
                          ),




                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                       Text(
                        '${datas.power}',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),
                      ),


                    ],
                  ),
                ),

              );

              }
          ),
        ),



      ),
    );
  }
  Widget _loadingbar(){
    return const Center(
      child: CircularProgressIndicator(
        color: tealcolor,

      ),
    );
  }
}
