import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_app/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqf;

class TransactionsRepository {
  final _db = FirebaseFirestore.instance.collection("transaction");

  Future<List<TransactionModel>> loadTransactions() async {
    try {
      QuerySnapshot data = await _db.get();
      List<TransactionModel> transactionData =
          data.docs.map((e) => TransactionModel.fromMap(e.data())).toList();
      return transactionData;
    } catch (e) {
      throw Exception('Unable to create/get database.');
    }
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    try {
      QuerySnapshot data = await _db.get();
      List<TransactionModel> transactionData =
          data.docs.map((e) => TransactionModel.fromMap(e.data())).toList();

      return transactionData;
    } catch (e) {
      throw Exception('Unable to get transactions.');
    }
  }

  Future<List<TransactionModel>> addTransaction(
      {@required List<TransactionModel> list,
      @required TransactionModel addT}) async {
    try {
      await _db.doc(addT.docid).set(addT.toMap());

      return await getAllTransactions();
    } catch (e) {
      throw Exception('Unable to get add transaction.');
    }
  }

  Future<List<TransactionModel>> removeTransaction(
      {@required List<TransactionModel> list, @required String remTID}) async {
    try {
      await _db.doc(remTID).delete();
      return await getAllTransactions();
    } catch (e) {
      throw Exception('Unable to get delete transaction.');
    }
  }

  Future<List<TransactionModel>> filterTransactions(
      {@required String keyword}) async {
    try {
      QuerySnapshot data = await _db.get();
      List<TransactionModel> transactionData =
          data.docs.map((e) => TransactionModel.fromMap(e.data())).toList();

      final list = transactionData
          .where((e) => e.title.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
      return list;
    } catch (e) {
      throw Exception('Unable to filter transactions.');
    }
  }

  Future<bool> updateTransaction({
    @required TransactionModel transaction,
  }) async {
    try {
      await _db.doc(transaction.docid).update(transaction.toMap());
      return true;
    } catch (e) {
      log(e.toString());
      throw Exception('Unable to update transaction.');
    }
  }
}
