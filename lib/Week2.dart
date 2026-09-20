
import 'dart:developer';

double processOrder({
    required int orderId,
    required double itemPrice,
    String? promoCode,
    double? deliveryFee }){
  double finalPrice = itemPrice;
  if (promoCode == 'SAVE10'){
    finalPrice = itemPrice * 0.9;
  }
  double actualDelFee = deliveryFee ?? 500.0;
  if (actualDelFee < 500.0){
    actualDelFee = 500.0;
  }
  double total = finalPrice + actualDelFee;

  print("---ORDER SUMMARY---");
  print("OrderId: $orderId");
  print("Original Price: $itemPrice");
  if (promoCode != null){
    print("Promo code: $promoCode");
  }
  print("Discounted Price: $finalPrice ₸");
  print("Delivery Fee: $actualDelFee ₸");
  print("Final Total: $total ₸\n");

  return total;
}

void main(){
  processOrder(orderId: 1, itemPrice: 1000);
  processOrder(orderId: 2, itemPrice: 1000, promoCode: "SAVE10");
  processOrder(orderId: 1, itemPrice: 1000,deliveryFee: 400);

}