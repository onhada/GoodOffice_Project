<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3 style="font-size: 22px;">직위/직무 관리</h3>
	</div>

	<div class="content_inbox insa-new">
		<div class="cont_box approve">
			<div class="setting_field">
				<div class="cont_hidden">
					<h4 class="fl">직위 관리</h4>
					<a href="javascript:void(0)" class="icon question tipsIcon mgr_20"
						style="position: relative; top: -2px; margin-left: 5px;"><span
						class="blind">세부 설명</span></a>
					<div class="tooltip hide"
						style="left: 50px; top: 0px; font-weight: normal;">
						<div class="tooltip-box" style="width: 380px;">
							직위 등급은 [+등급 추가] 버튼으로 총 30개까지 생성할 수 있으며, <br> 등급 리스트 오른쪽[+]
							버튼을 클릭하여 등급별 직위를 개수 제한 없이 등록할 수 있습니다. <br>
							<br> 설정한 직위 등급은 전자결재 &gt; 기본 설정 &gt; 보안 등급별 열람 설정에<br>적용됩니다.

						</div>
					</div>
					<a href="javascript:void(0);" class="weakblue" id="addGrade"><span
						class="sms_plus"></span> 등급 추가</a>
				</div>
				<table class="tableType02 insa-position gon" id="posTable">
					<caption>직위 관리 표</caption>
					<colgroup>
						<col width="90">
						<col>
						<col width="80">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span class="position-levels">1</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112022">대표이사</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">2</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112023">사장</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">3</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112024">상무</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">4</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112025">이사</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">5</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112026">부장</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">6</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112027">차장</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">7</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112028">과장</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">8</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112029">대리</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">9</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112030">주임</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">10</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112031">사원</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="position-levels">11</span>등급 <span
								class="sms_plus" onclick="position.addLevels(this, event);"></span></th>
							<td class="sortPosition ui-sortable"><span
								class="position ui-sortable-handle" no="112032">계약직</span></td>
							<td class="last_space"><span class="insa-plus2" title="추가">+</span>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="bt_left">
					<button type="button" id="savePosition">저장</button>
				</div>

				<div class="cont_hidden">
					<h4 class="fl mgr_20">직무 관리</h4>
					<a href="javascript:void(0);" class="weakblue" id="addJob"><span
						class="sms_plus"></span> 직무 추가</a>
				</div>
				<table class="tableType01 insa-position gon2"
					style="border-bottom: 0;" id="jobTable">
					<caption>직위 관리 표</caption>
					<tbody width="100%">
						<tr width="100%">
							<td><span class="position" no="112033">기획</span> <span
								class="position" no="112034">전산</span> <span class="position"
								no="112035">영업</span> <span class="position" no="112036">생산</span>
								<span class="position" no="112037">개발</span> <span
								class="position" no="112038">디자인</span> <span class="position"
								no="112039">인사</span> <span class="position" no="112040">재무회계</span>
								<span class="position" no="112041">마케팅</span> <span
								class="position" no="112042">구매</span> <span class="position"
								no="112043">관리</span></td>
						</tr>
					</tbody>
				</table>
				<div class="bt_left">
					<button type="button" id="saveJob">저장</button>
				</div>
			</div>
		</div>
	</div>
	<div class="layer_box middle hide" id="insa_position_del"></div>
	<div class="layer_box middle hide" id="insa_pos_del_nosave_layer">
		<input type="hidden" id="nosave_gubun_type" value="">
		<div class="title_layer text_variables">
			<span class="nosave_gubun"></span> 삭제
		</div>
		<p class="pdt_20">
			<strong id="nosave_pos_name"></strong> <span class="nosave_gubun"></span>를
			삭제하시겠습니까?<span id="nosave_del_msg" class="hide"><br>이 직위를
				삭제하면 등급 내 직위가 없어지므로,<br>아래 등급이 한 등급씩 위로 이동합니다.<br>삭제 후 저장
				버튼을 클릭하면 변경 내용이 적용됩니다.</span>
		</p>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="position.nosaveRemove()">확인</button>
			<button type="button"
				onclick="jQuery('#insa_pos_del_nosave_layer').hidePopup(this)">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#insa_pos_del_nosave_layer').hidePopup(this);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
</div>

