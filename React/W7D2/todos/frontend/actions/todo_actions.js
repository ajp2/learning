import * as APIUtil from "../util/todo_api_util";
import { receiveErrors, clearErrors } from "./error_actions";

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = id => ({
  type: REMOVE_TODO,
  id
});

export const fetchTodos = () => dispatch => (
  APIUtil.fetchTodos()
    .then(receiveTodos)
    .then(res => dispatch(res))
);

export const createTodo = todo => dispatch => (
  APIUtil.createTodo(todo)
    .then(
      todo => {
        clearErrors()
        dispatch(receiveTodo(todo));
      },
      err => dispatch(receiveErrors(err.responseJSON))
    )
);

window.fetchTodos = fetchTodos;