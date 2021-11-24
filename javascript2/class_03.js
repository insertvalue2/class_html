// 자료형
// 8가지 기본 자료형이 존대 


// 자바 스크립트 자료형 특징 
// 어떤 순간에는 문자, 어떤 순간에는 숫자가 될 수 있다. 

// 오류가 아님 
let message = "hello";
message = 12345;
console.log(message);


// 1. 숫자형 
let n = 123;
n = 12.345;
//(number type) 정수 및 부동 소수점 숫자를 나타냅니다. 
// * , / , + / - 

// Infinity  (무한대) '특수 숫자 값' 
console.log(1 / 0);
console.log(Infinity);

// NaN 
console.log("숫자가 아님 " / 2);

// BigInt - 표준으로 채택된지 얼마 안 된 자료형 
// 끝에 'n'이 붙으면 BigInt 자료형 입니다. (2에 53승 -1 )
const bigNumber1 = 1234543452123123122342412343451123n;
console.log(bigNumber1);


console.log('-----------------------------')

// 2. 문자형 


