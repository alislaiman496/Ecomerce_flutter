class ProductData{
  late int id;
  late String title;
  late dynamic price;
  late String description;
  late String category;
  late String image;
  late Map rating;

  ProductData(
      { required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating});
  void setId(int value){
    id=value;
  }
  void setTitle(String value){
    title=value;
  }
  void setPrice(dynamic value){
    price=value;
  }
  void setDescription(String value){
    description=value;
  }
  void setCategory(String value){
    category=value;
  }
  void setImage(String value){
    image=value;
  }
  void setRating(Map value){
    rating=value;
  }
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
    };
  }

  ProductData.fromMap(Map<String, Object?> maps) {
    id = (maps['id'] as int);
    title = (maps['title'] as String);
    price = (maps['price'] as dynamic);
    description = (maps['description'] as String);
    category = (maps['category'] as String);
    image = (maps['image'] as String);
    rating= (maps['rating'] as Map);
  }
}