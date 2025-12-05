class Checkout {
  PaymentStrategy? _strategy;
  void setStrategy(PaymentStrategy strategy) {
    _strategy = strategy;
  }

  void checkOut(double amount) {
    if (_strategy == null) {
      print('من فضلك اختار وسيلة الدفع');
    } else {
      _strategy!.pay(amount);
    }
  }
}

abstract class PaymentStrategy {
  void pay(double amount);
}

class PayPal implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('جارى دفع $amount من خلال paypal');
  }
}

class CreditCard implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('جارى دفع $amount  من خلال credit card');
  }
}

class Cash implements PaymentStrategy {
  @override
  void pay(double amount) {
    print('سيتم دفع مبلغ قدره $amount  عند الاستلام');
  }
}
