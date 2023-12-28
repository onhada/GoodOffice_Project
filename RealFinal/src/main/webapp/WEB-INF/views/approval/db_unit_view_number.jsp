<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="contents">
	<div class="content_title">
		<!-- Title -->
		<form>
			<fieldset>
				<span class="detail_select"><a
					href="javascript:DBUnitBasic.modifyDBUnit(1199);">유닛수정</a></span> <span
					class="detail_select"><a
					href="javascript:DBUnitBasic.copyDBUnit(1199);">유닛복사</a></span> <span
					class="detail_select"> <a
					href="javascript:DBUnitBasic.checkDeleteDBUnit(1199);">유닛삭제</a>
				</span>
			</fieldset>
		</form>
		<!-- Title End -->
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box">
			<div class="approval-wrap approval-unit" style="width: 970px">
				<table class="tableType02 gt-mb-25">
					<caption>유닛설명</caption>
					<colgroup>
						<col style="width: 119px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">유닛명</th>
							<td>공기업 공문</td>
						</tr>
						<tr>
							<th scope="row">설명</th>
							<td>공기업용 공문을 생성할때 사용</td>
						</tr>
					</tbody>
				</table>

				<div class="unit-box">
					<div id="db_unit_render" class="unit-box-contents">
						<div id="lpphabdb5sjs">
							<div class="df-wrap unit-row" id="k06929kj9oxq" df-type="text">
								<div class="df-field-label unit-cell-head">
									<label class="gt-align-middle">수신 </label>
								</div>
								<div class="df-field unit-cell-body gt-d-table gt-h-auto">
									<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
										type="text" class="hw-input-form type-text-width" value=""
										style="width: 80% !important;" disabled="" minlength="0"
										maxlength="100">
									</span> <span class="gt-d-table-cell unit-btn-cell"></span>
								</div>
							</div>
							<div class="df-wrap unit-row" id="k06929kkmowm" df-type="text">
								<div class="df-field-label unit-cell-head">
									<label class="gt-align-middle">(경유) </label>
								</div>
								<div class="df-field unit-cell-body gt-d-table gt-h-auto">
									<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
										type="text" class="hw-input-form type-text-width" value=""
										style="width: 80% !important;" disabled="" minlength="0"
										maxlength="100">
									</span> <span class="gt-d-table-cell unit-btn-cell"></span>
								</div>
							</div>
							<div class="df-wrap unit-row" id="k06929kl1jro" df-type="editor">
								<div class="df-field-label unit-cell-head editor gt-d-block">
									<label class="gt-align-middle"> </label>
								</div>
								<div class="df-field editor-content gt-mt-10">
									<span class="gt-d-table-cell gt-pr-10 gt-w-100">
										<div class="df-editor-area" id="editor_k06929kl1jro_holder">
											<img style="width: 100%"
												src="https://static.hiworks.com/office/static/ui/images/editor_screenshot.png"
												alt="editor">
										</div> <textarea style="display: none"
											id="editor_k06929kl1jro_contents">에디터 영역일까?</textarea>
									</span> <span class="gt-d-table-cell unit-btn-cell"></span>
								</div>
							</div>
							<div class="df-wrap unit-row" id="k0696qezq91t" df-type="text">
								<div class="df-field-label unit-cell-head">
									<label class="gt-align-middle">수신자 </label>
								</div>
								<div class="df-field unit-cell-body gt-d-table gt-h-auto">
									<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
										type="text" class="hw-input-form type-text-width" value=""
										style="width: 80% !important;" disabled="" minlength="0"
										maxlength="100">
									</span> <span class="gt-d-table-cell unit-btn-cell"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script id="componentsTmpl" type="text/x-jquery-tmpl">
<div class="df-wrap unit-row" id="${cid}" df-type="${type}">
	{{tmpl "#labelTmpl"}}

	{{if type == "editor"}}
	<div class="df-field editor-content gt-mt-10">
	{{else}}
	<div class="df-field unit-cell-body gt-d-table gt-h-auto">
	{{/if}}

		<span class="gt-d-table-cell gt-pr-10 gt-w-100">
	{{if type == 'text'}}
			<input type="text" class="hw-input-form type-text-width" value="${defaultval}" style="width:${width}${width_type === 'pc' ? '%' : 'px'} !important;" disabled/>
	{{else type == 'number'}}
		<input type="text" class="hw-input-form type-number-width" maxlength="20" value="${defaultval}" style="width:${width}${width_type === 'pc' ? '%' : 'px'} !important;" disabled/>
	{{else type == 'date'}}
		<span class="gt-position-relative gt-d-inline-block">
			<input type="text" class="hw-input-form type-date-width" value="${defaultval}" readonly="" disabled>
			<span class="input-suffix-btn gt-p-5" disabled="disabled"><i class="fal fa-calendar-alt"></i></span>
		</span>
	{{else type == 'time'}}
		{{if format === 'kr_ap kr_hh kr_mm'}}
			<select id="timeap" class="hw-input-form type-time-width">
				<option ${ap === '오전' ? 'selected' : ''}>오전</option>
				<option ${ap === '오후' ? 'selected' : ''}>오후</option>
			</select>&nbsp;
			<input type="text" id="timehh" value="${parseInt(hh)}" maxlength="2" class="hw-input-form type-time-width" disabled/><span class="gt-ml-5 gt-mr-10">시</span>
			<input type="text" id="timemm" value="${parseInt(mm)}" maxlength="2" class="hw-input-form type-time-width" disabled/><span class="gt-ml-5 gt-mr-10">분</span>
		{{else format === 'kr_hh kr_mm'}}
			<input type="text" id="timehh" value="${parseInt(hh)}" maxlength="2" class="hw-input-form type-time-width" disabled/><span class="gt-ml-5 gt-mr-10">시</span>
			<input type="text" id="timemm" value="${parseInt(mm)}" maxlength="2" class="hw-input-form type-time-width" disabled/><span class="gt-ml-5 gt-mr-10">분</span>
		{{else format === 'hh:mm ap'}}
			<input type="text" id="timehh" value="${hh}" maxlength="2" class="hw-input-form type-time-width" disabled/> :
			<input type="text" id="timemm" value="${mm}" maxlength="2" class="hw-input-form type-time-width" disabled/>&nbsp;
			<select id="timeap" class="hw-input-form type-time-width">
				<option ${ap === 'AM' ? 'selected' : ''}>AM</option>
				<option ${ap === 'PM' ? 'selected' : ''}>PM</option>
			</select>
		{{else format === 'hh:mm:ss'}}
			<input type="text" id="timehh" value="${hh}" maxlength="2" class="hw-input-form type-time-width" disabled/> :
			<input type="text" id="timemm" value="${mm}" maxlength="2" class="hw-input-form type-time-width" disabled/> :
			<input type="text" id="timess" value="${ss}" maxlength="2" class="hw-input-form type-time-width" disabled/>
		{{/if}}
	{{else type == 'radio'}}
		{{each(j, radio) radio_group}}
		<div class="${direction === 'h' ? 'gt-d-inline-block' : ''}">
			<label class="gt-mr-10">
				<input type="radio" name="radio${cid}" value="${radio.value}" ${radio.value == defaultval ? "checked" : ""} disabled /> ${radio.label}
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
		<textarea class="hw-input-form type-text-width gt-h-auto" style="width:${width}${width_type === 'pc' ? '%' : 'px'} !important;" rows="5" disabled>${defaultval}</textarea>
	{{else type == 'editor'}}
		<div class="df-editor-area" id="editor_${cid}_holder">
			<img style="width:100%" src="https://static.hiworks.com/office/static/ui/images/editor_screenshot.png" alt="editor">
		</div>
		<textarea style="display:none" id="editor_${cid}_contents">에디터 영역일까?</textarea>
	{{/if}}
		</span>
		<span class="gt-d-table-cell unit-btn-cell"></span>
	</div>
</div>
</script>
	<script id="insaComponentsTmpl" type="text/x-jquery-tmpl">
<div class="df-wrap unit-row ${typeof groupid != 'undefined' ? groupid : ''}" id="${cid}" df-type="${type}" df-fieldtype="${field_type}">

	<div class="df-field-label unit-cell-head">
		<label class="gt-align-middle">${label}</label>
	</div>
	<div class="df-field unit-cell-body">
	{{if field_type == "username"}}
		{{if search_name == 'Y'}}
			<input disabled="disabled" type="text" style="height:34px;" class="txt-input bg js-db-unit-autocomplete ui-autocomplete-input" id="username_${cid}" value="${defaultval}" placeholder="클릭 후 입력" autocomplete="off">
			<span id="insaSearchBtn_${cid}" class="gt-p-5 gt-ml-10 hover-blue-text"><i class="fal fa-search"></i></span>
			<span id="textUsername_${cid}"></span>
			<button id="modifyUsernameBtn_${cid}" class="weakblue mgl_20 df-action df-modify hide">변경</button>
		{{else}}
			작성자 ${label}
		{{/if}}
	{{else}}
		{{if search_name == 'Y'}}{{else}}작성자 {{/if}}${label}
	{{/if}}
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
	<script>
		var DBUnitRender = new DBUnitRenderClass();
		DBUnitRender
				.render({
					mode : 'unit_view',
					renderElement : ('#db_unit_render'),
					components : "{\"components\": [{\"cid\": \"k06929kj9oxq\", \"type\": \"text\", \"eleId\": \"\", \"label\": \"\uc218\uc2e0\", \"order\": \"0\", \"valid\": \"all\", \"width\": \"80\", \"require\": \"N\", \"tooltip\": \"\", \"maxlength\": \"100\", \"minlength\": \"0\", \"defaultval\": \"\", \"hide_label\": \"N\", \"width_type\": \"pc\", \"show_tooltip\": \"N\"}, {\"cid\": \"k06929kkmowm\", \"type\": \"text\", \"eleId\": \"\", \"label\": \"(\uacbd\uc720)\", \"order\": \"1\", \"valid\": \"all\", \"width\": \"80\", \"require\": \"N\", \"tooltip\": \"\", \"maxlength\": \"100\", \"minlength\": \"0\", \"defaultval\": \"\", \"hide_label\": \"N\", \"width_type\": \"pc\", \"show_tooltip\": \"N\"}, {\"cid\": \"k06929kl1jro\", \"type\": \"editor\", \"eleId\": \"\", \"label\": \"\uc5d0\ub514\ud130\", \"order\": \"2\", \"require\": \"N\", \"tooltip\": \"\", \"defaultval\": \"\", \"hide_label\": \"Y\", \"show_tooltip\": \"N\"}, {\"cid\": \"k0696qezq91t\", \"type\": \"text\", \"eleId\": \"\", \"label\": \"\uc218\uc2e0\uc790\", \"order\": \"3\", \"valid\": \"all\", \"width\": \"80\", \"require\": \"N\", \"tooltip\": \"\", \"maxlength\": \"100\", \"minlength\": \"0\", \"defaultval\": \"\", \"hide_label\": \"N\", \"width_type\": \"pc\", \"show_tooltip\": \"N\"}]}",
					template : '#componentsTmpl'
				});
	</script>
</div>