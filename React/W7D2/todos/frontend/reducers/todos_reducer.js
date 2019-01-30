import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  switch (action.type) {
    case (RECEIVE_TODOS):
      let newTodoState = {};
      action.todos.forEach(todo => newTodoState[todo.id] = todo);
      return newTodoState;
    case (RECEIVE_TODO):
      let nextState = Object.assign({}, state);
      nextState[action.todo.id] = action.todo;
      return nextState;
    case (REMOVE_TODO):
      const copy = Object.assign({}, state);
      delete copy[action.id];
      return copy;
    default:
      return state;
  }
};

export default todosReducer;