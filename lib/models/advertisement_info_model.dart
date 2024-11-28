class AdvertisementInformationModel {
  final String id;
  final String customerName;
  final String customerTitle;
  final String startPlace;
  final String finishPlace;
  final String advertDate;
  final int advertPrice;
  final List<String> advertMust;

  AdvertisementInformationModel({
    required this.id,
    required this.startPlace,
    required this.finishPlace,
    required this.advertDate,
    required this.advertPrice,
    required this.advertMust,
    required this.customerTitle,
    required this.customerName,
  });
}
