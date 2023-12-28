<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div id="contents">
	<div class="content_title">
		<!-- Title -->
		<form>
			<fieldset>

				<span class="detail_select"> <a href="#"
					onclick="MailView.Link('reply','3316125');">답장</a>
				</span> <span class="detail_select"> <a href="#"
					onclick="MailView.Link('replyall','3316125');">전체답장</a>
				</span> <span class="detail_select"> <a href="#"
					onclick="MailView.Link('forward','3316125');">전달</a>
				</span> <span class="detail_select"> <a href="#"
					onclick="MailView.Trash('3316125');">삭제</a>
				</span> <span class="detail_select"> <a href="#"
					onclick="MailView.DeleteComp('3316125');">완전삭제</a>
				</span> <span class="detail_select"> <a href="#"
					id="m_view_move_mbox">이동<img
						src="/static/ui/images/btn_drop.gif" alt="이동 드롭다운 메뉴 열기"
						class="open_drop"></a>
					<div class="dropdown hide" id="m_view_move_mbox_detail">
						<div class="dropscroll-menu">
							<ul style="min-width: 220px; border-color: #2985db">
								<li><a href="javascript:void(0)" id="move_b0"
									onclick="MailView.moveTo('3316125','b0')">받은 편지함</a></li>
								<li><a href="javascript:void(0)" id="move_b1"
									onclick="MailView.moveTo('3316125','b1')">보낸 편지함</a></li>
								<li><a href="javascript:void(0)" id="move_b2"
									onclick="MailView.moveTo('3316125','b2')">보낼 편지함</a></li>
								<li><a href="javascript:void(0)" id="move_b3"
									onclick="MailView.moveTo('3316125','b3')">임시 보관함</a></li>
								<li><a href="javascript:void(0)" id="move_b4"
									onclick="MailView.moveTo('3316125','b4')">스팸 편지함</a></li>
								<li><a href="javascript:void(0)" id="move_b5"
									onclick="MailView.moveTo('3316125','b5')">휴지통</a></li>
								<li><a href="javascript:void(0)" id="move_813"
									onclick="MailView.moveTo('3316125','813')">대충</a></li>
							</ul>
							<!--
																<div><nobr><input class="text-box" onclick="MailView.bLayerNoHide = true;" onfocus="MailView.bLayerNoHide = true;" type="text" name="txtNewMailBoxToMake" id="txtNewMailBoxToMake" placeholder="새 편지함" title="새 편지함"> <a class="text-point" href="#" onclick="MailView.makeNewMailbox();" >추가</a></nobr></div>
																<div><input id="check_v1" type="checkbox"><label for="check_v1">계속 이동</label></div>
																<div><input id="check_v2" type="checkbox"><label for="check_v2">이미 받은 메일 함께 이동</label></div>
															-->
							<!-- 														<div><input class="text-box"  onclick="MailView.bLayerNoHide = true;" name="txtNewMailBoxToMake" id="txtNewMailBoxToMake" onfocus="MailView.bLayerNoHide = true;" type="text" placeholder="새 편지함" title="새 편지함"> <a href="#" onclick="MailView.makeNewMailbox();"><span class="point_color">추가</span></a></div> -->
							<div>
								<input id="check_v1" name="check_v1" type="checkbox"
									onfocus="MailView.bLayerNoHide = true;"
									onclick="MailView.bLayerNoHide = true;" value="N"><label
									for="check_v1">계속 이동</label>
							</div>
						</div>
					</div>
				</span> <span class="detail_select"> <a href="#"
					id="m_view_more_menu">다른 작업<img
						src="/static/ui/images/btn_drop.gif" alt="다른작업 드롭다운 메뉴 열기"
						class="open_drop"></a>
					<div class="dropdown hide" id="m_view_more_menu_detail">
						<ul class="dropdown-menu">
							<li><a href="#" onclick="MailView.Print('3316125');">인쇄</a></li>
							<li><a href="#" onclick="MailView.markAsInView();"
								current_value="N" id="aReadFlag">안 읽음으로 표시</a></li>
							<li><a href="#"
								onclick="location.href='/gabia.biz/mail/webmail/m_current_download/3316125'">다운로드(PC저장)</a></li>
							<li><a href="#" onclick="MailView.ShowOrigin('3316125');">원문보기</a></li>
							<li><a
								href="https://boards.office.hiworks.com/board/postwrite/mailtoboard/3316125/new">게시판에
									등록하기</a></li>
							<li><a href="#" onclick="Memo.addMemo();">메모</a></li>

						</ul>
					</div>
				</span>
			</fieldset>
		</form>
		<div class="setting_box">
			<a class="icon list_bt" href="/gabia.biz/mail/webmail/m_list/b0#"
				title="목록"><span class="blind">목록보기</span></a>
		</div>
		<!-- Title End -->
	</div>

	<input type="hidden" name="hidCondition" id="hidCondition" value="">

	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box mailview" style="max-width: 100%">
			<form>
				<div class="view_field" id="view_field">
					<h3>
						<a href="#" onclick="MailView.setStar();" star="N"
							class="icon impt " id="aStar"><span class="blind">중요
								메일 표시</span></a> <span class="title">안녕하세요. 프로젝트 지옥이 시작되었어요.</span> <a
							href="#" id="spMemoDisplay" onclick="Memo.addMemo(3316125);"
							class="memo">메모 추가</a>
					</h3>
					<p class="date">2023-12-03 13:47:29</p>
					<div class="top_link">
						<a href="#" id="spMemoDisplayOrigin"
							onclick="Memo.addMemo(3316125);" class="memo"></a>
					</div>
					<div class="sender">
						보낸 사람: <span id="from_addr" name="ceo@gabia.biz">대표이사
							&lt;ceo@gabia.biz&gt;</span> <span style="float: right"
							id="send_ip_info" data-kind="internal" data-ip="empty"
							data-text="웹인증 내부 메일"><span>웹인증 내부 메일</span></span>
					</div>
					<div class="addressee">
						받는 사람: "김체리 대표" &lt;cherrykim@cherryhongsam.kr&gt; <a href="#"
							class="weakblue"
							onclick="new_address.inMailView('3316125','to_addr')">주소추가</a>
					</div>






					<!-- 스팸 편지함 및 휴지통으로 이동한 메일 banner -->

					<!-- tnef start -->



					<!-- tnef -->
					<div id="phising_href_warning" class="spf-area"
						style="background: #FFE5DF; display: none">
						<img src="/static/ui/images/alert_red.png"
							style="vertical-align: middle"> <b style="color: #C70909">이
							메일은 사칭, 피싱메일의 가능성이 높습니다.</b> <span style="color: #C70909">첨부된
							파일 및 본문 링크에 각별히 유의하시기 바랍니다.</span>
					</div>

					<div class="mailbody" id="mailbody" style="padding-right: 30px;">
						<!-- @민경 일단 아이프레임 때문에 404 뜸 나중에 수정 ㄱ  -->
						<iframe src="/gabia.biz/mail/webmail/m_view_content/3316125"
							height="300px" style="width: 100%; height: 300px;" scrolling="no"
							frameborder="0" id="ifMailContent" name="ifMailContent">
						</iframe>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Contents End-->
	<input type="hidden" name="origin_msg" value=""> <input
		type="hidden" name="mail_no" id="mail_no" value="3316125"> <input
		type="hidden" name="is_approval" id="is_approval" value=""> <input
		type="hidden" name="is_secure" id="is_secure" value="">

	<!-- to download -->
	<form name="frmDownload" action="mail/mail_eml_down.php">
		<input type="hidden" name="mail_mbox" value=""> <input
			type="hidden" name="gubun" value="now"> <input type="hidden"
			name="value" value="">
	</form>


</div>