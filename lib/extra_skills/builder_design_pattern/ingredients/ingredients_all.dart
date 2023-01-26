import 'package:portfolio/extra_skills/builder_design_pattern/ingredients/ingredien_class.dart';




class Rice extends IngredientClass{
  Rice(){
        name="Rice";
        allergens= null;
        price = 10;
      }
}

class Egg extends IngredientClass{
  Egg(){
    name="Egg";
    allergens= ['Egg'];
    price = 6;
  }
}

class Avocado extends IngredientClass{
  Avocado(){
    name="Avocado";
    allergens= null;
    price = 11;
  }
}

class Salmon extends IngredientClass{
  Salmon(){
    name="Salmon";
    allergens= ['Fish'];
    price = 20;
  }
}

class Tuna extends IngredientClass{
  Tuna(){
    name="Tuna";
    allergens= ['Fish'];
    price = 20;
  }
}

class Sesame extends IngredientClass{
  Sesame(){
    name="Sesame";
    allergens= ['Sesame'];
    price = 2;
  }
}

class Crisp extends IngredientClass{
  Crisp(){
    name="Crisp";
    allergens= ['Wheat'];
    price = 14;
  }
}