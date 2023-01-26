import 'package:flutter/cupertino.dart';

import '../ingredients/ingredien_class.dart';

abstract class Sushi{
@protected
  String? name;
@protected
List<IngredientClass>?ingredients;
@protected
  int? fullPrice;


void addIngredient(IngredientClass ingredient)
{
  if(ingredient!=null) {
      ingredients?.add(ingredient);
    }
  }

  String getAllergens()
  {
    String allergies="";
    ingredients?.forEach((element)
    {element.getAllergens()!=null?allergies+=element.getAllergens()!:null;});
    return allergies;
  }
  String getIngredients()
  {
    String answer ="";
    ingredients?.forEach((element) {answer+=element.name!+" ";});
    return answer;
  }

  int setPrice()
  {
    int pr=0;
    ingredients?.forEach((element) {pr+=element.getPrice()!;});
    return pr;
  }

  int? getPrice()
  {
    return fullPrice;
  }


}