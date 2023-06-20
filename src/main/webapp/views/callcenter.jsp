<%--jsp 작성을 위해 아래 3줄은 기입.--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>

<script>
    let callcenter = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $("#connect").click(function() {
                callcenter.connect();
            });
            $("#disconnect").click(function() {
                callcenter.disconnect();
            });

            $("#sendto").click(function() {
                callcenter.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('${adminserver}/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                callcenter.setConnected(true);
                console.log('Connected: ' + frame);

                this.subscribe('/send/to/'+sid, function(msg) {
                    $('#target').val(JSON.parse(msg.body).sendid);
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            callcenter.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("채팅연결중");
            } else {
                $("#status").text("연결해제");
            }
        },
        sendTo:function(){ // 특정인에게 msg
            var msg = JSON.stringify({
                'sendid' : this.id,
                'receiveid' : $('#target').val(),
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg); //receiveto : admin의 msg컨트롤러가 처리
        }
    };
    $(function(){
        callcenter.init();
    })

</script>
<!-- Begin Page Content -->
<main>
    <div class="container-fluid px-4">
        <p class="page_header_cust"><strong>[Q&A] 1:1 채팅</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 고객만족부 담당자들은 문의사항에 대하여 정확하고 신속한 답변 바랍니다..</p>
                <p>ㅇ 선택삭제 기능은 작동 안합니다</p>
                <hr/>
            </div>
        </div>
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800"></h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header">
                <i class="fas fa-user"></i>
                실시간 고객상담
            </div>
            <div class="card-body">
                <div id="container"></div>
                <div class="col-sm-5">
                    <h4 id="adm_id">${loginadmin.admin_name}</h4>
                    <H4 id="status">대기중</H4>
                    <button id="connect">채팅 연결</button>
                    <button id="disconnect">연결 해제</button>
                    <br>
                    <input type="text" id="target"> <%-- 메세지 보낸사람의 id가 표시되는 공간 --%>

                    <input type="text" id="totext"><button id="sendto">전송</button>
                    <div id="to"></div>

                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</main>