<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contents">
	<div class="content_title">
		<form>
			<fieldset>
				<span class="detail_select"> <a
					href="javascript:dbUnitCreate.saveData('modify');">저장</a>
				</span>
			</fieldset>
		</form>
	</div>
	<div class="content_inbox">
		<div class="cont_box">
			<div class="approval-wrap approval-unit" style="width: 970px;">
				<table class="tableType02 gt-mb-25">
					<caption>유닛설명</caption>
					<colgroup>
						<col style="width: 119px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">유닛명</th>
							<td><input type="text" class="hw-input-form" placeholder=""
								id="db_unit_title" value="공기업 공문" maxlength="10"
								style="width: 500px;"></td>
						</tr>
						<tr>
							<th scope="row">설명</th>
							<td><input type="text" class="hw-input-form" placeholder=""
								id="db_unit_comment" value="공기업용 공문을 생성할때 사용" maxlength="100"
								style="width: 500px;"></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="db_unit_no" value="1199">
				<div class="unit-box">
					<div class="unit-box-menu">
						<div class="menu-title">제공 입력 항목</div>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertInsaInfo();">
							<i class="spr-approval-unit spr-approval-unit-human gt-mr-10"></i>인사정보
						</button>
						<div class="menu-title">입력 항목</div>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertText();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-text"></i></span><span
								class="gt-d-inline-block align-middle">텍스트</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertNumber();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-number"></i></span><span
								class="gt-d-inline-block align-middle">숫자</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertDate();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-calendar"></i></span><span
								class="gt-d-inline-block align-middle">날짜</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertTime();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-clock"></i></span><span
								class="gt-d-inline-block align-middle">시간</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertRadio();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-radio"></i></span><span
								class="gt-d-inline-block align-middle">라디오 버튼</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertSelect();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-dropdown"></i></span><span
								class="gt-d-inline-block align-middle">드롭 다운</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertTextarea();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-longtext"></i></span><span
								class="gt-d-inline-block align-middle">긴 텍스트</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertEditor();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-editor"></i></span><span
								class="gt-d-inline-block align-middle">에디터</span>
						</button>
					</div>

					<div id="formDiv" class="unit-box-contents ui-sortable">
						<div class="df-wrap unit-row approval-sortable-row"
							id="k06929kj9oxq" df-type="text">
							<div class="unit-btn-handle ui-sortable-handle">
								<i class="far fa-grip-lines"></i>
							</div>
							<div class="df-field-label unit-cell-head">
								<label class="gt-align-middle">수신 </label>
							</div>
							<div class="df-field unit-cell-body gt-d-table gt-h-auto">
								<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
									type="text" class="hw-input-form type-text-width" value=""
									style="width: 80% !important;">
								</span> <span class="gt-d-table-cell unit-btn-cell "><button
										type="button"
										class="gt-p-5 hover-blue-text unit-btn-delete df-action df-delete">
										<i class="fal fa-times-circle"></i>
									</button></span>
							</div>
						</div>
						<div class="df-wrap unit-row approval-sortable-row"
							id="k06929kkmowm" df-type="text">
							<div class="unit-btn-handle ui-sortable-handle">
								<i class="far fa-grip-lines"></i>
							</div>
							<div class="df-field-label unit-cell-head">
								<label class="gt-align-middle">(경유) </label>
							</div>
							<div class="df-field unit-cell-body gt-d-table gt-h-auto">
								<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
									type="text" class="hw-input-form type-text-width" value=""
									style="width: 80% !important;">
								</span> <span class="gt-d-table-cell unit-btn-cell "><button
										type="button"
										class="gt-p-5 hover-blue-text unit-btn-delete df-action df-delete">
										<i class="fal fa-times-circle"></i>
									</button></span>
							</div>
						</div>
						<div class="df-wrap unit-row approval-sortable-row"
							id="k06929kl1jro" df-type="editor">
							<div class="unit-btn-handle ui-sortable-handle">
								<i class="far fa-grip-lines"></i>
							</div>
							<div class="df-field-label unit-cell-head editor gt-d-block">
								<label class="gt-align-middle"> </label>
							</div>
							<div class="df-field editor-content gt-mt-10">
								<span class="gt-d-table-cell gt-w-100">
									<div class="df-editor-area" id="editor_k06929kl1jro_holder">
										<img style="width: 100%;"
											src="https://static.hiworks.com/office/static/ui/images/editor_screenshot.png"
											alt="editor">
									</div> <textarea style="display: none"
										id="editor_k06929kl1jro_contents"></textarea>
								</span> <span class="gt-d-table-cell unit-btn-cell gt-align-middle"><button
										type="button"
										class="gt-p-5 hover-blue-text unit-btn-delete df-action df-delete">
										<i class="fal fa-times-circle"></i>
									</button></span>
							</div>
						</div>
						<div class="df-wrap unit-row approval-sortable-row"
							id="k0696qezq91t" df-type="text">
							<div class="unit-btn-handle ui-sortable-handle">
								<i class="far fa-grip-lines"></i>
							</div>
							<div class="df-field-label unit-cell-head">
								<label class="gt-align-middle">수신자 </label>
							</div>
							<div class="df-field unit-cell-body gt-d-table gt-h-auto">
								<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
									type="text" class="hw-input-form type-text-width" value=""
									style="width: 80% !important;">
								</span> <span class="gt-d-table-cell unit-btn-cell "><button
										type="button"
										class="gt-p-5 hover-blue-text unit-btn-delete df-action df-delete">
										<i class="fal fa-times-circle"></i>
									</button></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="propDiv" class="layer_box large address hide"></div>
			<p id="output"></p>
			<p id="saveOutput"></p>
		</div>
	</div>

	<script id="componentsTmpl" type="text/x-jquery-tmpl">
<div class="df-wrap unit-row approval-sortable-row" id="${cid}" df-type="${type}">
	<div class="unit-btn-handle"><i class="far fa-grip-lines"></i></div>
	{{tmpl "#labelTmpl"}}

	{{if type === "editor"}}
	<div class="df-field editor-content gt-mt-10">
		<span class="gt-d-table-cell gt-w-100">
	{{else}}
	<div class="df-field unit-cell-body gt-d-table gt-h-auto">
		<span class="gt-d-table-cell gt-pr-10 gt-w-100">
	{{/if}}
		
	{{if type == 'text'}}
			<input type="text" class="hw-input-form type-text-width" value="${defaultval}" style="width:${width}${width_type === 'pc' ? '%' : 'px'} !important;"/>
	{{else type == 'number'}}
		<input type="text" class="hw-input-form type-number-width" maxlength="20" value="${defaultval}" style="width:${width}${width_type === 'pc' ? '%' : 'px'} !important;"/>
	{{else type == 'date'}}
		<span class="gt-position-relative gt-d-inline-block">
			<input type="text" class="hw-input-form type-date-width" value="${defaultval}" readonly="">
					<i class="input-suffix-btn gt-p-5"><i class="fal fa-calendar-alt"></i></i>
				</span>
	{{else type == 'time'}}
		{{if format === 'kr_ap kr_hh kr_mm'}}
			<select id="timeap" class="hw-input-form type-time-width">
				<option ${ap === '오전' ? 'selected' : ''}>오전</option>
				<option ${ap === '오후' ? 'selected' : ''}>오후</option>
			</select>&nbsp;
			<input type="text" id="timehh" value="${parseInt(hh)}" maxlength="2" class="hw-input-form type-time-width"/><span class="gt-ml-5 gt-mr-10">시</span>
			<input type="text" id="timemm" value="${parseInt(mm)}" maxlength="2" class="hw-input-form type-time-width"/><span class="gt-ml-5 gt-mr-10">분</span>
		{{else format === 'kr_hh kr_mm'}}
			<input type="text" id="timehh" value="${parseInt(hh)}" maxlength="2" class="hw-input-form type-time-width"/><span class="gt-ml-5 gt-mr-10">시</span>
			<input type="text" id="timemm" value="${parseInt(mm)}" maxlength="2" class="hw-input-form type-time-width"/><span class="gt-ml-5 gt-mr-10">분</span>
		{{else format === 'hh:mm ap'}}
			<input type="text" id="timehh" value="${hh}" maxlength="2" class="hw-input-form type-time-width"/> :
			<input type="text" id="timemm" value="${mm}" maxlength="2" class="hw-input-form type-time-width"/>&nbsp;
			<select id="timeap" class="hw-input-form type-time-width">
				<option ${ap === 'AM' ? 'selected' : ''}>AM</option>
				<option ${ap === 'PM' ? 'selected' : ''}>PM</option>
			</select>
		{{else format === 'hh:mm:ss'}}
			<input type="text" id="timehh" value="${hh}" maxlength="2" class="hw-input-form type-time-width"/> :
			<input type="text" id="timemm" value="${mm}" maxlength="2" class="hw-input-form type-time-width"/> :
			<input type="text" id="timess" value="${ss}" maxlength="2" class="hw-input-form type-time-width"/>
		{{/if}}
	{{else type == 'radio'}}
			{{each(j, radio) radio_group}}
			<div class="${direction === 'h' ? 'gt-d-inline-block' : ''}">
				<label class="gt-mr-10">
					<input type="radio" name="radio${cid}" value="${radio.value}" ${radio.value == defaultval ? "checked" : ""} disabled="disabled" /> ${radio.label}
				</label>
			</div>
			{{/each}}
	{{else type == 'select'}}
		<select class="hw-input-form gt-w-auto">
			{{each(j, opt) options_group}}
			<option value="${opt.value}" ${opt.value == defaultval ? "selected" : ""}>${opt.label}</option>
			{{/each}}
		</select>
	{{else type == 'textarea'}}
		<textarea class="hw-input-form type-text-width gt-h-auto" style="width:${width}${width_type === 'pc' ? '%' : 'px'} !important;" rows="5">${defaultval}</textarea>
	{{else type == 'editor'}}
		<div class="df-editor-area" id="editor_${cid}_holder">
			<img style="width:100%;" src="https://static.hiworks.com/office/static/ui/images/editor_screenshot.png" alt="editor">
		</div>
		<textarea style="display:none" id="editor_${cid}_contents"></textarea>
	{{/if}}
		</span>

			<span class="gt-d-table-cell unit-btn-cell ${type === 'editor' ? 'gt-align-middle' : ''}"><button type="button" class="gt-p-5 hover-blue-text unit-btn-delete df-action df-delete"><i class="fal fa-times-circle"></i></button></span>
		</div>
</div>
</script>
	<script id="insaComponentsTmpl" type="text/x-jquery-tmpl">
<div class="df-wrap unit-row approval-sortable-row ${typeof groupid != 'undefined' ? groupid : ''}" id="${cid}" df-type="${type}" df-fieldtype="${field_type}">
	<div class="unit-btn-handle"><i class="far fa-grip-lines"></i></div>

	<div class="df-field-label unit-cell-head">
		<label>${label}</label>
	</div>
	<div class="df-field unit-cell-body gt-d-table">
		<span class="gt-d-table-cell gt-pr-10 gt-w-100">
	{{if field_type == "username"}}
		{{if search_name == 'Y'}}
			<input type="text" style="height:34px;" class="txt-input bg js-db-unit-autocomplete ui-autocomplete-input" id="username_${cid}" value="${defaultval}" placeholder="클릭 후 입력" autocomplete="off">
			<button id="insaSearchBtn_${cid}" class="gt-p-5 gt-ml-10 hover-blue-text df-action df-insa-search-layer"><i class="fal fa-search"></i></button>
			<span id="textUsername_${cid}"></span>
			<button id="modifyUsernameBtn_${cid}" class="weakblue mgl_20 df-action df-modify hide">변경</button>
		{{else}}
					작성자 ${label}
				{{/if}}
	{{else}}
					{{if search_name == 'Y'}}{{else}}작성자 {{/if}}${label}
			{{/if}}
		</span>
			<span class="gt-d-table-cell unit-btn-cell"><button type="button" class="gt-p-5 hover-blue-text unit-btn-delete df-action df-insadelete"><i class="fal fa-times-circle"></i></button></span>
		</div>
</div>
</script>

	<script id="labelTmpl" type="text/x-jquery-tmpl">
{{if type === "editor"}}
<div class="df-field-label unit-cell-head editor gt-d-block">
{{else}}
<div class="df-field-label unit-cell-head">
{{/if}}
	<label class="gt-align-middle">{{if typeof hide_label != "undefined" && hide_label == 'N'}}${label}{{/if}}
	{{if typeof show_tooltip != "undefined" && show_tooltip == 'Y'}}
		<a href="javascript:void(0)" class="icon question tipsIcon gt-align-middle gt-float-none" style="margin:-3px 0 0;"></a>
		<div class="tooltip hide">
			<div class="tooltip-box">
				<p class="df-field-tooltip">${tooltip}</p>
			</div>
		</div>
	{{/if}}
	</label>
</div>
</script>
	<script id="textProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField hide prop-area" id="textPropertiesArea">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">입력 가능 글자 수</span></div>
			<div class="can-be-input">
				<input type="text" class="input-text" placeholder="1" value="${minlength}" id="prop-minlength" maxlength="3">
				<span class="contour">~</span>
				<input type="text" class="input-text" placeholder="10" value="${maxlength}" id="prop-maxlength" maxlength="3">
			</div>
		</div>
		<div class="right_area">
			<div class="title-height"><span class="gt-font-bold">입력 값 유효성 체크</span></div>
			<div>
				<select id="prop-validcheck" class="input-text">
					<option value="all" ${valid === 'all' ? 'selected' : ''}>모든 값 허용</option>
					<option value="num|alpha" ${valid === 'num|alpha' ? 'selected' : ''}>숫자 + 영문만 허용</option>
					<option value="email" ${valid === 'email' ? 'selected' : ''}>이메일만 허용</option>
				</select>
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">기본 값</span></div>
			<div>
				<input type="text" class="input-text" placeholder="" value="${defaultval}" id="prop-defaultval" minlength="0" maxlength="10">
			</div>
		</div>
		<div class="right_area">
			<div class="title-height"><span class="gt-font-bold">입력 박스 너비</span></div>
			<div>
				<input type="text" class="input-text input-box-width" placeholder="100" value="${width}" id="prop-width" maxlength="3">
				<label class="mgl_20"><input type="radio" name="prop-widthtype" value="px" ${typeof width_type != "undefined" && width_type === "px" ? "checked" : ""}> PX</label>
				<label class="mgl_20"><input type="radio" name="prop-widthtype" value="pc" ${typeof width_type != "undefined" && width_type === "pc" ? "checked" : ""}> %</label>
				<span class="alert-message"></span>
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">ID</span></div>
			<div><input type="text" class="input-text" placeholder="" value="${eleId}" id="prop-eleid"></div>
		</div>
		<div class="right_area">
			<div class="must-checkbox"><label class=""><input type="checkbox" class="gt-align-middle" id="prop-require" ${require == 'Y' ? "checked" : ""}> 필수 입력</label></div>
		</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#textPropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#textPropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>

	<script id="numberProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField hide prop-area" id="numberPropertiesArea">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">입력 가능 범위</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-comma" ${comma === 'Y' ? "checked" : ""} > 천 단위 표시</label>
			</div>
			<div class="can-be-input">
				<input type="text" class="input-text" placeholder="" value="${minnum}" id="prop-minnum">
				<span class="contour">~</span>
				<input type="text" class="input-text" placeholder="" value="${maxnum}" id="prop-maxnum">
			</div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">소수점 자리 수</span>
			</div>
			<div>
				<input type="text" class="input-text" id="prop-numpoint" value="${numpoint}" maxlength="1" />
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">기본 값</span></div>
			<div>
				<input type="text" class="input-text" value="${defaultval}" id="prop-defaultval" maxlength="20"/>
			</div>
		</div>
		<div class="right_area">
			<div class="title-height"><span class="gt-font-bold">입력 박스 너비</span></div>
			<div>
				<input type="text" class="input-text input-box-width" placeholder="100" value="${width}" id="prop-width" maxlength="3">
				<label class="mgl_20"><input type="radio" name="prop-widthtype" value="px" ${typeof width_type != "undefined" && width_type === "px" ? "checked" : ""}> PX</label>
				<label class="mgl_20"><input type="radio" name="prop-widthtype" value="pc" ${typeof width_type != "undefined" && width_type === "pc" ? "checked" : ""}> %</label>
				<span class="alert-message"></span>
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">ID</span></div>
			<div><input type="text" class="input-text" placeholder="" value="${eleId}" id="prop-eleid"></div>
		</div>
		<div class="right_area">
			<div class="must-checkbox">
				<label class=""><input type="checkbox" class="gt-align-middle" id="prop-require" ${require == 'Y' ? "checked" : ""}> 필수 입력</label>
			</div>
		</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#numberPropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#numberPropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>


	<script id="dateProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField hide prop-area" id="datePropertiesArea">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">표시 형식</span></div>
			<div>
				<select id="prop-dateformat" class="input-text">
					<option value="yy. m. d" ${format === "yy. m. d" ? "selected" : ""}>YYYY. MM. DD</option>
					<option value="yy년 m월 d일" ${format === "yy년 m월 d일" ? "selected" : ""}>YYYY년 MM월 DD일</option>
					<option value="yy-mm-dd" ${format === "yy-mm-dd" ? "selected" : ""}>YYYY-MM-DD</option>
					<option value="yy/mm/dd" ${format === "yy/mm/dd" ? "selected" : ""}>YYYY/MM/DD</option>
					<option value="m월 d일" ${format === "m월 d일" ? "selected" : ""}>MM월 DD일</option>
					<option value="mm/dd" ${format === "mm/dd" ? "selected" : ""}>MM/DD</option>
				</select>
			</div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">기본 값</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-nowdate" ${typeof now_date != "undefined" && now_date === "Y" ? 'checked' : ''}> 생성일</label>
			</div>
			<div>
				<input type="text" class="input-text" value="${defaultval}" id="prop-defaultval" readonly="readonly"/>
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">ID</span></div>
			<div><input type="text" class="input-text" placeholder="" value="${eleId}" id="prop-eleid"></div>
		</div>
		<div class="right_area">
			<div class="must-checkbox">
				<label class=""><input type="checkbox" class="gt-align-middle" id="prop-require" ${require == 'Y' ? "checked" : ""}> 필수 입력</label>
			</div>
		</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#datePropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#datePropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>

	<script id="timeProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField md_time hide prop-area" id="timePropertiesArea">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">표시 형식</span></div>
			<div>
				<select id="prop-timeformat" class="input-text">
					<option value="kr_ap kr_hh kr_mm" ${format === "kr_ap kr_hh kr_mm" ? "selected" : ""}>오전/오후 HH시 MM분</option>
					<option value="kr_hh kr_mm" ${format === "kr_hh kr_mm" ? "selected" : ""}>HH시 MM분</option>
					<option value="hh:mm ap" ${format === "hh:mm ap" ? "selected" : ""}>HH:MM AM/PM</option>
					<option value="hh:mm:ss" ${format === "hh:mm:ss" ? "selected" : ""}>HH:MM:SS</option>
				</select>
			</div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">기본 값</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-nowtime" ${typeof now_time != "undefined" && now_time == "Y" ? 'checked' : ''}> 생성 시간</label>
			</div>
			<div>
				{{tmpl "#timePropertiesUITmpl"}}
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">ID</span></div>
			<div><input type="text" class="input-text" placeholder="" value="${eleId}" id="prop-eleid"></div>
		</div>
		<div class="right_area">
			<div class="must-checkbox">
				<label class=""><input type="checkbox" class="gt-align-middle" id="prop-require" ${require == 'Y' ? "checked" : ""}> 필수 입력</label>
			</div>
		</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#timePropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#timePropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>
	<script id="timePropertiesUITmpl" type="x-jquery-tmpl">
<div id="timePropertiesUITmplArea">
	{{if tmp_format === 'kr_ap kr_hh kr_mm'}}
	<select id="prop-timeformat-ap" class="hw-input-form type-time-width" style="width:60px;">
		<option ${ap === '오전' ? 'selected' : ''}>오전</option>
		<option ${ap === '오후' ? 'selected' : ''}>오후</option>
	</select>&nbsp;
	<input type="text" id="prop-timeformat-hh" class="hw-input-form type-time-width" value="${parseInt(hh)}" maxlength="2" placeholder="HH" style="width:40px;"/>시&nbsp;
	<input type="text" id="prop-timeformat-mm" class="hw-input-form type-time-width" value="${parseInt(mm)}" maxlength="2" placeholder="MM" style="width:40px;"/>분&nbsp;
	{{else tmp_format === 'kr_hh kr_mm'}}
	<input type="text" id="prop-timeformat-hh" class="hw-input-form type-time-width" value="${parseInt(hh)}" maxlength="2" placeholder="HH" style="width:40px;"/>시&nbsp;
	<input type="text" id="prop-timeformat-mm" class="hw-input-form type-time-width" value="${parseInt(mm)}" maxlength="2" placeholder="MM" style="width:40px;"/>분&nbsp;
	{{else tmp_format === 'hh:mm ap'}}
	<input type="text" id="prop-timeformat-hh" class="hw-input-form type-time-width" value="${hh}" maxlength="2" placeholder="HH" style="width:40px;"/> :
	<input type="text" id="prop-timeformat-mm" class="hw-input-form type-time-width" value="${mm}" maxlength="2" placeholder="MM" style="width:40px;"/>&nbsp;
	<select id="prop-timeformat-ap" class="hw-input-form type-time-width" style="width:60px;">
		<option ${ap === 'AM' ? 'selected' : ''}>AM</option>
		<option ${ap === 'PM' ? 'selected' : ''}>PM</option>
	</select>
	{{else tmp_format === 'hh:mm:ss'}}
	<input type="text" id="prop-timeformat-hh" class="hw-input-form type-time-width" value="${hh}" maxlength="2" placeholder="HH" style="width:40px;"/> :
	<input type="text" id="prop-timeformat-mm" class="hw-input-form type-time-width" value="${mm}" maxlength="2" placeholder="MM" style="width:40px;"/> :
	<input type="text" id="prop-timeformat-ss" class="hw-input-form type-time-width" value="${ss}" maxlength="2" placeholder="SS" style="width:40px;"/>
	{{/if}}
</div>
</script>

	<script id="radioProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField md_dropdown hide prop-area" id="radioPropertiesArea" style="width:490px;">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div style="max-height:430px; overflow-y:auto">
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix detail-options">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-align-middle gt-font-bold">세부 항목</span>
				<span><button type="button" class="btn_variables df-prop-radio-add"><i class="far fa-plus"></i> 추가</button></span>
			</div>
			<div id="prop-radiogroup" class="approval-unit">
				{{tmpl "#radioValueTmpl"}}
			</div>
		</div>
		<div class="right_area">
			<div class="title-height"><span class="gt-align-middle gt-font-bold">표시 형식</span></div>
			<div class="gt-mt-10">
				<label><input type="radio" name="prop-radio-direction" value="h" ${typeof direction != "undefined" && direction === "h" ? "checked" : ""}/> 가로</label>
				<label class="gt-ml-20"><input type="radio" name="prop-radio-direction" value="v" ${typeof direction != "undefined" && direction === "v" ? "checked" : ""}/> 세로</label>
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">ID</span></div>
			<div><input type="text" class="input-text" placeholder="" value="${eleId}" id="prop-eleid"></div>
		</div>
		<div class="right_area">
			<div class="must-checkbox">
				<label class=""><input type="checkbox" class="gt-align-middle" id="prop-require" ${require == 'Y' ? "checked" : ""}> 필수 입력</label>
			</div>
		</div>
	</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#radioPropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#radioPropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	
</div>
</script>
	<script id="radioValueTmpl" type="text/x-jqueyr-tmpl">
{{each(i,item) tmp_radio_group}}
<div class="gt-pl-40 approval-sortable-row unit-row df-prop-radio-value">
	<div class="unit-btn-handle ui-sortable-handle" style="top:12px"><i class="far fa-grip-lines"></i></div>
	<label class="df-prop-radio-label gt-d-table-cell gt-pr-10">
		<input type="radio" name="prop-radio-defaultval" value="${item.value}" ${item.value == tmp_defaultval ? "checked" : ""}>
		<span class="df-prop-radio-label">${item.label}</span>
		<input type="text" class="input-text df-prop-radio-label" style="display:none;" placeholder="옵션1" value="${item.label}">
	</label>
	<span class="gt-d-table-cell unit-btn-cell"><button type="button" class="gt-p-5 hover-blue-text unit-btn-delete df-prop-radio-delete"><i class="fal fa-times-circle"></i></button></span>
</div>
{{/each}}
</script>

	<script id="selectProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField md_dropdown hide prop-area" id="selectPropertiesArea" style="width:490px;">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div style="max-height:430px; overflow-y:auto">
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix detail-options">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-align-middle gt-font-bold">세부 항목</span>
				<span><button type="button" class="btn_variables df-prop-select-add"><i class="far fa-plus"></i> 추가</button></span>
			</div>
			<div id="prop-optionsgroup" class="approval-unit">
				{{tmpl "#selectOptionsTmpl"}}
			</div>
		</div>
		<div class="right_area">
			<div class="title-height"><span class="gt-font-bold">ID</span></div>
			<div><input type="text" class="input-text" placeholder="" value="${eleId}" id="prop-eleid"></div>
		</div>
	</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#selectPropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#selectPropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>

	<script id="selectOptionsTmpl" type="text/x-jquery-tmpl">
{{each(i, item) tmp_options_group}}
	<div class="df-prop-options-value gt-pl-40 approval-sortable-row unit-row">
		<div class="unit-btn-handle" style="top:12px"><i class="far fa-grip-lines"></i></div>
		<label class="df-prop-options-label gt-d-table-cell gt-pr-10">
			<input type="radio" name="prop-options-value" value="${item.value}" ${item.value == tmp_defaultval ? "checked" : ""}>
			<span class="df-prop-options-label">${item.label}</span>
			<input type="text" name="prop-options-label" class="input-text df-prop-options-label hide" placeholder="옵션1" value="${item.label}">
		</label>
		<span class="gt-d-table-cell unit-btn-cell"><button type="button" class="df-prop-select-delete gt-p-5 hover-blue-text unit-btn-delete"><i class="fal fa-times-circle"></i></button></span>
	</div>
{{/each}}
</script>

	<script id="textareaProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField hide prop-area" id="textareaPropertiesArea">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">기본 값</span></div>
			<div>
				<textarea class="input-text" id="prop-defaultval">${defaultval}</textarea>
			</div>
		</div>
		<div class="right_area">
			<div class="title-height"><span class="gt-font-bold">입력 박스 너비</span></div>
			<div>
				<input type="text" class="input-text input-box-width" placeholder="100" value="${width}" id="prop-width" maxlength="3">
				<label class="mgl_20"><input type="radio" name="prop-widthtype" value="px" ${typeof width_type != "undefined" && width_type === "px" ? "checked" : ""}> PX</label>
				<label class="mgl_20"><input type="radio" name="prop-widthtype" value="pc" ${typeof width_type != "undefined" && width_type === "pc" ? "checked" : ""}> %</label>
				<span class="alert-message"></span>
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div class="left_area">
			<div class="title-height"><span class="gt-font-bold">ID</span></div>
			<div><input type="text" class="input-text" placeholder="" value="${eleId}" id="prop-eleid"></div>
		</div>
		<div class="right_area">
			<div class="must-checkbox">
				<label class=""><input type="checkbox" class="gt-align-middle" id="prop-require" ${require == 'Y' ? "checked" : ""}> 필수 입력</label>
			</div>
		</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#textareaPropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#textareaPropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>

	<script id="editorProperties" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField hide prop-area" id="editorPropertiesArea" style="width:930px; height:730px;">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold">이름</span>
				<label class="mgl_20"><input type="checkbox" id="prop-hidelabel" class="gt-align-middle" ${typeof hide_label != "undefined" && hide_label == 'Y' ? 'checked' : ''}> 숨기기</label>
			</div>
			<div><input type="text" class="input-text" placeholder="텍스트" value="${label}" id="prop-label" maxlength="10"/></div>
		</div>
		<div class="right_area">
			<div class="title-height">
				<span class="gt-font-bold">설명</span>
				<label class="mgl_20"><input type="checkbox" class="gt-align-middle" id="prop-showtooltip" ${typeof show_tooltip != "undefined" && show_tooltip === 'Y' ? 'checked' : ''}> 툴팁 노출</label>
			</div>
			<div><input type="text" class="input-text" placeholder="" value="${tooltip}" id="prop-tooltip" maxlength="100"></div>
		</div>
	</div>
	<div class="gt-clearfix first-input">
		<div class="left_area">
			<div class="title-height">
				<span class="gt-font-bold gt-mr-50">기본 쓰기 설정</span>
				<select id="prop-default-fontfamily" class="input-text gt-w-auto">
					<option value="맑은 고딕" {{if font_family === '맑은 고딕'}}selected{{/if}}>맑은 고딕</option>
					<option value="돋움" {{if font_family === '돋움'}}selected{{/if}}>돋움</option>
					<option value="돋움체" {{if font_family === '돋움체'}}selected{{/if}}>돋움체</option>
					<option value="굴림" {{if font_family === '굴림'}}selected{{/if}}>굴림</option>
					<option value="굴림체" {{if font_family === '굴림체'}}selected{{/if}}>굴림체</option>
					<option value="바탕" {{if font_family === '바탕'}}selected{{/if}}>바탕</option>
					<option value="바탕체" {{if font_family === '바탕체'}}selected{{/if}}>바탕체</option>
					<option value="Arial" {{if font_family === 'Arial'}}selected{{/if}}>Arial</option>
					<option value="Arial Black" {{if font_family === 'Arial Black'}}selected{{/if}}>Arial Black</option>
					<option value="Tahoma" {{if font_family === 'Tahoma'}}selected{{/if}}>Tahoma</option>
					<option value="Verdana" {{if font_family === 'Verdana'}}selected{{/if}}>Verdana</option>
					<option value="Sans-Serif" {{if font_family === 'Sans-Serif'}}selected{{/if}}>Sans-Serif</option>
					<option value="Serif" {{if font_family === 'Serif'}}selected{{/if}}>Serif</option>
					<option value="Monospace" {{if font_family === 'Monospace'}}selected{{/if}}>Monospace</option>
					<option value="Cursive" {{if font_family === 'Cursive'}}selected{{/if}}>Cursive</option>
					<option value="Fantasy" {{if font_family === 'Fantasy'}}selected{{/if}}>Fantasy</option>
					<option value="Times New Roman" {{if font_family === 'Times New Roman'}}selected{{/if}}>Times New Roman</option>
					<option value="Century Gothic" {{if font_family === 'Century Gothic'}}selected{{/if}}>Century Gothic</option>
					<option value="Courier New" {{if font_family === 'Courier New'}}selected{{/if}}>Courier New</option>
					<option value="Georgia" {{if font_family === 'Georgia'}}selected{{/if}}>Georgia</option>
				</select>
				<select id="prop-default-fontsize" class="input-text gt-w-auto">
					<option value="9px" {{if font_size === '9px'}}selected{{/if}}>9px</option>
					<option value="10px" {{if font_size === '10px'}}selected{{/if}}>10px</option>
					<option value="11px" {{if font_size === '11px'}}selected{{/if}}>11px</option>
					<option value="12px" {{if font_size === '12px'}}selected{{/if}}>12px</option>
					<option value="13px" {{if font_size === '13px'}}selected{{/if}}>13px</option>
					<option value="14px" {{if font_size === '14px'}}selected{{/if}}>14px</option>
					<option value="16px" {{if font_size === '16px'}}selected{{/if}}>16px</option>
					<option value="18px" {{if font_size === '18px'}}selected{{/if}}>18px</option>
					<option value="24px" {{if font_size === '24px'}}selected{{/if}}>24px</option>
					<option value="32px" {{if font_size === '32px'}}selected{{/if}}>32px</option>
				</select>
				<select id="prop-default-lineheight" class="input-text gt-w-auto">
					<option value="1" {{if line_height === '1'}}selected{{/if}}>1</option>
					<option value="1.2" {{if line_height === '1.2'}}selected{{/if}}>1.2</option>
					<option value="1.4" {{if line_height === '1.4'}}selected{{/if}}>1.4</option>
					<option value="1.6" {{if line_height === '1.6'}}selected{{/if}}>1.6</option>
					<option value="1.8" {{if line_height === '1.8'}}selected{{/if}}>1.8</option>
					<option value="2" {{if line_height === '2'}}selected{{/if}}>2</option>
				</select>
			</div>
		</div>
	</div>
	<div class="gt-clearfix">
		<div>
			<div class="title-height"><span class="gt-font-bold">기본 값</span></div>
			<div>
							<textarea style="display:none;" id="prop-editor-contents"></textarea>
			</div>
		</div>
		
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#editorPropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#editorPropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>

	<script id="insaProperties" ,="" type="text/x-jquery-tmpl">
<div class="layer_box md_dbInputField md_provided hide prop-area" id="insaPropertiesArea">
	<div class="title_layer text_variables">입력 항목 설정</div>
	<div class="gt-clearfix first-input">
		<div class="">
			<div class="title-height">
				<span class="gt-font-bold gt-align-middle" style="position:relative">입력 방식</span>
				<a href="javascript:void(0)" class="icon question tipsIcon gt-align-middle gt-float-none" style="margin:2px 0 0 0"><span class="blind">입력 방식</span></a>
				<div class="tooltip hide">
					<div class="tooltip-box">
						<p>결재 문서를 작성할 때 표시되는 인사 정보가 작성자인지 검색한 대상인지 선택합니다. 이름 검색 입력은 작성 페이지에서 이름을 검색해야 해당 조직원의 인사 정보가 표시됩니다.</p>
					</div>
				</div>
			</div>
			<div clsss="gt-mv-5">
				<label class="gt-mr-20"><input type="radio" name="prop-insa-searchname" value="N" ${search_name == 'N' ? "checked" : ""}> 작성자 자동 입력</label>
				<label><input type="radio" name="prop-insa-searchname" value="Y" ${search_name == 'Y' ? "checked" : ""}> 이름 검색 입력</label>
			</div>
		</div>
	</div>
	<div class="gt-clearfix gt-mt-35">
		<div class="">
			<div class="title-height"><span class="gt-font-bold">항목 선택</span></div>
			<div>
				<ul>
					{{each(i, item) chk}}
					<li class="gt-d-inline-block gt-mr-25 gt-mv-5"><label><input type="checkbox" name="prop-insa-chk" value="${item.fieldtype}" ${item.chk == true ? "checked" : ""} ${search_name == 'Y' && item.fieldtype == 'username' ? "disabled='disabled'" : ""}/> ${item.label}</label></li>
					{{/each}}
				</ul>
			</div>
		</div>
	</div>
	<div class="gt-clearfix hide" id="prop-insa-require-area">
		<div class="right_area">
			<div class="must-checkbox">
				<label class=""><input type="checkbox" class="gt-align-middle" id="prop-insa-require" ${require == 'Y' ? "checked" : ""}> 필수 입력</label>
			</div>
		</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables df-prop-action df-prop-save">확인</button>
		<button type="button" onclick="jQuery('#insaPropertiesArea').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="jQuery('#insaPropertiesArea').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
</script>



	<script>
		Approval._defaultFontFamily = '맑은 고딕';
		Approval._defaultFontSize = '16px';
		Approval._defaultLineHeight = '1.6';
		Approval._defaultEditor = 'synap';

		dbUnitCreate._unitMode = 'modify';
		dbUnitCreate
				.init(
						'formDiv',
						"{\"components\": [{\"cid\": \"k06929kj9oxq\", \"type\": \"text\", \"eleId\": \"\", \"label\": \"\uc218\uc2e0\", \"order\": \"0\", \"valid\": \"all\", \"width\": \"80\", \"require\": \"N\", \"tooltip\": \"\", \"maxlength\": \"100\", \"minlength\": \"0\", \"defaultval\": \"\", \"hide_label\": \"N\", \"width_type\": \"pc\", \"show_tooltip\": \"N\"}, {\"cid\": \"k06929kkmowm\", \"type\": \"text\", \"eleId\": \"\", \"label\": \"(\uacbd\uc720)\", \"order\": \"1\", \"valid\": \"all\", \"width\": \"80\", \"require\": \"N\", \"tooltip\": \"\", \"maxlength\": \"100\", \"minlength\": \"0\", \"defaultval\": \"\", \"hide_label\": \"N\", \"width_type\": \"pc\", \"show_tooltip\": \"N\"}, {\"cid\": \"k06929kl1jro\", \"type\": \"editor\", \"eleId\": \"\", \"label\": \"\uc5d0\ub514\ud130\", \"order\": \"2\", \"require\": \"N\", \"tooltip\": \"\", \"defaultval\": \"\", \"hide_label\": \"Y\", \"show_tooltip\": \"N\"}, {\"cid\": \"k0696qezq91t\", \"type\": \"text\", \"eleId\": \"\", \"label\": \"\uc218\uc2e0\uc790\", \"order\": \"3\", \"valid\": \"all\", \"width\": \"80\", \"require\": \"N\", \"tooltip\": \"\", \"maxlength\": \"100\", \"minlength\": \"0\", \"defaultval\": \"\", \"hide_label\": \"N\", \"width_type\": \"pc\", \"show_tooltip\": \"N\"}]}");

		$j(document).ready(function() {
			// 	$j('.menu-item').draggable({
			// 		connectToSortable:'#formDiv',
			// 		helper:'clone',
			// 		revert : 'invalid'
			// 	});
			//   $j( ".menu-item" ).disableSelection();

			$j('#formDiv').sortable({
				connectWith : "#formDiv",
				revert : true,
				stop : function(event, ui) {

				},
				handle : '.unit-btn-handle'
			});
		});
	</script>
</div>