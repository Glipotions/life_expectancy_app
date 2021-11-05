import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy_app/result_page.dart';
import 'package:life_expectancy_app/user_data.dart';

import 'constant.dart';
import 'mycontainer.dart';
import 'mycontainer_column.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double? icilenSigara = 25;
  double? sporGunu = 3;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hafta da kaç gün Spor Yapıyorsun ?',
                    style: kMetinStili,
                  ),
                  Text(
                    sporGunu!.round().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    value: sporGunu!,
                    onChanged: (double newValue) {
                      setState(() {
                        sporGunu = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Günde Kaç Sigara İçiyorsun ?', style: kMetinStili),
                  Text(icilenSigara!.round().toString(), style: kSayiStili),
                  Slider(
                    min: 0,
                    max: 50,
                    value: icilenSigara!,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: MyContainerColumn(
                      icon: FontAwesomeIcons.mars,
                      yazi: 'ERKEK',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: MyContainerColumn(
                      icon: FontAwesomeIcons.venus,
                      yazi: 'KADIN',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          boy: boy,
                          kilo: kilo,
                          icilenSigara: icilenSigara,
                          sporGunu: sporGunu,
                          seciliCinsiyet: seciliCinsiyet),
                    ),
                  ),
                );
              },
              child: Text(
                'HESAPLA',
                style: kMetinStili,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlinedButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            text,
            style: kMetinStili,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            text == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                child: Text(
                  '+',
                  style: kMetinStili,
                ),
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy++ : kilo++;
                  });
                }),
            OutlinedButton(
                child: Text(
                  '-',
                  style: kMetinStili,
                ),
                onPressed: () {
                  setState(() {
                    text == 'BOY' ? boy-- : kilo--;
                  });
                }),
          ],
        )
      ],
    );
  }
}
