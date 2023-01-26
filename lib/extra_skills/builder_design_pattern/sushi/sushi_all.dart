import 'package:portfolio/extra_skills/builder_design_pattern/ingredients/ingredients_all.dart';
import 'package:portfolio/extra_skills/builder_design_pattern/sushi/sushi_class.dart';

class CookedTunaAndAvocadoHRoll extends Sushi{
  CookedTunaAndAvocadoHRoll()
  {
    name = "Cooked Tuna and Avocado H/Roll";
    ingredients=[Rice(),Avocado(),Egg(),Tuna(),Sesame()];
    fullPrice = setPrice();
  }
}

class SalmonAndAvocadoHRoll extends Sushi{
  SalmonAndAvocadoHRoll()
  {
    name = "Salmon and Avocado H/Roll";
    ingredients=[Rice(),Avocado(),Egg(),Salmon(),Sesame()];
    fullPrice = setPrice();
  }
}

class VegetarianHRoll extends Sushi{
  VegetarianHRoll()
  {
    name = "Vegetarian H/Roll";
    ingredients=[Rice(),Sesame()];
    fullPrice = setPrice();
  }
}

class CrispyChickenHRoll extends Sushi{
  CrispyChickenHRoll()
  {
    name = "Crispy Chicken H/Roll";
    ingredients=[Rice(),Crisp(),Egg(),Sesame()];
    fullPrice = setPrice();
  }
}

