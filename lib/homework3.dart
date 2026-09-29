// 1. Abstract Class MediaItem
abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem({
    required this.id,
    required this.title,
    required this.price,
  });

  // Abstract method
  String getDetails();
}

// 3. Mixin Downloadable
mixin Downloadable {
  void download(String title) {
    print("Downloading '$title'...");
  }
}

// 2. Subclasses Audiobook and EBook using 'with Downloadable'
class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook({
    required String id,
    required String title,
    required double price,
    required this.durationHours,
    required this.narrator,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return 'Audiobook: "$title" | Narrator: $narrator | Duration: ${durationHours}h | Price: \$${price.toStringAsFixed(2)}';
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook({
    required String id,
    required String title,
    required double price,
    required this.fileSizeMB,
    required this.author,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return 'EBook: "$title" | Author: $author | Size: ${fileSizeMB}MB | Price: \$${price.toStringAsFixed(2)}';
  }
}

// 4. Class ShoppingCart
class ShoppingCart {
  final List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  // Uses .fold() to sum prices and add 12% tax
  double calculateTotalWithTax({double taxRate = 0.12}) {
    double subtotal = _items.fold(0.0, (sum, item) => sum + item.price);
    return subtotal * (1 + taxRate);
  }

  // Uses .where() to filter items <= maxPrice
  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }

  // Prints details and calls download() for Downloadable items
  void printReceipt() {
    print("--- RECEIPT ---");
    for (var item in _items) {
      print(item.getDetails());

      // Проверка и приведение типа для вызова метода из миксина
      if (item is Downloadable) {
        (item as Downloadable).download(item.title);
      }
      print("----------------");
    }

    double total = calculateTotalWithTax();
    print("TOTAL (incl. 12% tax): \$${total.toStringAsFixed(2)}\n");
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();

  // Создание элементов
  Audiobook book1 = Audiobook(
    id: "A101",
    title: "Atomic Habits",
    price: 15.0,
    durationHours: 5.5,
    narrator: "James Clear",
  );

  EBook book2 = EBook(
    id: "E202",
    title: "Dart in Action",
    price: 25.0,
    fileSizeMB: 12.4,
    author: "Chris Sells",
  );

  EBook book3 = EBook(
    id: "E203",
    title: "Flutter Handbook",
    price: 8.0,
    fileSizeMB: 4.2,
    author: "John Doe",
  );

  // Добавление в корзину
  cart.addItem(book1);
  cart.addItem(book2);
  cart.addItem(book3);

  // Печать чека
  cart.printReceipt();

  // Фильтрация по максимальной цене ($15.0)
  print("=== ITEMS FILTERED BY MAX PRICE (\$15.0) ===");
  List<MediaItem> cheapItems = cart.filterByMaxPrice(15.0);
  for (var item in cheapItems) {
    print(item.getDetails());
  }
}