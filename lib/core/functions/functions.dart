String formatPrice(num priceInDouble) {
  try {
    String price = priceInDouble.toString();
    price = price.split('.').first;
    var formattedPriceList = List.from(price.split(''));
    var index = price.length - 3;
    while (index > 0) {
      formattedPriceList.insert(index, ',');
      index -= 3;
    }
    return formattedPriceList.join();
  } catch (e) {
    return '';
  }
}
