import 'package:equatable/equatable.dart';

class GetCeoDetailsByCepBody extends Equatable{
  final String cep;

  const GetCeoDetailsByCepBody({required this.cep});
  
  @override
  // TODO: implement props
  List<Object?> get props => [cep];
}