export const fetchBenches = filters => (
  $.ajax({
    method: "GET",
    url: "/api/benches",
    data: { bounds: filters },
    error: err => console.log(err)
  })
);