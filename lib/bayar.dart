import 'package:flutter/material.dart';

class Bayar extends StatefulWidget {
  const Bayar({super.key});

  @override
  State<Bayar> createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  List<int> biling = List.generate(50, (index) => index + 1);

  int idxTab = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: idxTab,
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text("Bayar"),
          actions: [
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
        body: Row(
          children: [
            //  bagian bil
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: biling.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          biling[index].toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(
                          "Nasi Goreng Pake Kuah",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // bagian Bayar
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.yellow.shade50,
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Total"),
                        Text("Rp 38.000"),
                        SizedBox(height: 10),
                        Text("Bayar non-tunai:"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildBankCard('BCA', Icons.account_balance,
                                      Colors.blue),
                                  buildBankCard('BRI', Icons.account_balance,
                                      Colors.green),
                                  buildBankCard('Mandiri',
                                      Icons.account_balance, Colors.orange),
                                  buildBankCard(
                                      'QRIS', Icons.qr_code, Colors.purple),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Bayar tunai:"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildCash(),
                                  buildCash(),
                                  buildCash(),
                                  buildCash(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Padding buildCash() {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: ElevatedButton(
        onPressed: () {},
        child: Text("halo"),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(90, 36),
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget buildBankCard(String bankName, IconData iconData, Color color) {
    return Card(
      child: InkWell(
        onTap: () {
          // Tindakan ketika tombol diklik
          print('$bankName button pressed');
        },
        child: Container(
          width: 80,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 30, color: color),
              SizedBox(height: 10),
              Text(
                bankName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
