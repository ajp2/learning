document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'red';
  ctx.fillRect(50, 50, 150, 100);

  ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = 'blue';
  ctx.fill();
});
