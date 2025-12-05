class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class CartItem {
  final Product product;
  final double? discount;
  final int quantity;

  CartItem({this.discount, required this.quantity, required this.product});

  double calculateTotalPrice() {
    double totalPrice = product.price * (1 - (discount ?? 0) / 100) * quantity;
    return totalPrice;
  }
}

class Cart {
  final List<CartItem> cartItems = [];

  void addCartItem(CartItem item) {
    cartItems.add(item);
  }

  void removeCartItem(CartItem item) {
    cartItems.remove(item);
  }

  double calculateTotals() {
    double totals = 0;
    for (var item in cartItems) {
      totals += item.calculateTotalPrice();
    }
    return totals;
  }
}

void main() {
  final p1 = Product(name: 'Iphone 17', price: 1000);
  final I1 = CartItem(product: p1, discount: 10, quantity: 2);

  final cart = Cart();

  cart.addCartItem(I1);

  print(cart.calculateTotals());
}
