export const signup = user => (
  $.ajax({
    method: "POST",
    url: "/api/users",
    data: { user }
  })
);

export const login = user => (
  $.ajax({
    method: "POST",
    url: "/api/session",
    data: { user }
  })
);

export const logout = () => (
  $.ajax({
    method: "DELETE",
    url: "/api/session"
  })
);

window.signup = signup;
window.login = login;
window.logout =logout;

logout().then(res => console.log(res), err => console.log(JSON.parse(err.responseText)));