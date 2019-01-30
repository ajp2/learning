export const allTodos = (state) => (
  Object.keys(state.todos).map(id => state.todos[id])
);

export const stepsByTodoId = (state, todoId) => {
  const stepIds = Object.keys(state.steps);
  const filteredTodos = [];
  stepIds.forEach(stepId => {
    if (state.steps[stepId].todo_id === todoId) {
      filteredTodos.push(state.steps[stepId]);
    }
  });

  return filteredTodos;
};

window.stepsByTodoId = stepsByTodoId;