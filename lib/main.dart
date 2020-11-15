import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Logic(),
      child: MaterialApp(home: Page1(),debugShowCheckedModeBanner: false,),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mldProvider = Provider.of<Logic>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => mldProvider.updateData(),child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Provider Learning"),
        centerTitle: true,
      ),
      body: Center(
        //child: ListView.builder(itemBuilder: ,itemCount: ,),
        child: //Text("Press For Update${mldProvider.getdata()}")
            Consumer<Logic>(
          builder: (context, value, child) {
            return Text("Press For Update ${mldProvider.getdata()}");
          },
        ),
      ),
    );
  }
}

class Logic extends ChangeNotifier {
  int a = 0;
  getdata() => a;
  updateData() {
    a++;
    print(a);
    notifyListeners();
  }

  int abcd = 1;
  getabcdData() => abcd;
  updateabcdData() {
    abcd--;
    notifyListeners();
  }
}
