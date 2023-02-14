import 'package:flutter/material.dart';
import 'package:futursity/service/api_call_fun.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 150),
              child: Text(
                "𝙏𝙤𝙥 𝘾𝙤𝙪𝙧𝙨𝙚",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {},
                child: const Text("All Course >"),
              ),
            )
          ],
        ),
        SizedBox(
          height: 150.0,
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                          child: Text(snapshot.data!.dateAdded.toString()));
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                );
                return null;
              }),
        ),
        Row(
          children: const [
            Text(
              "Categories",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 1000,
              itemBuilder: (BuildContext ctx, index) {
                return FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot1) {
                      if (snapshot1.hasData) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    });
              }),
        ),
        
      ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        
        child: const Icon(Icons.filter_list,),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Icon(Icons.school),
                Text('course'),
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Icon(Icons.shopping_bag_sharp),
                Text('My Course'),
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Icon(Icons.favorite),
                Text('Wishlist'),
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Icon(Icons.person),
                Text('account'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
