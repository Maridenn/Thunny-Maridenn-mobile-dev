enum DeliveryOption {
  delivery,
  pickup;

  String toString() {
    switch (this) {
      case DeliveryOption.delivery:
        return "Delivery";
      case DeliveryOption.pickup:
        return "Pickup";
    }
  }
}

enum Product {
  banana("Banana", 0.35),
  chicken("Chicken", 5.5),
  egg("Egg", 0.07);

  final String name;
  final double price;

  const Product(this.name, this.price);
}

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);

  String toString() {
    return "\n\tst: $street, \n\tcity: $city, \n\tzip code: $zipCode";
  }
}

class OrderItem {
  final Product _product;
  final int _quantity;

  OrderItem({required Product product, required int quantity})
    : _product = product,
      _quantity = quantity;

  Product get product => _product;
  int get quantity => _quantity;

  double get productTotal => _product.price * _quantity;

  String toString() => "${_product.name} x $_quantity = $productTotal";
}

class Order {
  final List<OrderItem> _items;
  final DeliveryOption _deliveryOption;
  final Address? _deliveryAddress;

  Order({
    required List<OrderItem> items,
    required DeliveryOption deliveryOption,
    Address? deliveryAddress,
  }) : _items = items,
       _deliveryOption = deliveryOption,
       _deliveryAddress = deliveryAddress {
    if (_deliveryOption == DeliveryOption.delivery &&
        _deliveryAddress == null) {
      throw Exception("Delivery requires an address!");
    }
  }

  Order.pickup({required List<OrderItem> items})
    : _items = items,
      _deliveryOption = DeliveryOption.pickup,
      _deliveryAddress = null;

  Order.delivery({required List<OrderItem> items, required Address address})
    : _items = items,
      _deliveryOption = DeliveryOption.delivery,
      _deliveryAddress = address;

  List<OrderItem> get items => _items;
  DeliveryOption get deliveryOption => _deliveryOption;
  Address? get deliveryAddress => _deliveryAddress;

  double totalAmount() {
    double total = 0;
    for (var item in _items) {
      total += item.productTotal;
    }
    return total;
  }

  String toString() {
    String result = "Order: $_deliveryOption";
    for (var item in _items) {
      result += "\n\t$item";
    }
    result += "\nTotal: ${totalAmount()}";
    if (_deliveryAddress != null) {
      result += "\nDeliver to: $_deliveryAddress";
    }
    return result;
  }
}

void main() {
  var order1 = Order.pickup(
    items: [
      OrderItem(product: Product.banana, quantity: 1),
      OrderItem(product: Product.egg, quantity: 2),
    ],
  );
  print(order1);

  var add2 = Address("123 Street", "Phnom Penh", "12000");
  var order2 = Order.delivery(
    items: [
      OrderItem(product: Product.chicken, quantity: 1),
      OrderItem(product: Product.egg, quantity: 1),
    ],
    address: add2,
  );
  print(order2);

  try {
    var order3 = Order(
      items: [OrderItem(product: Product.banana, quantity: 1)],
      deliveryOption: DeliveryOption.delivery,
      // deliveryAddress: Address("safd", "asf", "2344"),
    );
    print(order3);
  } catch (e) {
    print(e);
  }
}
