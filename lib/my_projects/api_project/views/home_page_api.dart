import 'dart:math';
import 'package:portfolio/main.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/my_projects/api_project/models/comments.dart';
import 'package:portfolio/my_projects/api_project/services/remote_service.dart';
class ApiWorkPage extends StatefulWidget {
  const ApiWorkPage({Key? key}) : super(key: key);

  @override
  State<ApiWorkPage> createState() => _ApiWorkPageState();
}

class _ApiWorkPageState extends State<ApiWorkPage> {
  List<Comment>? comments;

  var isLoaded = false;

  @override
  void initState(){
    super.initState();

    // fetch data from api
    getData();
  }

  getData()
  async{
    comments = await RemoteService().getComments();
    if(comments!=null)
      {
        setState(() {
          isLoaded = true;
        });
      }
  }
  Random random = Random();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: comments?.length,
            itemBuilder: (context, index){
          return Container(
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(random.nextInt(255), random.nextInt(255), random.nextInt(255), random.nextInt(255)),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    children: [
                      Text(comments![index].name
                        ,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24,
                        fontWeight: FontWeight.bold),
                      ),
                      Text(
                      comments![index].body ?? "no comment provided",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 24),),

                      const Text("Source: https://jsonplaceholder.typicode.com/",
                      style: TextStyle(color: Colors.redAccent,
                      fontSize: 14),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    // style: style,
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                    icon:const Icon(Icons.arrow_circle_left_outlined),
                    label: const Text('Go back to portfolio'),
                  ),
                ),
              ],
            ),
          );
        }),
      )
    );
  }
}
