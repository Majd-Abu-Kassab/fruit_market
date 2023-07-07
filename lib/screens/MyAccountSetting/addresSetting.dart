import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_market/screens/myAccountSetting/settings_acc.dart';


class AddresSetting extends StatefulWidget {
  const AddresSetting({super.key});

  @override
  State<AddresSetting> createState() => _AddresSettingState();
}

class _AddresSettingState extends State<AddresSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Change Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 300, 25),
              child: Text(
                "Address",
                style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                //minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 125, 20, 0),
              child: Container(
                color: Colors.green[700],
                child: SizedBox(
                  width: 375,
                  height: 55,
                  child: MaterialButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Sttings(),
                      ),
                    ),
                    child: Text(
                      'CHANGE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
