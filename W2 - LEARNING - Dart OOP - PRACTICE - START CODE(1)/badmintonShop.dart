enum DeliveryMethod {delivery, pickup}
enum Category {racket, grib, string, shoes, bag}

class Order {
  Customer customer;
  List<OrderItem> items;
  DeliveryMethod method;

  Order({required this.customer, required this.items, required this.method});
  String toString() => "Order:\n$customer\n$items\n$method";
}

class Customer {
  String name;
  Address? deliveryAddress;
  Customer({required this.name, this.deliveryAddress});

  String toString() => 'Name: $name, Address: $deliveryAddress';
}


class OrderItem {
  Product product;
  int quantity;
  OrderItem({required this.product, required this.quantity});
  
  String toString() => '$product, Quantity: $quantity';
}

class Product {
  String name;
  double price;
  Category category;
  Product({required this.name, required this.price, required this.category});

  String toString() => 'Product: Name: $name, Price: $price, Category: $category';
}

class Address {
  String capitalOrProvince;
  String phoneNumber;
  Address({required this.capitalOrProvince, required this.phoneNumber});

  String toString() => "Location: $capitalOrProvince, PhoneNumber: $phoneNumber";
}

void main() {
  Customer customer1 = Customer(name: 'Tra', deliveryAddress: Address(capitalOrProvince: "Phnom Penh", phoneNumber: "096123456"));
  OrderItem orderItem = OrderItem(product: Pro, quantity: quantity)
  Order order1 = Order(customer: customer1, items: [Or], method: method)


  // Order order = Order(items: [OrderItem(product: Product(name: "Auraspeed5000", price: 25, category: Category.racket), quantity: 1)] ,customer: Customer(name: "Tra", deliveryAddress:Address(capitalOrProvince: "Phnom Penh", phoneNumber: "0123455678")), method: DeliveryMethod.delivery);
  // print(order);
}