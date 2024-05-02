
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getxexample/Component/inputfield.dart';
import 'package:getxexample/InputController.dart';
import 'package:getxexample/Model/persons.dart';
import 'package:getxexample/Utility/colors.dart';
import 'package:getxexample/controller/personController.dart';

adddialog({required BuildContext context,required InputController controller}) {

  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "Cancel",
      style: TextStyle(
        color: tealcolor
      ),

    ),
    onPressed: () {
      Navigator.of(context!).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Input Details",textAlign: TextAlign.center,),
    content:  Obx(
      ()=> Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Inputfield(
            hintvalue: 'Enter Name',
            textInputType: TextInputType.text,
            readonly: false,
            onchange: (value){
        controller.addName(pname: value);

            },
          ),

          const SizedBox(
            height: 25.0,
          ),
          Inputfield(
            hintvalue: 'Enter Age',
            textInputType: TextInputType.number,
            readonly: false,
            onchange: (value){
              controller.addAge(page: value);

            },
          ),
SizedBox(
  height: 25.0,
),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: controller.name.value.isNotEmpty && controller.age.value.isNotEmpty ?tealcolor:greytextcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),

                ),
                elevation: 0.0,
              ),
              onPressed: (){


               if(controller.name.value.isNotEmpty&& controller.age.value.isNotEmpty){
               Person? datas=Person(controller.name.value, controller.age.value);

               print('creating data... ${datas}');

               personcontroller.addperson(data: datas);
               Navigator.of(context).pop();




               }




              }, child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
                child: Text(
            'Save',
            style: TextStyle(
                  color: Colors.white,
                fontSize: 15.0
            ),
          ),
              )

          )





        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context!,
    builder: (BuildContext context) {
      return alert;
    },
  );
}