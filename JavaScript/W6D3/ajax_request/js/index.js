console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  url:
    "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  type: "GET",
  success: (msg) => console.log(msg.main.temp)
});

// Add another console log here, outside your AJAX request
console.log("After AJAX request");