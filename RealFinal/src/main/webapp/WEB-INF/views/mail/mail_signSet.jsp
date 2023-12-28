<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div id="contents">
	<div class="setting_title">
		<h3 style="display: inline-block">서명 설정</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box">
			<form>
				<div class="setting_field">
					<h4>
						서명 목록
						<button type="button" class="weakblue"
							onclick="javascript:Sign.AddSign();this.blur();return false;">만들기</button>
					</h4>
					<table class="tableType01 mt10 tb_signature" id="tableSignList">
						<caption>서명 설정 목록으로 서명제목, 미리보기, 수정, 삭제로 구성되어 있습니다.</caption>
						<colgroup>
							<col width="">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">서명제목</th>
								<th scope="row">미리보기</th>
								<th scope="row">수정</th>
								<th scope="row">삭제</th>
							</tr>
							<tr>
								<td>서명</td>
								<td class="ta_c"><button class="weakblue"
										onclick="Sign.preview('322');this.blur();return false;">미리보기</button></td>
								<td class="ta_c"><button class="weakblue"
										onclick="Sign.ModSign('322');this.blur();return false;">수정</button></td>
								<td class="ta_c"><button class="weakblue"
										onclick="Sign.DelSign('322');this.blur();return false;">삭제</button></td>
							</tr>
							<tr>
								<td>서명만들기뭔데?</td>
								<td class="ta_c"><button class="weakblue"
										onclick="Sign.preview('324');this.blur();return false;">미리보기</button></td>
								<td class="ta_c"><button class="weakblue"
										onclick="Sign.ModSign('324');this.blur();return false;">수정</button></td>
								<td class="ta_c"><button class="weakblue"
										onclick="Sign.DelSign('324');this.blur();return false;">삭제</button></td>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<h4 class="mgt_50">기본 서명 선택</h4>
					<ul class="sgnt_select" ,="" id="signSelectList">

						<li><div>
								<span>대표이사</span> &lt;<span>ceo@gabia.biz</span>&gt;
							</div> <span><label for="sel_sign_1280" class="blind">기본
									서명 선택하기</label><select name="sel_sign_1280" id="sel_sign_1280"><option
										value="0">미사용</option>
									<option value="322">서명</option>
									<option value="324">서명만들기뭔데?</option></select>
								<button type="button" class="weakblue"
									onclick="Sign.setBasicSign('sel_sign_1280',1280); this.blur(); return false;">적용</button></span></li>
					</ul>
				</div>

				<input type="hidden" name="font_family" id="font_family"
					value="맑은 고딕"> <input type="hidden" name="font_size"
					id="font_size" value="16px"> <input type="hidden"
					id="USER_INFO_NO" value="2812">
			</form>
		</div>
	</div>
	<div id="layer_m_preview_iframe_view"
		class="layer_box external-mail hide popup21"
		style="margin-left: -401px; margin-top: -208px; display: none; z-index: 1020">
		<div class="title_layer text_variables">미리보기</div>
		<div class="table_scrollbox" style="height: 462px; overflow: hidden">
			<iframe id="ifPreviewSrc" style="height: 462px; width: 100%;"
				border="0" frameborder="0"></iframe>
		</div>
		<div class="layer_button">
			<button class="btn_variables doublelayer" type="button"
				onclick="$('ifPreviewSrc').src = ''; hidePopup();">닫기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer doublelayer"
			onclick="$('ifPreviewSrc').src = ''; hidePopup(); return false;"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
</div>