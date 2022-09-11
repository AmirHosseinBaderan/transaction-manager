class Transaction {
  int id;
  String description;
  int amount;
  String date;
  bool isPayed;

  Transaction(
      {required this.id,
      required this.description,
      required this.amount,
      required this.date,
      required this.isPayed});
}
