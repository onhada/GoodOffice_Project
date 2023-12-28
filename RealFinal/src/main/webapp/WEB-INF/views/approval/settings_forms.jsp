<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<div id="contents">
	<div class="setting_title">
		<h3>양식함 관리</h3>
	</div>
	<div class="content_inbox approval-admin">
		<div class="cont_box">
			<div class="content_title after">
				<ul class="partition-list">
					<li><a href="/gabia.biz/approval/settings/write_form">양식생성</a></li>
					<li><a href="javascript:void(0);"
						onclick="ApprovalSetting.categorySetting();">분류설정</a></li>
					<li><a href="/gabia.biz/approval/db_unit/lists">DB 유닛</a></li>
					<li><a href="javascript:void(0);"
						onclick="ApprovalSetting.approvalRule();" class="fl"
						style="padding-right: 6px">사내전자결재규정</a> <a
						href="javascript:void(0)" class="icon question tipsIcon"
						style="position: relative; top: 0; margin-right: 10px;"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0;">
							<div class="tooltip-box color-set-6" style="width: 400px;">
								<p>사내에서 전자결재 문서를 작성할 때 공통적으로 안내할 결재선 설정 방법과 위임 전결 규정 등을 등록하고
									수정할 수 있습니다.</p>
							</div>
						</div></li>
					<li><a href="/gabia.biz/approval/settings/sample_forms"
						class="fl" style="padding-right: 6px;">샘플양식</a> <a
						href="javascript:void(0)" class="icon question tipsIcon"
						style="position: relative; top: 0; margin-right: 10px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0;">
							<div class="tooltip-box color-set-6" style="width: 400px;">
								<p>
									하이웍스에서 제공하는 문서 양식을 모아둔 곳입니다. <br>언제든지 회사 양식으로 이용할 수 있으며
									새로운 양식이 지속적으로 업데이트됩니다.
								</p>
							</div>
						</div></li>
					<li><a href="/gabia.biz/approval/settings/office_apps"
						class="fl" style="padding-right: 6px;">결재연동</a> <a
						href="javascript:void(0)" class="icon question tipsIcon"
						style="position: relative; top: 0; margin-right: 10px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0;">
							<div class="tooltip-box color-set-6" style="width: 330px;">
								<p>결재연동 시 외부 솔루션에서 하이웍스 결재를 이용할 수 있습니다.</p>
							</div>
						</div></li>
				</ul>
			</div>

			<div class="allform-wrap wide">
				<div class="after" id="topFncApprovalForm" style="width: 1225px;">
					<div class="select-list-wrap fl">
						<label><input type="checkbox"
							class="js-approval-all-checkbox"></label> <a
							href="javascript:void(0);"
							class="js-approval-forms-first-type js-approval-btn-form-category"
							id="anchorApprovalFormCategory">보기: <span
							id="textApprovalFormCategory">모든 분류</span></a> <img
							src="/static/ui/images/btn_drop.gif" alt="DROPDOWN"
							class="open_drop vm js-approval-forms-first-type">
						<ul class="dropdown-menu hide js-approval-forms-first-type-layer"
							id="menuApprovalFormCategory">
							<li><a href="javascript:void(0);"
								class="js-approval-li-form-category" value="A">모든 분류</a></li>
							<li><a href="javascript:void(0);"
								class="js-approval-li-form-category" value="605">공통</a></li>
							<li><a href="javascript:void(0);"
								class="js-approval-li-form-category" value="606">시험 사용</a></li>
						</ul>
						<span
							class="mgl_10 check-number js-approval-forms-second-type hide"
							id="countApprovalCheckBox"></span>
						<button type="button"
							class="mgl_20 js-approval-forms-second-type hide"
							onclick="ApprovalSetting.categoryChangeSetting()">결재 분류
							변경</button>
						<button type="button"
							class="mgl_20 js-approval-forms-second-type hide"
							onclick="ApprovalSetting.processForm('USE');">사용으로 전환</button>
						<button type="button"
							class="mgl_20 js-approval-forms-second-type hide"
							onclick="ApprovalSetting.processForm('UNUSE');">미사용으로 전환</button>
						<button type="button"
							class="mgl_20 js-approval-forms-second-type hide"
							onclick="ApprovalSetting.processForm('DELETE');">삭제</button>
					</div>

					<div class="fr">
						<a href="javascript:void(0);"
							class="search_bt fl point_color hide"
							style="margin: 6px 10px 0 0;" id="resetSearchForms"
							onclick="ApprovalSetting.resetSearchForms();"><span
							class="sp_menu searchCancel"></span>검색 취소</a>
						<div class="data-search fl">
							<div class="search"
								style="background-position: 0px 0px; border-color: rgb(192, 197, 202);">
								<fieldset>
									<input type="text" id="textSearchForms"
										placeholder="양식명, 약칭 검색" autocomplete="off" maxlength="30"
										value=""> <span class="btn_search"
										onclick="ApprovalSetting.searchForms();"><span
										class="icon src"><em class="blind">검색</em></span></span>
								</fieldset>
							</div>
						</div>
					</div>
				</div>

				<table class="tableType01 listbox sapceT" id="tableApprovalForm"
					style="width: 1225px;">
					<caption>결재 등록 양식 리스트</caption>
					<!-- <colgroup>
					<col style="width:38px;">
					<col style="width:100px;">
					<col style="width:120px;">
					<col style="width:110px;">
					<col style="width:260px;">
					<col style="width:100px;">
					<col>
				</colgroup> -->
					<thead>
						<tr>
							<th style="width: 5px; white-space: nowrap;"
								class="resizable-false"></th>
							<th style="width: 70px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 70px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="form_type_division">구분</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 70px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 70px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="form_id">양식 ID</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 260px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 260px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="title">양식명</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 300px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 300px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="comment">설명</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 110px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 110px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="use_flag">상태</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 120px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 120px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="category_name">결재 분류</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 90px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 90px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="solution">기안 위치</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4610"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4610&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4610&quot;, &quot;V&quot;);">H4</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4610&quot;, &quot;V&quot;);"><div
									title="근무계획서">근무계획서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4610&quot;, &quot;V&quot;);">개인은
								권한설정상태에 따라 근무계획서를 신청</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4610&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4610&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4610&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4609"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4609&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4609&quot;, &quot;V&quot;);">H3</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4609&quot;, &quot;V&quot;);"><div
									title="근무계획서">근무계획서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4609&quot;, &quot;V&quot;);">부서장
								또는 부서근무관리자가 부서의 월 근무계획을 설정 가능</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4609&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4609&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4609&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4613"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4613&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4613&quot;, &quot;V&quot;);">H7</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4613&quot;, &quot;V&quot;);"><div
									title="근무체크 수정 요청서">근무체크 수정 요청서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4613&quot;, &quot;V&quot;);">출/퇴근시간
								및 근무체크 시간을 수정</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4613&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4613&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4613&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4608"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4608&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4608&quot;, &quot;V&quot;);">H12</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4608&quot;, &quot;V&quot;);"><div
									title="급여 지급 품의서">급여 지급 품의서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4608&quot;, &quot;V&quot;);">급여대장에서
								전자결재 품의 연동 가능</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4608&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4608&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4608&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4614"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4614&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4614&quot;, &quot;V&quot;);">H8</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4614&quot;, &quot;V&quot;);"><div
									title="시차출퇴근제 신청서">시차출퇴근제 신청서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4614&quot;, &quot;V&quot;);">개인이
								월, 분기별 시차출퇴근제를 신청 가능</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4614&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4614&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4614&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4611"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4611&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4611&quot;, &quot;V&quot;);">H5</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4611&quot;, &quot;V&quot;);"><div
									title="연장근무 신청서">연장근무 신청서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4611&quot;, &quot;V&quot;);">연장근무
								신청 및 승인 필요로 설정된 경우 신청 가능</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4611&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4611&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4611&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4616"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4616&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4616&quot;, &quot;V&quot;);">H10</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4616&quot;, &quot;V&quot;);"><div
									title="휴가 신청서">휴가 신청서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4616&quot;, &quot;V&quot;);">휴가신청서</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4616&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4616&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4616&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4612"
									disabled="disabled"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4612&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4612&quot;, &quot;V&quot;);">H6</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4612&quot;, &quot;V&quot;);"><div
									title="휴일근무 신청서">휴일근무 신청서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4612&quot;, &quot;V&quot;);">휴일근무신청이
								결재되어야 휴일 근무시간이 인정됨</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4612&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4612&quot;, &quot;V&quot;);"><div></div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4612&quot;, &quot;V&quot;);">인사</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4602"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4602&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4602&quot;, &quot;V&quot;);">H1-02</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4602&quot;, &quot;V&quot;);"><div
									title="지출 결의서">지출 결의서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4602&quot;, &quot;V&quot;);">지출
								결의서</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4602&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4602&quot;, &quot;V&quot;);"><div
									title="시험 사용">시험 사용</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4602&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4597"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4597&quot;, &quot;V&quot;);">시스템</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4597&quot;, &quot;V&quot;);">H1-01</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4597&quot;, &quot;V&quot;);"><div
									title="지출 결의서">지출 결의서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4597&quot;, &quot;V&quot;);">지출
								결의서</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4597&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4597&quot;, &quot;V&quot;);"><div
									title="공통">공통</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4597&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4603"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4603&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4603&quot;, &quot;V&quot;);">N5</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4603&quot;, &quot;V&quot;);"><div
									title="(기업용) 공문">(기업용) 공문</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4603&quot;, &quot;V&quot;);">일반
								기업용 공문</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4603&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4603&quot;, &quot;V&quot;);"><div
									title="시험 사용">시험 사용</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4603&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4607"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4607&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4607&quot;, &quot;V&quot;);">N9</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4607&quot;, &quot;V&quot;);"><div
									title="(비영리 기관용) 공문">(비영리 기관용) 공문</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4607&quot;, &quot;V&quot;);">비영리
								기관용 공문</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4607&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4607&quot;, &quot;V&quot;);"><div
									title="시험 사용">시험 사용</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4607&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4604"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4604&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4604&quot;, &quot;V&quot;);">N6</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4604&quot;, &quot;V&quot;);"><div
									title="업무연락">업무연락</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4604&quot;, &quot;V&quot;);">업무
								연락(사내 부서간 통신문)</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4604&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4604&quot;, &quot;V&quot;);"><div
									title="시험 사용">시험 사용</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4604&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4599"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4599&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4599&quot;, &quot;V&quot;);">N2</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4599&quot;, &quot;V&quot;);"><div
									title="업무연락">업무연락</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4599&quot;, &quot;V&quot;);">업무
								연락(사내 부서간 통신문)</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4599&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4599&quot;, &quot;V&quot;);"><div
									title="공통">공통</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4599&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4605"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4605&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4605&quot;, &quot;V&quot;);">N7</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4605&quot;, &quot;V&quot;);"><div
									title="재직증명서">재직증명서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4605&quot;, &quot;V&quot;);">재직
								증명서</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4605&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4605&quot;, &quot;V&quot;);"><div
									title="시험 사용">시험 사용</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4605&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4601"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4601&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4601&quot;, &quot;V&quot;);">N4</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4601&quot;, &quot;V&quot;);"><div
									title="품의서">품의서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4601&quot;, &quot;V&quot;);">품의서</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4601&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4601&quot;, &quot;V&quot;);"><div
									title="시험 사용">시험 사용</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4601&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4600"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4600&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4600&quot;, &quot;V&quot;);">N3</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4600&quot;, &quot;V&quot;);"><div
									title="품의서">품의서</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4600&quot;, &quot;V&quot;);">품의서</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4600&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4600&quot;, &quot;V&quot;);"><div
									title="공통">공통</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4600&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4598"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4598&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4598&quot;, &quot;V&quot;);">N1</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4598&quot;, &quot;V&quot;);"><div
									title="회람">회람</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4598&quot;, &quot;V&quot;);">회람</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4598&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4598&quot;, &quot;V&quot;);"><div
									title="공통">공통</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4598&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
						<tr>
							<td><label><input title="양식 선택" type="checkbox"
									class="js-checkbox-approval-form" form_no="4606"></label></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4606&quot;, &quot;V&quot;);">오피스</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4606&quot;, &quot;V&quot;);">N8</td>
							<td class="sidespace"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4606&quot;, &quot;V&quot;);"><div
									title="회의록">회의록</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4606&quot;, &quot;V&quot;);">일반적인
								회의록</td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4606&quot;, &quot;V&quot;);">사용</td>
							<td class="docu-num"
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4606&quot;, &quot;V&quot;);"><div
									title="시험 사용">시험 사용</div></td>
							<td
								data-href="javascript:ApprovalSetting.getFormInfo(&quot;4606&quot;, &quot;V&quot;);">전자결재</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="listbottom bt0" id="pageApprovalForm"
					style="width: 1225px;">
					<p class="number">
						양식 수 : <span>19</span>
					</p>
					<div class="paginate">
						<strong>1</strong>
					</div>
					<div class="page_select">
						<label class="blind" for="pageCurrent">SELECT CURRENT PAGE</label>
						<select onchange="ApprovalSetting.getFormsByPage($j(this).val());"><option
								value="1" selected="">1</option></select> / 1
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		var approvalFormTable = new approvalTableClass({
			table : "tableApprovalForm",
			row : [ [ "checkbox", "" ], [ "form_type_division", "" ],
					[ "form_id", "" ], [ "title", "sidespace" ],
					[ "comment", "" ], [ "use_flag", "" ],
					[ "category_name", "docu-num" ], [ "solution", "" ] ]
		});
		Approval._writeType = 'rule';
		Approval._defaultFontFamily = '맑은 고딕';
		Approval._defaultFontSize = '16px';
		Approval._defaultLineHeight = '1.6';
		Approval._defaultEditor = 'synap';

		$j(document).ready(function() {
			$j('#tableApprovalForm th').resizableTableColumns({
				handles : 'e',
				whiteSpace : 'nowrap',
				store : true,
				alsoResizeWithTable : '#pageApprovalForm, #topFncApprovalForm'
			});
		});

		$j(function() {
			var History = window.History;
			var pageUrl = window.location.search.substring(0);

			if (History.enabled) {
				ApprovalSetting.getForms();
			} else {
				return false;
			}

			History.Adapter.bind(window, 'statechange', function() {
				ApprovalSetting.getForms();
			});
		});

		$j(document).on("click", "*[data-href]", function(e) {
			e.stopPropagation();
			window.document.location = $j(this).data('href');
			return false;
		});

		$j(document).on("blur", '.js-approval-forms-first-type', function() {
			if ($j(".js-approval-forms-first-type-layer").hasClass("show")) {
				$j(".js-approval-forms-first-type-layer").toggleClass("show");
			}
		});

		$j(document).on(
				"mousedown",
				'.js-approval-li-form-category',
				function(event) {
					event.preventDefault();
					console.log('click');
					$j('.js-approval-li-form-category').removeClass("active");
					$j(this).addClass("active");
					$j('#anchorApprovalFormCategory').html(
							"보기: " + $j(this).text());
					$j(".js-approval-forms-first-type-layer").toggleClass(
							"show");
					Approval.pushState({
						"category" : $j(this).attr("value"),
						"page" : "1"
					});

				});

		$j(document).on("click", '.js-approval-btn-form-category', function() {
			if ($j(this).parent().children("ul").hasClass("dropdown-menu")) {
				$j(this).parent().children("ul").toggleClass("show");
			}
		});

		$j(document).on("change", '.js-checkbox-approval-form', function() {
			var checked = false;
			var checked_count = 0;
			$j('.js-checkbox-approval-form').each(function(index, value) {
				if ($j(value).prop("checked")) {
					checked = true;
					checked_count++;
					return;
				}
			});
			if (checked) {
				$j(".js-approval-forms-first-type").hide();
				$j(".js-approval-forms-second-type").show();
				$j("#countApprovalCheckBox").html(checked_count);
			} else {
				$j(".js-approval-forms-first-type").show();
				$j(".js-approval-forms-second-type").hide();
			}
		});

		$j(document)
				.on(
						"change",
						'.js-approval-all-checkbox',
						function() {
							$j('.js-checkbox-approval-form:not(:disabled)')
									.prop(
											"checked",
											$j(this).prop("checked") ? true
													: false);
							$j("#countApprovalCheckBox")
									.html(
											$j('.js-checkbox-approval-form:not(:disabled)').length);
							if ($j(this).prop("checked")) {
								$j(".js-approval-forms-first-type").hide();
								$j(".js-approval-forms-second-type").show();
							} else {
								$j(".js-approval-forms-first-type").show();
								$j(".js-approval-forms-second-type").hide();
							}
						});

		$j(document).on("click", '.js-approval-order', function() {
			var up_template = '<span class="up"></span>';
			var down_template = '<span class="down"></span>';
			var append_template = up_template;
			var order_value = "ASC";

			if ($j(this).children("span").hasClass("up")) {
				append_template = down_template;
				order_value = "DESC";
			}

			$j('.js-approval-order span').remove();

			$j(this).append(append_template);

			Approval.pushState({
				"order_key" : $j(this).attr("value"),
				"order_value" : order_value
			});
		});

		$j(document).on('keyup', '#textSearchForms', function(e) {
			if (e.keyCode === 13) {
				ApprovalSetting.searchForms();
			}
		});
	</script>
</div>
