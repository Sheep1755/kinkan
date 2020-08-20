function set1fig(num) {
  let ret;
  if( num < 10 ) { ret = "0" + num; }
  else { ret = num; }
  return ret;
}
function time1() {
  let nowTime = new Date();
  let nowHour = set1fig( nowTime.getHours() );
  let nowMin  = set1fig( nowTime.getMinutes() );
  let nowSec  = set1fig( nowTime.getSeconds() );
  let msg3 =  nowHour + ":" + nowMin + ":" + nowSec;
  document.getElementById(".side-bar__username").innerHTML = msg3;
};
