import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TransactionModel extends Equatable {
  final String id;
  final String title;
  final String docid;
  final double amount;
  final DateTime date;
  final DateTime createdOn;
  final String imagePath;

  TransactionModel({
    @required this.id,
    @required this.title,
    @required this.docid,
    @required this.amount,
    @required this.date,
    @required this.createdOn,
    @required this.imagePath,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      docid,
      amount,
      date,
      createdOn,
      imagePath,
    ];
  }

  TransactionModel copyWith({
    String id,
    String title,
    double amount,
    String docid,
    DateTime date,
    DateTime createdOn,
    String imagePath,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      docid: docid ?? this.docid,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      createdOn: createdOn ?? this.createdOn,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount.toString(),
      "docid": docid,
      'date': date.millisecondsSinceEpoch,
      'createdOn': createdOn.millisecondsSinceEpoch,
      'imagePath': imagePath,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      title: map['title'],
      amount: double.tryParse(map['amount']) ?? 0.0,
      docid: map["docid"],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      createdOn: DateTime.fromMillisecondsSinceEpoch(map['createdOn']),
      imagePath: map['imagePath'],
    );
  }

  @override
  bool get stringify => true;
}
