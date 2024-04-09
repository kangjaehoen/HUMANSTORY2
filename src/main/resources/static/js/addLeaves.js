// JavaScript 파일 내용

// 버튼 클릭 시 호출되는 함수
function submitVacationRequest() {
    // 여기에 휴가 신청에 필요한 동작을 추가합니다.
    // 예를 들어, AJAX를 사용하여 서버로 데이터를 전송하거나,
    // 폼을 서버에 제출할 수 있습니다.
    alert("휴가 신청이 완료되었습니다!"); // 예시로 경고창을 띄우는 코드
}

// 버튼 요소를 가져와서 클릭 이벤트를 추가합니다.
const submitButton = document.querySelector(".submit-button");
submitButton.addEventListener("click", submitVacationRequest);
