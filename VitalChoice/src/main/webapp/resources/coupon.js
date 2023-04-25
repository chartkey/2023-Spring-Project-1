var rolLength = 6; // 해당 룰렛 콘텐츠 갯수
var setNum; // 랜덤숫자 담을 변수
var hiddenInput = document.createElement("input");
hiddenInput.className = "hidden-input";

//랜덤숫자부여
const rRandom = () => {
  var min = Math.ceil(0);
  var max = Math.floor(rolLength - 1);
  return Math.floor(Math.random() * (max - min)) + min;
};

const rRotate = () => {
  var panel = document.querySelector(".rouletter-wacu");
  var btn = document.querySelector(".rouletter-btn");
  var deg = [];
  // 룰렛 각도 설정(rolLength = 6)
  for (var i = 1, len = rolLength; i <= len; i++) {
    deg.push((360 / len) * i);
  }
  
  // 랜덤 생성된 숫자를 히든 인풋에 넣기
  var num = 0;
  document.body.append(hiddenInput);
  setNum = hiddenInput.value = rRandom();
	
  // 애니설정
  var ani = setInterval(() => {
    num++;
    panel.style.transform = "rotate(" + 360 * num + "deg)";
    btn.disabled = true; //button,input
    btn.style.pointerEvents = "none"; //a 태그
    
    // 총 50에 다달했을때, 즉 마지막 바퀴를 돌고나서
    if (num === 50) {
      clearInterval(ani);
      panel.style.transform = `rotate(${deg[setNum]}deg)`;
    }
  }, 50);
};

// 정해진 alert띄우기, custom modal등
const rLayerPopup = (num) => {
	const result = document.querySelector("#result");
  switch (num) {
    case 1:
      alert("당첨!! 5% 쿠폰");
	result.value = "5";
      break;
    case 3:
      alert("당첨!! 10% 쿠폰");
result.value = "10";
      break;
    case 5:
      alert("당첨!! 15% 쿠폰");
result.value = "15";
      break;
    default:
      alert("꽝! 다음기회에");
result.value = "0";
  }
};

// reset
const rReset = (ele) => {
  setTimeout(() => {
    ele.disabled = false;
    ele.style.pointerEvents = "auto";
    rLayerPopup(setNum);
    hiddenInput.remove();
rouletteForm.submit();
  }, 5500);
};

// 룰렛 이벤트 클릭 버튼
document.addEventListener("click", function (e) {
  var target = e.target;
  if (target.tagName === "BUTTON") {
    rRotate();
    rReset(target);
  }
});
var userId = document.getElementById("user_id").value;
var date = document.getElementById("date").value;
// roulette default
document.getElementById("app").innerHTML = `
<form id="roulette-form" action="couponsave" method="post">
  <div class="rouletter">
    <div class="rouletter-bg">
        <div class="rouletter-wacu"></div>
    </div>
    <div class="rouletter-arrow"></div>
    <button class="rouletter-btn">start</button>
  </div>
  <input type="hidden" id="result" name="result" value="" />
  <input type="hidden" id="user_id" name="user_id" value="`+userId+`"/>
  <input type="hidden" id="date" name="date" value="`+date+`"/>
</form>
`;
// 폼 전송
const rouletteForm = document.querySelector("#roulette-form");
rouletteForm.addEventListener("submit", (e) => {
  e.preventDefault();
  const formData = new FormData(e.target);
  const result = formData.get("result");
  console.log(result);
});