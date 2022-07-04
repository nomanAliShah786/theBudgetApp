part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class GetTransactions extends TransactionsEvent {}

class UpdateTransactions extends TransactionsEvent {
  final List<TransactionModel> transactions;

  UpdateTransactions({
    @required this.transactions,
  });

  @override
  List<Object> get props => [transactions];
}

class AddTransaction extends TransactionsEvent {
  final TransactionModel transaction;

  AddTransaction({@required this.transaction});

  @override
  List<Object> get props => [transaction];
}

class RemoveTransaction extends TransactionsEvent {
  final String transactionID;

  RemoveTransaction({@required this.transactionID});

  @override
  List<Object> get props => [transactionID];
}

class UpdateTransaction extends TransactionsEvent {
  final TransactionModel transaction;

  UpdateTransaction({@required this.transaction,});

  @override
  List<Object> get props => [transaction,];
}
