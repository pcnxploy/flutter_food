class FoodItem {
  final int id;
  final String name;
  final int price;
  final String image;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  String toString() {
    return '$id: $name ราคา $price บาท';
  } //ชื่อไฟล์รูปภาพ


}
