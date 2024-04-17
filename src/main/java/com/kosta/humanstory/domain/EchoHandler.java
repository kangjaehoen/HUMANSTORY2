package com.kosta.humanstory.domain;

import com.kosta.humanstory.Config.auth.PrincipalDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


public class EchoHandler extends TextWebSocketHandler {

    //로그인 개별저장
    Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();



    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String sessionId = getMemberId(session);// 로그인한 세션 아디 확인
        if(sessionId!=null) {	
            users.put(sessionId, session);   // 로그인중 개별유저 저장
        }
    }

    //js 메세지를 받아보자 !!!
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String senderId = getMemberId(session);

        String msg = message.getPayload(); // WebSocket 메세지를 가져온다.
        if (msg != null) {
            String[] strs = msg.split(","); //쉼표 기준임
            System.out.println(strs.toString());
            if (strs != null && strs.length == 4) {
                String type = strs[0]; // 채팅인지 이벤트인지 판단한다는데 뭔지 모르겠음 ㅋㅋㅋ
                String target = strs[1]; // 메시지를 받을 대상인거같음.
                String content = strs[2]; //메시지의 내용( 뷰단에서 직적 입력하는 부분인가?)
                String url = strs[3]; // 이거 진짜 뭐임?
                WebSocketSession targetSession = users.get(target);  // 메시지를 받을 상대를 조회해서 전송

                if(targetSession!=null) {
                    TextMessage tmpMsg = new TextMessage("<a target='_blank' href='" + url + "'>[<b>" + type + "</b>] " + content + "</a>");
                    targetSession.sendMessage(tmpMsg);

                }
            }
        }

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String senderId = getMemberId(session);
        if(senderId !=null){
            users.remove(senderId); // 세션 삭제
        }
    }
    private String getMemberId(WebSocketSession session) {
        Map<String, Object> httpSession = session.getAttributes();
      //  String empNum = (String) httpSession.get("empNum"); // 세션에 저장된  empNum 조회함
        System.out.println("웹소켓 httpSession : "+httpSession);
     //   return empNum==null? null: empNum;
        return  null;
    }
}
