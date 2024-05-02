import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxexample/Utility/colors.dart';
import 'package:getxexample/controller/pagecontroller.dart';

import '../../controller/userController.dart';

class PaginationScreen extends StatelessWidget {
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth=MediaQuery.of(context).size.width;
    final mheight=MediaQuery.of(context).size.height;
    final ScrollController scrollController = ScrollController();
    final PageListController controller = Get.put(PageListController());
    controller.getAllusers();


    Future onRefresh() async {
      controller.refreshData();
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && controller.hasMore.value) {
        controller.getAllusers();
      }
    }

    scrollController.addListener(onScroll);

    return Scaffold(
      backgroundColor: bodycolor,
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
          width: mwidth,
          height: mheight,
          color: bodycolor,
          child: Obx(
              ()=> ListView.builder(
                controller: scrollController,
                itemCount: controller.hasMore.value
                    ? controller.users.length + 1
                    : controller.users.length,
                itemBuilder: (context,index){
                  if (index < controller.users.length) {
                    final datas=controller.users[index];


                    return Card(
                      margin: EdgeInsets.only(top: 8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(12.0)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              NetworkImage(datas.avatar??'')
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                             Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(datas.name ?? ''),
                                Text(datas.email ?? '')
                              ],
                            )


                          ],
                        ),
                      ) ,





                    );

                  } else{
                    return const Padding(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: tealcolor,
                        ),
                      ),
                    );


                  }


                }
            ),
          ),



        ),
      ),
    );
  }
}
