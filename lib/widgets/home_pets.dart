import 'package:flutter/material.dart';
import 'package:pupper/server/dogStruct.dart';
import 'package:pupper/server/dogsImage.dart';

import '../server/apiCall.dart';

class homePets extends StatefulWidget {
  const homePets({Key? key}) : super(key: key);

  @override
  State<homePets> createState() => _homePetsState();
}

class _homePetsState extends State<homePets> {
  dogs? data;
  dogsImage? image;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    data = await RemoteService().getDogsList();
    image = await RemoteService().getDogsImage();
    if (data != null && image != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: data?.animals?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    // color: Colors.orangeAccent,
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orangeAccent),
                    child: Column(
                      children: [
                        SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 5,
                                  color: Colors.black26,
                                  blurRadius: 5,
                                )
                              ],
                              // border:
                              //     Border.all(color: Colors.white, width: 5),
                              // borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image(
                              image: NetworkImage(image!.message![index]
                                  .toString()), // Image of Dogs
                              fit: BoxFit.fitHeight,
                              height: 170,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                data!.animals![index].name.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                                // style: TextStyle(color: Colors.deepOrange),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ), // Dog Name
                            Text(data!.animals![index].breeds!.primary
                                .toString()),
                          ],
                        ),
                        Text(data!.animals![index].age.toString()), // Dog Breed
                      ],
                    ),
                  ),
                  SizedBox(height: 5)
                ],
              );
            }),
      ),
    );
  }
}
