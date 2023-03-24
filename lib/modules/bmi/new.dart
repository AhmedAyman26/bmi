import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imagePicker=ImagePicker();
    return Column(
      children: [
        Container(
          child: Text('choose'),
        ),
        MaterialButton(
            onPressed: ()
            {
              var picked=imagePicker.pickImage(source: ImageSource.camera);
            }
        )
      ],
    );
  }
}
