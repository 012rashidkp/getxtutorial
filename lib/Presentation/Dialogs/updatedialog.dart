
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Component/inputfield.dart';
import '../../InputController.dart';
import '../../Model/persons.dart';
import '../../Utility/colors.dart';
import '../../controller/personController.dart';

updatedialog({required BuildContext context,required InputController controller}) {
 TextEditingController _namecontroller=TextEditingController();
 TextEditingController _agecontroller=TextEditingController();

   _namecontroller.text=personcontroller.edtname.value;
   _agecontroller.text=personcontroller.edtage.value.toString();


  // set up the button
  Widget okButton = TextButton(
    child: const Text(
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
            controller: _namecontroller,
            textInputType: TextInputType.text,
            readonly: false,
            onchange: (value){
            personcontroller.updatedetails(name: value);

            },
          ),

          const SizedBox(
            height: 25.0,
          ),
          Inputfield(
            controller: _agecontroller,
            hintvalue: 'Enter Age',
            textInputType: TextInputType.number,
            readonly: false,
            onchange: (value){
              personcontroller.updatedetails(age: value);

            },
          ),
          const SizedBox(
            height: 25.0,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: personcontroller.edtname.value.isNotEmpty && personcontroller.edtage.value.isNotEmpty ?tealcolor:greytextcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),

                ),
                elevation: 0.0,
              ),
              onPressed: (){
                print('update index... ${personcontroller.edtindex} ${personcontroller.edtname} ${personcontroller.edtage}');

                if(personcontroller.edtname.value.isNotEmpty&& personcontroller.edtage.value.isNotEmpty){
                  Person? datas=Person(personcontroller.edtname.value,personcontroller.edtage.value);



                  personcontroller.updatedata(index: personcontroller.edtindex.value, data: datas);
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