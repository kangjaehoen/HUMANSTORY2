<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>알림</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="modal fade" id="notifyModal" tabindex="-1" role="dialog" aria-labelledby="notifyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notifyModalLabel">알림 보내기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="target">대상:</label>
                    <input type="text" class="form-control" id="target">
                </div>
                <div class="form-group">
                    <label for="content">내용:</label>
                    <textarea class="form-control" id="content" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="notifySendBtn">전송</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 전역변수 설정
    var socket  = null;
    $(document).ready(function(){
        // 웹소켓 연결
        sock = new SockJS("<c:url value="/echo-ws"/>");
        socket = sock;

        // 데이터를 전달 받았을때
        sock.onmessage = onMessage;
    });

    // toast생성 및 추가
    function onMessage(evt){
        var data = evt.data;
        // toast
        let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
        toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
        toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
        toast += "<span aria-hidden='true'>&times;</span></button>";
        toast += "</div> <div class='toast-body'>" + data + "</div></div>";
        $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
        $(".toast").toast({"animation": true, "autohide": false});
        $('.toast').toast('show');
    };

    $('#notifySendBtn').click(function(e){
        let modal = $('.modal-content').has(e.target);
        let type = '70';
        let target = modal.find('.modal-body input').val();
        let content = modal.find('.modal-body textarea').val();
        let url = '${contextPath}/member/notify.do';
        // 전송한 정보를 db에 저장
        $.ajax({
            type: 'post',
            url: '${contextPath}/member/saveNotify.do',
            dataType: 'text',
            data: {
                target: target,
                content: content,
                type: type,
                url: url
            },
            success: function(){    // db전송 성공시 실시간 알림 전송
                // 소켓에 전달되는 메시지
                // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
                socket.send("관리자,"+target+","+content+","+url);
            }
        });
        modal.find('.modal-body textarea').val('');	// textarea 초기화
    });

</script>


    <div id="msgStack"></div>


</body>
</html>