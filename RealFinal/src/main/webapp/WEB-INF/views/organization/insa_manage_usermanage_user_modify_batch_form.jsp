<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3 style="font-size: 22px;">사용자 일괄 수정</h3>
	</div>

	<div class="content_inbox insa-new">
		<div class="contents_insa">
			<p class="Lh16">
				오피스에 이미 등록된 사용자 정보를 엑셀 파일(.csv)에서 수정하여 최대 100건까지 일괄 적용할 수 있습니다.<br>
				[임직원 정보 업데이트용 파일 다운로드]에서 일괄 수정할 부서의 임직원 정보를 다운로드 받아 데이터를 편집한 후 업로드하여
				일괄 수정할 수 있습니다.
			</p>
			<br>
			<button class="gt-round-medium hw-button"
				id="profile_image_bulk_enrollment_button"
				onclick="jQuery('#info_file_excel_download').showPopup(this);">임직원
				정보 업데이트용 파일 다운로드</button>

			<form id="upload_excel_new_form" enctype="multipart/form-data">
				<h4 class="tle_insa_01">사용자 일괄 수정</h4>
				<label><input type="text" id="tmp_excel_file"
					disabled="disabled" title="입력하세요." class="textbox_insa"
					style="width: 500px;" placeholder="대상파일을 선택하세요(*.xlsx)"></label>&nbsp;
				<input type="file" class="hide" name="excel_file" id="excel_file">
				<input type="hidden" name="page_flag" value="modify"> <a
					href="javascript:void(0);"
					onclick="userModifyBatch.readExcelFile(event);" class="blue_color">불러오기</a><br>
			</form>

			<div id="validation_list"></div>
		</div>
	</div>

	<!-- 소속 조직 설정 레이어 -->
	<div class="layer_box middle address hide" id="org_setting">
		<div class="title_layer text_variables">소속 조직 설정</div>

		<label> <select title="선택" class="select_insa"
			style="width: 100%;" id="org_selector"
			onclick="userModifyBatch.orgLayer(event)">
				<option value="noselect">조직선택</option>
		</select>
			<div class="dropdown hide" id="org_dropdown" style="width: 100%;">
				<div class="dropdown-menu block"
					style="width: 100%; overflow: auto;">
					<div class="filter_orgtree" id="layerNode" style="height: 250px;">
						<ul id="organization-nodes-root" class="hw-org-branch root">
							<li class="organization-nodes" no="2256">
								<div class="container">
									<strong class="js-org-selected-node">하이웍스산업</strong> <img
										src="/static/ui/images/icon_minus.png" class="js-org-folding">
								</div>
								<ul class="js-node-area hw-org-branch" style="display: block;">
									<li class="organization-nodes" no="2258">
										<div class="container">
											<strong class="js-org-selected-node">관리부</strong> <img
												src="/static/ui/images/icon_plus.png" class="js-org-folding">
										</div>
										<ul class="js-node-area hw-org-branch" style="display: none;">
											<li class="organization-nodes" no="2261">
												<div class="container">
													<strong class="js-org-selected-node">인사팀</strong>
												</div>
											</li>
											<li class="organization-nodes" no="2262">
												<div class="container">
													<strong class="js-org-selected-node">구매총무팀</strong>
												</div>
											</li>
											<li class="organization-nodes" no="2263">
												<div class="container">
													<strong class="js-org-selected-node">재무회계팀</strong>
												</div>
											</li>
										</ul>
									</li>
									<li class="organization-nodes" no="2259">
										<div class="container">
											<strong class="js-org-selected-node">생산부</strong> <img
												src="/static/ui/images/icon_plus.png" class="js-org-folding">
										</div>
										<ul class="js-node-area hw-org-branch" style="display: none;">
											<li class="organization-nodes" no="2264">
												<div class="container">
													<strong class="js-org-selected-node">생산1팀</strong>
												</div>
											</li>
											<li class="organization-nodes" no="2265">
												<div class="container">
													<strong class="js-org-selected-node">생산2팀</strong>
												</div>
											</li>
											<li class="organization-nodes" no="2266">
												<div class="container">
													<strong class="js-org-selected-node">품질관리팀</strong>
												</div>
											</li>
										</ul>
									</li>
									<li class="organization-nodes" no="2260">
										<div class="container">
											<strong class="js-org-selected-node">영업부</strong> <img
												src="/static/ui/images/icon_plus.png" class="js-org-folding">
										</div>
										<ul class="js-node-area hw-org-branch" style="display: none;">
											<li class="organization-nodes" no="2267">
												<div class="container">
													<strong class="js-org-selected-node">영업1팀</strong>
												</div>
											</li>
											<li class="organization-nodes" no="2268">
												<div class="container">
													<strong class="js-org-selected-node">영업2팀</strong>
												</div>
											</li>
											<li class="organization-nodes" no="2269">
												<div class="container">
													<strong class="js-org-selected-node">고객지원팀</strong>
												</div>
											</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<ul id="no_organization_root" class="hw-org-branch root">
							<li class="organization-nodes" no="-1">
								<div class="container">
									<strong class="js-org-selected-node">소속없음</strong>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</label>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="userModifyBatch.orgLayerOk()">저장</button>
			<button type="button"
				onclick="jQuery('#org_setting').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#org_setting').hidePopup(this);" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- //소속 조직 설정 레이어 -->

	<!-- 직위 선택 레이어 -->
	<div class="layer_box middle address hide" id="position_setting">
		<div class="title_layer text_variables">직위 설정</div>

		<label><select title="선택" class="select_insa"
			style="width: 100%;" id="position_selector">
				<option value="6590">대표이사</option>
				<option value="6591">사장</option>
				<option value="6592">상무</option>
				<option value="6593">이사</option>
				<option value="6594">부장</option>
				<option value="6595">차장</option>
				<option value="6596">과장</option>
				<option value="6597">대리</option>
				<option value="6598">주임</option>
				<option value="6599">사원</option>
				<option value="6600">계약직</option>
		</select></label>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="userModifyBatch.positionChange();">저장</button>
			<button type="button"
				onclick="jQuery('#position_setting').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#position_setting').hidePopup(this);" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- //직위 선택 레이어 -->

	<!-- 직무 선택 레이어 -->
	<div class="layer_box middle address hide" id="job_setting">
		<div class="title_layer text_variables">직무 설정</div>

		<label><select title="선택" class="select_insa"
			style="width: 100%;" id="job_selector">
				<option value="6601">기획</option>
				<option value="6602">전산</option>
				<option value="6603">영업</option>
				<option value="6604">생산</option>
				<option value="6605">개발</option>
				<option value="6606">디자인</option>
				<option value="6607">인사</option>
				<option value="6608">재무회계</option>
				<option value="6609">마케팅</option>
				<option value="6610">구매</option>
				<option value="6611">관리</option>
		</select></label>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="userModifyBatch.jobChange();">저장</button>
			<button type="button"
				onclick="jQuery('#job_setting').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#job_setting').hidePopup(this);" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- //직무 선택 레이어 -->

	<!-- 근로형태 선택 레이어 -->
	<div class="layer_box middle address hide" id="working_type_setting">
		<div class="title_layer text_variables">근로형태 설정</div>

		<label><select title="선택" class="select_insa"
			style="width: 100%;" id="working_type_selector">
				<option value="1109">일반직</option>
				<option value="1111">임원,촉탁</option>
		</select></label>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="userModifyBatch.workingTypeChange();">저장</button>
			<button type="button"
				onclick="jQuery('#working_type_setting').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#working_type_setting').hidePopup(this);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
	<!-- //근로형태 선택 레이어 -->


	<div class="hw-modal-wrap hr-migration size-xs hide popup35"
		id="profile_image_bulk_enrollment">
		<div class="hw-modal-header">
			<strong>프로필 사진 일괄 등록</strong>
		</div>
		<div class="hw-modal-body">
			<div class="gt-mb-30 usage-explain">
				<p>임직원의 프로필 사진을 일괄등록할 수 있습니다.</p>
				<p>등록 기준 ID또는 사번으로 선택하여, 등록할 이미지의 파일이름을 기준에 따라 저장한 후, zip파일로 만들어
					등록하세요.</p>
				<p>등록 가능한 이미지 종류는 jpeg, jpg, gif, png, bmp이며, 최대 권장 사이즈는
					330x330px(10MB미만)입니다.</p>
			</div>

			<div class="hw-modal-div-table">
				<div class="gt-d-table">
					<div class="gt-d-table-cell">등록 기준</div>
					<div class="gt-d-table-cell">
						<label class="gt-mr-30"><input class="hw-radio gt-mr-10"
							type="radio" name="profile_35" value="mail_id">ID를 기준으로
							등록</label> <label><input class="hw-radio gt-mr-10" type="radio"
							name="profile_35" value="company_num">사번을 기준으로 등록</label>
					</div>
				</div>
				<div class="gt-d-table">
					<div class="gt-d-table-cell">이미지zip 파일 등록</div>
					<div class="gt-d-table-cell">
						<form id="upload_zip_form" method="post">
							<a href="javascript:void(0);"
								onclick="userModifyBatch.downloadModifyExcelForm(event);"
								class="blue_color">불러오기</a><br>
						</form>
						<div id="validation_list"></div>
						<p class="file-upload-success-explain hide"
							id="success_zip_upload">선택되었습니다. 등록 버튼을 클릭하세요.</p>
					</div>
				</div>
			</div>

		</div>
		<div class="hw-modal-footer">
			<button type="button" class="hw-button secondary"
				onclick="jQuery('#profile_image_bulk_enrollment').hidePopup(this);">닫기</button>
			<button type="button" class="hw-button"
				onclick="userModifyBatch.downloadModifyExcelForm()">등록</button>
		</div>
	</div>

	<div class="hw-modal-wrap hr-migration size-lg hide"
		id="info_file_excel_download">
		<div class="hw-modal-header">
			<strong>임직원 정보 업데이트용 파일 다운로드</strong>
		</div>
		<div class="hw-modal-body" style="overflow-y: initial;">
			<div class="gt-mb-30 usage-explain">
				<p>업데이트할 임직원의 정보를 엑셀파일(.xls)로 다운로드받아 원하는 정보를 일괄 수정할 수 있습니다.</p>
				<p>수정할 항목 및 대상 부서를 선택하여 파일을 다운로드 받으세요.</p>
				<p>선택한 수정항목만 업데이트할 수 있도록 업데이트용 파일이 생성됩니다.</p>
			</div>
			<div class="gt-mb-50 correction-values">
				<p class="hw-mig-div--title">수정할 항목 선택</p>
				<ul class="checkbox-float-ul gt-clearfix">
					<li><label><input type="checkbox" id="checkAll"
							onclick="userModifyBatch.checkAllColumns()">전체</label></li>
					<li><label><input type="checkbox" value="working_type"
							onclick="userModifyBatch.checkAllDisable()">근로형태</label></li>
					<li><label><input type="checkbox" value="company_num"
							onclick="userModifyBatch.checkAllDisable()">사번</label></li>
					<li><label><input type="checkbox" value="joindate"
							onclick="userModifyBatch.checkAllDisable()">입사일</label></li>
					<li><label><input type="checkbox" value="nodes"
							onclick="userModifyBatch.checkAllDisable()">소속조직</label></li>
					<li><label><input type="checkbox" value="position"
							onclick="userModifyBatch.checkAllDisable()">직위</label></li>
				</ul>
				<ul class="checkbox-float-ul gt-clearfix gt-mt-10">
					<li><label><input type="checkbox" value="job"
							onclick="userModifyBatch.checkAllDisable()">직무</label></li>
					<li><label><input type="checkbox" value="birthday"
							onclick="userModifyBatch.checkAllDisable()">생년월일</label></li>
					<li><label><input type="checkbox" value="email"
							onclick="userModifyBatch.checkAllDisable()">이메일</label></li>
					<li><label><input type="checkbox" value="phone"
							onclick="userModifyBatch.checkAllDisable()">사내전화</label></li>
					<li><label><input type="checkbox" value="cell"
							onclick="userModifyBatch.checkAllDisable()">휴대전화</label></li>
					<li><label><input type="checkbox" value="address"
							onclick="userModifyBatch.checkAllDisable()">자택주소</label></li>
				</ul>
			</div>
			<div class="gt-mb-30">
				<p class="hw-mig-div--title">대상부서 선택</p>
				<label style="overflow-y: initial"> <select title="선택"
					class="select_insa" style="width: 100%;"
					onclick="userModifyBatch.showNodeList(this, event);"
					id="excel_node_select">
						<option value="ALL">모든 사용자</option>
				</select>
					<div class="dropdown hide" id="excel_node_list"
						style="width: 100%;">
						<div class="dropdown-menu block"
							style="width: 100%; overflow-y: auto;">
							<div id="excelNode" class="filter_orgtree"
								style="max-height: 150px; width: 100%;">
								<ul class="node">
									<li no="ALL"><div class="container">
											<strong onclick="excel.selectedNode(this, event)">모든
												사용자</strong>
										</div></li>
								</ul>
								<ul id="organization-nodes-root" class="hw-org-branch root">
									<li class="organization-nodes" no="2256">
										<div class="container">
											<strong class="js-org-selected-node">하이웍스산업</strong> <img
												src="/static/ui/images/icon_minus.png"
												class="js-org-folding">
										</div>
										<ul class="js-node-area hw-org-branch" style="display: block;">
											<li class="organization-nodes" no="2258">
												<div class="container">
													<strong class="js-org-selected-node">관리부</strong> <img
														src="/static/ui/images/icon_plus.png"
														class="js-org-folding">
												</div>
												<ul class="js-node-area hw-org-branch"
													style="display: none;">
													<li class="organization-nodes" no="2261">
														<div class="container">
															<strong class="js-org-selected-node">인사팀</strong>
														</div>
													</li>
													<li class="organization-nodes" no="2262">
														<div class="container">
															<strong class="js-org-selected-node">구매총무팀</strong>
														</div>
													</li>
													<li class="organization-nodes" no="2263">
														<div class="container">
															<strong class="js-org-selected-node">재무회계팀</strong>
														</div>
													</li>
												</ul>
											</li>
											<li class="organization-nodes" no="2259">
												<div class="container">
													<strong class="js-org-selected-node">생산부</strong> <img
														src="/static/ui/images/icon_plus.png"
														class="js-org-folding">
												</div>
												<ul class="js-node-area hw-org-branch"
													style="display: none;">
													<li class="organization-nodes" no="2264">
														<div class="container">
															<strong class="js-org-selected-node">생산1팀</strong>
														</div>
													</li>
													<li class="organization-nodes" no="2265">
														<div class="container">
															<strong class="js-org-selected-node">생산2팀</strong>
														</div>
													</li>
													<li class="organization-nodes" no="2266">
														<div class="container">
															<strong class="js-org-selected-node">품질관리팀</strong>
														</div>
													</li>
												</ul>
											</li>
											<li class="organization-nodes" no="2260">
												<div class="container">
													<strong class="js-org-selected-node">영업부</strong> <img
														src="/static/ui/images/icon_plus.png"
														class="js-org-folding">
												</div>
												<ul class="js-node-area hw-org-branch"
													style="display: none;">
													<li class="organization-nodes" no="2267">
														<div class="container">
															<strong class="js-org-selected-node">영업1팀</strong>
														</div>
													</li>
													<li class="organization-nodes" no="2268">
														<div class="container">
															<strong class="js-org-selected-node">영업2팀</strong>
														</div>
													</li>
													<li class="organization-nodes" no="2269">
														<div class="container">
															<strong class="js-org-selected-node">고객지원팀</strong>
														</div>
													</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
								<ul id="no_organization_root" class="hw-org-branch root">
									<li class="organization-nodes" no="-1">
										<div class="container">
											<strong class="js-org-selected-node">소속없음</strong>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</label>
			</div>
		</div>
		<div class="hw-modal-footer">
			<button type="button" class="hw-button"
				onclick="userModifyBatch.downloadModifyExcelForm()">다운로드</button>
			<button type="button" class="hw-button secondary"
				onclick="jQuery('#info_file_excel_download').hidePopup(this);">취소</button>
		</div>
	</div>
	<script id="tmpl_organization_root" type="text/x-jquery-tmpl">
	<ul id="organization-nodes-root" class="hw-org-branch root">
		{{tmpl "#tmpl_organization"}}
	</ul>
</script>
	<script id="tmpl_no_organization_root" type="text/x-jquery-tmpl">
	<ul id="no_organization_root" class="hw-org-branch root">
		{{tmpl "#tmpl_organization"}}
	</ul>
</script>
	<script id="tmpl_organization" type="text/x-jquery-tmpl">
    <li class="organization-nodes${hidden ? " hide" : ""}" no="${node_id}">
		<div class="container">
			<strong class="js-org-selected-node">${name}</strong>
			{{if show_count }}
			<span style="color:silver; font-size:8pt;">(${count})</span>
			{{/if}}
			{{if nodes && nodes.length > 0}}
			<img src="/static/ui/images/${expanded ? 'icon_minus.png' : 'icon_plus.png'}" class="js-org-folding"/>
			{{/if}}
		</div>
		{{if show_users && entries && entries.length > 0}}
			<ul class="user organization-members" style="${expanded ? 'display:block;' : 'display:none;'}">{{tmpl(entries) "#tmpl_members"}}</ul>
        {{/if}}
        {{if nodes && nodes.length > 0}}
            <ul class="js-node-area hw-org-branch" style="${expanded ? 'display:block;' : 'display:none;'}">{{tmpl(nodes) "#tmpl_organization"}}</ul>
        {{/if}}
    </li>
</script>
	<script id="tmpl_members" type="text/x-jquery-tmpl">
	<li user_no="${user_no}">
		<div>
			<img src="/static/ui/images/icon_man.png"/>
			<a href="javascript:void(0);">
				<span name="position">${position}</span>
				<span name="user_name">${user_name}</span>
			</a>
		</div>
	</li>
</script>
</div>