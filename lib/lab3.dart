// 1. Класс Book
class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  // Конструктор (по умолчанию isBorrowed = false)
  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });

  @override
  String toString() {
    return 'Book("$title" by $author - \$${price.toStringAsFixed(2)})';
  }
}

// 2. Класс Library
class Library {
  // Приватное поле
  final List<Book> _books = [];

  // Добавление книги
  void addBook(Book book) {
    _books.add(book);
  }

  // Фильтрация доступных книг через .where()
  List<Book> getAvailableBooks() {
    return _books.where((book) => !book.isBorrowed).toList();
  }

  // Подсчет общей стоимости всех книг через .fold()
  double getTotalValue() {
    // initialValue = 0.0
    // sum — накопленная сумма, book — текущий элемент списка
    return _books.fold(0.0, (sum, book) => sum + book.price);
  }
}

void main() {
  Library library = Library();

  // Добавляем тестовые книги
  library.addBook(Book(title: "The Dart Programming Language", author: "Gilad Bracha", price: 45.0));
  library.addBook(Book(title: "Clean Code", author: "Robert C. Martin", price: 50.0, isBorrowed: true));
  library.addBook(Book(title: "Flutter in Action", author: "Eric Windmill", price: 40.0));
  library.addBook(Book(title: "Refactoring", author: "Martin Fowler", price: 55.0));

  print("=== AVAILABLE BOOKS ===");
  List<Book> available = library.getAvailableBooks();
  for (var book in available) {
    print(book);
  }

  print("\n=== TOTAL LIBRARY VALUE ===");
  print("Total Value: \$${library.getTotalValue().toStringAsFixed(2)}");
}