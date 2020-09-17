window.addEventListener("load", function() {
  let btn = document.getElementById("start-btn");
  let btn1 = document.getElementById("end-btn");
  let changeText = document.getElementById("message-contents");
  
  btn.addEventListener("click", function() {
      changeText.innerHTML = "おはようございます！今日も１日頑張りましょう！";
  });
  btn1.addEventListener("click", function() {
      changeText.innerHTML = "今日も１日お疲れ様でした！";
  });
});
