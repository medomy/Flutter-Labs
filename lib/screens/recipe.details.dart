import 'package:flutter/material.dart';
import 'package:flutter_recipes/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail(this.recipe, {Key? key}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  

  @override
  Widget build(BuildContext context) {
    
    double _sliderVal = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            ListView(
              children: [
                ListView.builder(
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (C,index) {
                final ing = widget.recipe.ingredients[index];
                return Text("${_sliderVal *ing.quantity} ${ing.measure} of ${ing.name}");
              }),
              
              ],
            ),
            Slider(
             value: _sliderVal,
             min: 1,
             max: 10,
             divisions: 10,
             onChanged: (double value){
               setState(() {
                 _sliderVal = value;
               });
             })

          ],
        ),
      ),
    );
  }
}

class testApp extends StatelessWidget {
  const testApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
