import 'package:api_test/layout/todo_app/cubit/todo_states.dart';
import 'package:bloc/bloc.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());
}