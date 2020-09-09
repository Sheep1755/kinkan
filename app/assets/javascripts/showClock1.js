function set2fig(num) {
  let ret;
  if( num < 10 ) { ret = "0" + num; }
  else { ret = num; }
  return ret;
}
function showClock1() {
  let nowTime = new Date();
  let yobi= new Array("Sun","Mon","Thu","Wed","Thr","Fri","Sat");
  let year = nowTime.getFullYear();
  let month = nowTime.getMonth()+1;
  let day = nowTime.getDate();
  let week = yobi[nowTime.getDay()];
  let nowHour = set2fig( nowTime.getHours() );
  let nowMin  = set2fig( nowTime.getMinutes() );
  let nowSec  = set2fig( nowTime.getSeconds() );
  let msg1 =  year + "/"+ month + "/" + day + " (" + week + ")";
  let msg2 =  nowHour + ":" + nowMin + ":" + nowSec;
  document.getElementById("RealdayArea").innerHTML = msg1
  document.getElementById("RealtimeClockArea").innerHTML = msg2;
}
setInterval(showClock1,1000);
