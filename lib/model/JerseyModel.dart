

class JerseyModel {

  dynamic name;
  int jersey_count = 0;
  
  int jersey_price = 0;
  

  int init_price = 0;

  int total_price = 0;

  JerseyModel(
      {required this.jersey_count,
      required this.jersey_price,
      required this.init_price,
      required this.name,
      required this.total_price
      });
}
