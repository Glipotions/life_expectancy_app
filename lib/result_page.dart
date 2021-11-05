import 'package:flutter/material.dart';
import 'package:life_expectancy_app/constant.dart';
import 'package:life_expectancy_app/life_expectancy_hesap.dart';
import 'package:life_expectancy_app/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  const ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SONUÇ SAYFASI'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              'Beklenen Yaşam Süresi: ${Hesap(_userData).hesaplama().round().toString()}',
              style: kMetinStili,
            )),
          ),
          Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Geri Dön 🔙',
                    style: kMetinStili,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
