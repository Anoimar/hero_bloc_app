import 'package:flutter/material.dart';
import '../models/item_model.dart' as Hero;
import '../blocs/heroes_bloc.dart';

class HeroesList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    bloc.fetchAllHeroes();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SUPER Heroes"),
      ),
      body: StreamBuilder(
        stream: bloc.allHeroes,
        builder: (context,AsyncSnapshot<Hero.ItemModel> snapshot){
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


  Widget buildList(AsyncSnapshot<Hero.ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context,int index){
        return Image.network(snapshot.data.results[index].image.url,
        fit: BoxFit.cover);
      }
    );
  }

}
