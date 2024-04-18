<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../ShareView/sideBar.jsp"%>

<!-- 리스트 시작 지점 -->

<div class="sm:ml-64 mt-14 bg-gray-100 p-4">

    <div class="flex justify-between w-full max-w-full bg-white rounded-lg shadow-lg overflow-hidden mb-4 p-4">
        <!-- 이전 달 버튼 -->
        <button id="prevMonthBtn"
                class="px-4 py-2 bg-gray-800 text-white rounded-md focus:outline-none focus:bg-gray-600"><svg
                xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 cursor-pointer" fill="none" viewBox="0 0 24 24"
                stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
        </svg>
        </button>
        <!-- 월 표시 -->
        <h2 id="currentMonth" class="text-lg font-semibold"></h2>
        <!-- 다음 달 버튼 -->
        <button id="nextMonthBtn"
                class="px-4 py-2 bg-gray-800 text-white rounded-md focus:outline-none focus:bg-gray-600">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 cursor-pointer" fill="none" viewBox="0 0 24 24"
                 stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
            </svg>
        </button>
    </div>

    <div id="grid" class="w-full max-w-full bg-white rounded-lg shadow-lg overflow-hidden"></div>

    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {

            let currentDate = new Date();
            let currentYear = currentDate.getFullYear();
            let currentMonth = currentDate.getMonth() + 1; // 월은 1을 더해줍니다.

            function generateColumns(year, month) {
                const daysInMonth = new Date(year, month, 0).getDate(); // 이전 달의 마지막 날을 가져옵니다.
                const columns = [
                    { header: 'ID', name: 'employeeId' },
                    { header: 'Employee Name', name: 'employeeName', width: 120 } // Employee Name 열 추가
                ];
                // 요일을 추가합니다.
                for (let i = 1; i <= daysInMonth; i++) {
                    columns.push({
                        header: i,
                        name: 'col'+i,
                        renderer: 'html' // HTML 렌더링을 사용합니다.
                    });
                }
                return columns;
            }



            async function generateData(year, month) {

                const daysInMonth = new Date(year, month, 0).getDate(); // 이전 달의 마지막 날을 가져옵니다.
                const data = [];

                const response = await fetch('http://localhost:8081/leave/grid');
                const jsonData = await response.json();

                for (const employee of jsonData) {
                    const employeeData = { employeeId: employee.empNum, employeeName: employee.employeeName }; // employeeId 추가
                    for (let i = 1; i <= daysInMonth; i++) {
                        const currentDate = new Date(year, month - 1, i + 1); // 날짜는 1을 빼주고 1일부터 시작합니다.
                        const key = currentDate.toISOString().split('T')[0]; // ISO 형식으로 변환하여 키 생성
                        const value = (key >= employee.startDate && key <= employee.endDate) ? `<div class="cell-content"><img src="/img/plane.png" alt="V"></div>` : ''; // 이미지로 표시
                        employeeData['col'+i] = value;
                    }
                    data.push(employeeData);
                }

                return data;
            }


            const instance = new tui.Grid({
                el: document.getElementById('grid'),
                columns: generateColumns(currentYear, currentMonth),
                data: []
            });

            tui.Grid.applyTheme('striped');

            // 버튼 클릭 시 이벤트 처리
            document.getElementById('prevMonthBtn').addEventListener('click', function () {
                currentMonth -= 1;
                if (currentMonth < 1) {
                    currentYear -= 1;
                    currentMonth = 12;
                }
                updateGrid(currentYear, currentMonth);
            });

            document.getElementById('nextMonthBtn').addEventListener('click', function () {
                currentMonth += 1;
                if (currentMonth > 12) {
                    currentYear += 1;
                    currentMonth = 1;
                }
                updateGrid(currentYear, currentMonth);
            });

            // 그리드 업데이트 함수
            async function updateGrid(year, month) {
                const grid = instance;

                // 컬럼 업데이트
                const newColumns = generateColumns(year, month);
                grid.setColumns(newColumns);

                // 데이터 업데이트
                const newData = await generateData(year, month);
                grid.resetData(newData);

                // 월 표시 업데이트
                document.getElementById('currentMonth').textContent = year + '년 ' + month + '월'; // 월은 1을 더하지 않습니다.
            }

            // 초기 월 표시
            document.getElementById('currentMonth').textContent = `${currentYear}년  ${currentMonth}월`; // 월은 1을 더하지 않습니다.

            // 초기 그리드 업데이트
            updateGrid(currentYear, currentMonth);
        });
    </script>


</div>

</body>
</html>

