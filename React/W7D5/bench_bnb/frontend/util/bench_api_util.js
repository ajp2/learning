export const fetchBenches = bounds => (
  $.ajax({
    method: "GET",
    url: "/api/benches",
    data: bounds,
    error: err => console.log(err)
  })
);

export const createBench = bench => (
  $.ajax({
    method: "POST",
    url: "/api/benches",
    data: { bench },
    error: err => console.log(err)
  })
);