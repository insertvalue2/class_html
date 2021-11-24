// 'use strict'
// 엄격 모드, 최상단에 'use strict' 선언 해야 적용

let message;
message = 'Hello javascript';
console.log(message);

// 한 줄에 여러 변수를 선언


// let user = 'John', age = 25, message = "Hello"; <-- 변수를 두번 선언하면 에러가 발생 
let user = 'John', age = 25, message2 = "Hello";
console.log(user + " / " + age + " / " + message2);

// 변수 명명 규치 
// 1. 변수에 오직 문자와 숫자, 그리고 기호 $, _ 만 들어갈 수 있습니다. 
// 2. 첫 글자는 숫자가 될 수 없습니다. 

// 대 소문자 구별 
// let apple , let Apple 는 서로 다른 변수 입니다. 


// 예약어는 변수명으로 사용할 없습니다. 
// ex) let class return function 


// 변수 선언시 반드시 let과 함께 사용하세요. 
// num = 5;
// console.log(num);

// 상수 
// 상수를 선언 할때는  const 를 사용 
const yourBirthday = '2000.10.10';
// yourBirthday = '2001.11.11'; <-- 오류 

// 대문자 상수 
const COLOR_RED = "#F00";
const COLOR_GREEN = "#0F0";
const COLOR_BLUE = "#00F";
const COLOR_ORANGE = "#FF7F00";

// 색상을 고르고 싶을 때 별칭을 사용할 수 있게 되었습니다.
let color = COLOR_ORANGE;
console.log(color);


