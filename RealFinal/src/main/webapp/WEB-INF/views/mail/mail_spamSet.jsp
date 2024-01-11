<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div id="contents">
	<div class="setting_title">
		<h3>스팸 설정</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box">
			<form>
				<div class="setting_field">
					<ul class="tabType1">
						<!-- <li class=""><a href="/gabia.biz/mail/webmail/s_spam_main">스팸
											차단 설정</a></li> -->
						<!-- <li class=""><a href="/gabia.biz/mail/webmail/s_spam_p">파워
											스팸 설정</a></li> -->
						<!-- <li class=""><a
										href="/gabia.biz/mail/webmail/s_spam_allow">수신 허용 설정</a></li> -->
						<li class="on"><a
							href="/gabia.biz/mail/webmail/s_spam_denied">수신 거부 설정</a></li>
						<!-- <li class=""><a href="/gabia.biz/mail/webmail/s_spam_move">스팸
											편지함 이동 설정</a></li> -->
					</ul>

					<div class="tab_page" id="tab_page4">
						<p class="set_bull pdt_30">· 스팸메일 차단 설정과 상관없이 메일을 거부하고자 하는
							메일주소 및 도메인을 등록하시면 메일 수신이 거부됩니다.</p>
						<p class="set_bull pdt_10">· 수신 허용 목록의 이메일 및 도메인은 수신 거부 목록에
							있어도 수신이 허용됩니다. 거부 목록 추가 시 수신 허용 목록을 꼭 확인하시기 바랍니다.</p>
						<p class="set_bull pdt_10">
							· 수신 거부 가능 개수는 메일 수와 도메인 수를 합해 총 3,000개까지입니다. (<span
								class="weakblue" id="totalCount">1</span>/3000)
						</p>
						<div class="permitReceive">
							<div class="left" style="width: 400px;">
								<h4>
									<label for="addEmail3">수신 거부 이메일 검색/추가</label>
								</h4>
								<div class="addEmail">
									<input name="txtBlockAddr" id="txtBlockAddr" type="text"
										style="width: 250px">
									<button type="button" class="weakblue"
										onclick="Spam.addRule('BA'); this.blur(); return false;">추가</button>
								</div>
								<h4>수신 거부 이메일 목록</h4>
								<div class="receiveList">
									<div class="searchEmail" style="margin-bottom: 10px;">
										<input name="txtAllowAddr" id="searchBlockAddr" type="text"
											style="width: 250px; margin-right: 2px;">
										<button type="button" class="weakblue"
											onclick="Spam.searchList('BA'); this.blur(); return false;">검색</button>
										<span class="hide" id="searchEmailReset"> <span
											class="grey_bar">|</span>
											<button type="button" class="weakblue"
												onclick="Spam.searchList('BA','Y'); this.blur(); return false;">검색
												취소</button>
										</span>
									</div>
									<select id="selBlockAddrList" name="selBlockAddrList"
										multiple="multiple"
										style="float: left; width: 250px; height: 320px; padding: 20px; margin-right: 10px; border: 1px solid #ccc; overflow-x: auto;"><option
											value="11886860">cherrykim@cherryhongsam.kr</option></select>
									<button type="button" class="weakblue"
										onclick="Spam.removeRule('BA'); this.blur(); return false;">삭제</button>
								</div>
							</div>
							<div class="right">
								<h4>
									<label for="addEmail4">수신 거부 도메인 검색/추가</label>
								</h4>
								<div class="addEmail">
									<input type="text" class="input02 input_s01"
										id="txtBlockDomain" name="txtBlockDomain" style="width: 250px">
									<button type="button" class="weakblue"
										onclick="Spam.addRule('BD'); this.blur(); return false;">추가</button>
								</div>
								<h4>수신 거부 도메인 목록</h4>
								<div class="receiveList">
									<div class="searchEmail" style="margin-bottom: 10px;">
										<input name="txtAllowAddr" id="searchBlockDomain" type="text"
											style="width: 250px; margin-right: 2px;">
										<button type="button" class="weakblue"
											onclick="Spam.searchList('BD'); this.blur(); return false;">검색</button>
										<span class="hide" id="searchDomainReset"> <span
											class="grey_bar">|</span>
											<button type="button" class="weakblue"
												onclick="Spam.searchList('BD','Y'); this.blur(); return false;">검색
												취소</button>
										</span>
									</div>
									<select id="selBlockDomainList" name="selBlockDomainList"
										multiple="multiple"
										style="float: left; width: 250px; height: 320px; padding: 20px; margin-right: 10px; border: 1px solid #ccc; overflow-x: auto;"></select>
									<button type="button" class="weakblue"
										onclick="Spam.removeRule('BD'); this.blur(); return false;">삭제</button>
								</div>
							</div>
						</div>
						<p class="set_bull pdt_20">· 관리자가 추가한 도메인, 이메일은 사용자가 삭제할 수
							없습니다.</p>
					</div>
					<div class="pdt_50"></div>

				</div>
			</form>
		</div>
		<div id="dimmed"></div>

		<!-- [D] 자동 로그아웃 안내 레이어 -->
		<div id="dimmed2"></div>

	</div>
	<div id="main_layer_div"></div>


	



</div>