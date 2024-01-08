<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents" style="left: 276px;">
	<div class="setting_title after">
		<h3 class="fl" style="font-size: 22px;">임직원 관리</h3>
	</div>

	<div class="content_inbox insa-new">
		<div class="contents_insa">
			<div class="gt-mb-30">사용자 계정은 전체관리자에 한해
				[오피스관리&gt;사용자관리&gt;사용자관리] 페이지에서 생성할 수 있으며, [인사&gt;임직원 관리]에서는 생성된 계정의
				임직원 정보를 수정, 관리할 수 있습니다.</div>

			<ul class="list_insa_t1">
				<li><a href="javascript:void(0);"
					onclick="usermanage.basicSetting();">기본설정</a></li>
				<li><a href="https://officeadmin.office.hiworks.com">사용자 추가</a></li>
				<li><a href="javascript:void(0)"
					onclick="usermanage.batchModifyUserForm();">사용자 일괄 수정</a></li>
				<li><a href="javascript:void(0)"
					onclick="usermanage.showBulkCreateProfileLayer();">프로필 사진 일괄 등록</a></li>
			</ul>

			<ul class="Clearfix Mt35">
				<li class="Fl Pl25" style="padding-left: 15px; height: 2px;"><input
					type="checkbox" id="checkboxAll"> <span
					class="detail_select blue_color" id="filter_org"> 보기: <a
						href="javascript:void(0)" class="layerShow blue_color"><span
							id="filtered_org_name">모든 사용자</span> <img
							src="/static/ui/images/btn_drop.gif" alt="모두보기" class="open_drop"></a>
						<div class="dropdown hide" id="filter_orgtree_area">
							<div class="dropdown-menu block scroll"
								style="padding: 0; top: 4px; overflow: auto; width: 250px;">
								<div id="filter_orgtree" class="filter_orgtree"></div>
							</div>
						</div>
				</span> <span class="blue_color" id="selectedUser" style="display: none;">
						0</span> &nbsp; &nbsp; <a href="javascript:void(0)"
					class="blue_color hide" id="modifyWorkingType"
					onclick="jQuery('#working_type_setting').showPopup(this);"
					style="display: none;">근로형태 수정</a> &nbsp; &nbsp; <a
					href="javascript:void(0)" class="blue_color hide" id="modifyConst"
					onclick="usermanage.modifyOrgLayer();" style="display: none;">소속조직
						수정</a> &nbsp; &nbsp; <a href="javascript:void(0)"
					class="blue_color hide" id="modifyPosition"
					onclick="jQuery('#position_setting').showPopup(this);"
					style="display: none;">직위 수정</a> &nbsp; &nbsp;</li>
				<li class="Fr"><a class="icon_excel_down"
					href="javascript:void(0)" title="엑셀 다운로드"
					onclick="usermanage.showExcelDownloadLayer();"><span
						class="blind">엑셀 다운로드</span></a> <a class="icon setting"
					href="javascript:void(0)" title="입력항목 설정"
					onclick="jQuery('#input_item_setting').showPopup(this);"><span
						class="blind">입력항목 설정</span></a></li>

				<!-- 검색 -->
				<li class="insa_search fos1"><a href="javascript:void(0)"
					class="search_bt blue_color fl hide" style="margin: 0px 10px 0 0;"
					onclick="usermanage.cancelUserSearch();" id="cancel_search"> <span
						class="sp_menu searchCancel"></span>검색 취소
				</a>
					<div class="search Fr">
						<fieldset>
							<input type="text" id="txtSearch" autocomplete="off"
								maxlength="30" name="txtSearch" value=""
								placeholder="이름, ID, 사번 검색"> <span class="btn_search"><span
								class="icon src" onclick="usermanage.userSearch(event);"><em
									class="blind">검색</em></span></span>
						</fieldset>
					</div></li>
				<!-- //검색 -->
			</ul>
			<table id="userManageTable" class="tableType01 usermanage"
				style="margin-top: 12px;">
				<!-- <colgroup><col width="25"><col><col><col width="90"><col><col><col><col width="100"><col><col></colgroup> -->
				<thead>
					<tr>
						<th scope="col" style="width: 25px;"></th>
						<th scope="col" style="width: auto;"><a
							href="javascript:void(0);" onclick="usermanage.setOrder(this);"
							class="updown" id="order_name">이름<span class="up"></span></a></th>
						<th scope="col" style="width: auto;"><a
							href="javascript:void(0);" onclick="usermanage.setOrder(this);"
							class="updown" id="order_mail_id">ID</a></th>
						<th scope="col" style="width: auto;">근로형태</th>
						<th scope="col" style="width: auto;"><a
							href="javascript:void(0);" onclick="usermanage.setOrder(this);"
							class="updown" id="order_phone">사내전화</a></th>
						<th scope="col" style="width: auto;"><a
							href="javascript:void(0);" onclick="usermanage.setOrder(this);"
							class="updown" id="order_cell">휴대전화</a></th>
						<th scope="col" style="width: auto;"><a
							href="javascript:void(0);" onclick="usermanage.setOrder(this);"
							class="updown" id="order_const">소속조직</a></th>
						<th scope="col" style="width: auto;"><a
							href="javascript:void(0);" onclick="usermanage.setOrder(this);"
							class="updown" id="order_position">직위</a></th>
						<th scope="col" style="width: 66px;"><a
							href="javascript:void(0);" class="updown" id="order_active"
							onclick="usermanage.setOrder(this);">상태</a></th>
					</tr>
				</thead>
				<tbody>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68565"></label></td>
						<td>강과장</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68565)"><u>kang</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">106</td>
						<td class="cell">010-7777-7777</td>
						<td class="const" data-node="39450">영업2팀</td>
						<td class="position" data-position="112028">과장</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68562"></label></td>
						<td>김이사</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68562)"><u>kim</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">103</td>
						<td class="cell">010-4444-4444</td>
						<td class="const" data-node="39446">생산1팀</td>
						<td class="position" data-position="112025">이사</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68559"></label></td>
						<td>대표이사</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68559)"><u>ceo</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">100</td>
						<td class="cell">010-1111-1111</td>
						<td class="const" data-node="39438">하이웍스산업</td>
						<td class="position" data-position="112022">대표이사</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68561"></label></td>
						<td>박상무</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68561)"><u>park</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">102</td>
						<td class="cell">010-3333-3333</td>
						<td class="const" data-node="39444">구매총무팀</td>
						<td class="position" data-position="112024">상무</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68567"></label></td>
						<td>안주임</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68567)"><u>ahn</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">108</td>
						<td class="cell">010-9999-9999</td>
						<td class="const" data-node="39448">품질관리팀</td>
						<td class="position" data-position="112030">주임</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68566"></label></td>
						<td>양대리</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68566)"><u>yang</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">107</td>
						<td class="cell">010-8888-8888</td>
						<td class="const" data-node="39445">재무회계팀</td>
						<td class="position" data-position="112029">대리</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68563"></label></td>
						<td>오부장</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68563)"><u>oh</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">104</td>
						<td class="cell">010-5555-5555</td>
						<td class="const" data-node="39447">생산2팀</td>
						<td class="position" data-position="112026">부장</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68568"></label></td>
						<td>이사원</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68568)"><u>lee</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">109</td>
						<td class="cell">010-1234-5678</td>
						<td class="const" data-node="39451">고객지원팀</td>
						<td class="position" data-position="112031">사원</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68564"></label></td>
						<td>조차장</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68564)"><u>jo</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">105</td>
						<td class="cell">010-6666-6666</td>
						<td class="const" data-node="39449">영업1팀</td>
						<td class="position" data-position="112027">차장</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68569"></label></td>
						<td>주알바</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68569)"><u>joo</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">110</td>
						<td class="cell">010-1234-4321</td>
						<td class="const" data-node="39445">재무회계팀</td>
						<td class="position" data-position="112032">계약직</td>
						<td class="active">정상</td>
					</tr>
					<tr class="user_data">
						<td class="userno"><label><input type="checkbox"
								class="user_checkbox" no="68560"></label></td>
						<td>최사장</td>
						<td class="userid"><a href="javascript:void(0);"
							onclick="usermanage.modifyUser(68560)"><u>choi</u></a></td>

						<td class="working_type">일반직</td>
						<td class="phone">101</td>
						<td class="cell">010-2222-2222</td>
						<td class="const" data-node="39443">인사팀</td>
						<td class="position" data-position="112023">사장</td>
						<td class="active">정상</td>
					</tr>
				</tbody>
			</table>
			<div class="listbottom bt0">
				<p class="number" style="left: 0;">
					소속원 수 : <span id="org_count">11</span>명
				</p>
				<div class="paginate">
					<div class="paginate">
						<strong>1</strong>
					</div>
				</div>
			</div>
			<div class="bt_left submit_button">
				<button type="button" onclick="usermanage.saveData();">저장</button>
			</div>
		</div>
	</div>
	<div class="hw-loading" style="display: none;" id="del_loading">
		<div class="img">
			<img src="/static/ui/images/hw-loading.gif" alt="">
		</div>
		<div class="text">
			삭제 중...<span id="del_cur">0</span>/<span id="del_total">0</span>
		</div>
	</div>

	<!-- 사용자 정보 다운로드 -->
	<div class="layer_box large address hide" id="user_info_down"
		style="width: 620px;">
		<div class="title_layer text_variables">사용자 정보 다운로드</div>
		<p>
			사용자 정보 리스트를 엑셀파일(xls)로 다운로드할 수 있습니다.<br> 다운로드할 정보를 선택하세요.<br>
		</p>

		<h4 class="tle_layer_insa1">항목 선택</h4>
		<ul class="cont_insa_c101">
			<li><label><input type="checkbox" value="all"
					id="user_info_down_chkall" checked="checked"
					onclick="usermanage.excelTabCheckAll()"> 전체</label></li>
			<li><label><input type="checkbox" value="mail_id"
					checked="checked" onclick="usermanage.excelTabCheck()"> ID</label></li>
			<li><label><input type="checkbox" value="name"
					checked="checked" onclick="usermanage.excelTabCheck()"> 이름</label></li>
			<li><label><input type="checkbox" value="working_type"
					checked="checked" onclick="usermanage.excelTabCheck()">
					근로형태</label></li>
			<li><label><input type="checkbox" value="phone"
					checked="checked" onclick="usermanage.excelTabCheck()">
					사내전화</label></li>
			<li><label><input type="checkbox" value="cell"
					checked="checked" onclick="usermanage.excelTabCheck()">
					휴대전화</label></li>
			<li><label><input type="checkbox" value="const"
					checked="checked" onclick="usermanage.excelTabCheck()">
					소속조직</label></li>
			<li><label><input type="checkbox" value="position"
					checked="checked" onclick="usermanage.excelTabCheck()"> 직위</label></li>
			<li><label><input type="checkbox" value="job"
					checked="checked" onclick="usermanage.excelTabCheck()"> 직무</label></li>
			<li><label><input type="checkbox" value="userno"
					checked="checked" onclick="usermanage.excelTabCheck()"> 사번</label></li>
			<li><label><input type="checkbox" value="joindate"
					checked="checked" onclick="usermanage.excelTabCheck()"> 입사일</label></li>
			<li><label><input type="checkbox" value="email"
					checked="checked" onclick="usermanage.excelTabCheck()"> 이메일</label></li>
			<li><label><input type="checkbox" value="zipcode"
					checked="checked" onclick="usermanage.excelTabCheck()">
					우편번호</label></li>
			<li><label><input type="checkbox" value="address"
					checked="checked" onclick="usermanage.excelTabCheck()">
					자택주소</label></li>
			<li><label><input type="checkbox" value="birthday"
					checked="checked" onclick="usermanage.excelTabCheck()">
					생년월일</label></li>
			<li><label><input type="checkbox" value="active"
					checked="checked" onclick="usermanage.excelTabCheck()"> 상태</label></li>
		</ul>

		<h4 class="tle_layer_insa2">조직 선택</h4>
		<label> <select title="선택" class="select_insa"
			style="width: 100%;" onclick="usermanage.showNodeList(this, event);"
			id="excel_node_select">
				<option value="ALL">모든 사용자</option>
		</select>
			<div class="dropdown hide" id="excel_node_list" style="width: 100%;">
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
					</div>
				</div>
			</div>
		</label>

		<form id="excelForm" method="post"></form>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="usermanage.excelDownload(event);">다운로드</button>
			<button type="button"
				onclick="jQuery('#user_info_down').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#user_info_down').hidePopup(this);" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- //사용자 정보 다운로드 -->




	<!-- 입력 항목 설정 레이어 -->
	<div class="layer_box large address hide" id="input_item_setting"
		style="width: 565px;">
		<div class="title_layer text_variables">입력 항목 설정</div>

		<p class="gray_02">사용자 목록에 표시되는 항목을 설정합니다.</p>

		<ul class="line24 gr_depth1" style="padding-top: 15px;">
			<li><b>·</b> 근로형태는 필수항목으로, 삭제할 수 없습니다.</li>
		</ul>

		<div class="Clearfix" style="margin-top: 30px;">
			<div class="Fl" style="width: 248px;">
				<strong class="gray_02">전체 항목</strong>
			</div>
			<p class="Fl" style="margin-left: 65px;">
				<strong class="gray_02">입력 항목</strong>
			</p>
		</div>

		<div class="Clearfix cont_insa_b01 v2">
			<div class="list_insa_option v2 Fl">
				<select multiple="multiple" id="tabAllSelector">
					<option value="name">이름</option>
					<option value="mail_id">ID</option>
					<option value="userno">사번</option>
					<option value="working_type">근로형태</option>
					<option value="joindate">입사일</option>
					<option value="const">소속조직</option>
					<option value="position">직위</option>
					<option value="job">직무</option>
					<option value="birthday">생년월일</option>
					<option value="email">이메일</option>
					<option value="phone">사내전화</option>
					<option value="cell">휴대전화</option>
					<option value="zipcode">우편번호</option>
					<option value="address">자택주소</option>

				</select>
			</div>

			<ul class="tree_option_btn v2">
				<li><a class="icon btn_to_right" href="javascript:void(0)"
					onclick="usermanage.tabMove(this);"></a></li>
				<li><a class="icon btn_to_left" href="javascript:void(0)"
					onclick="usermanage.tabMove(this);"></a></li>
			</ul>

			<div class="list_insa_option v2 active Fl">
				<select multiple="multiple" id="curTabSelector">
					<option disabled="disabled" class="off" value="name">이름</option>
					<option disabled="disabled" class="off" value="mail_id">ID</option>
					<option disabled="disabled" class="off" value="working_type">근로형태</option>
					<option value="phone">사내전화</option>
					<option value="cell">휴대전화</option>
					<option value="const">소속조직</option>
					<option value="position">직위</option>
				</select>
			</div>
		</div>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="usermanage.saveTab();">확인</button>
			<button type="button"
				onclick="jQuery('#input_item_setting').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#input_item_setting').hidePopup(this);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
	<!-- //입력 항목 설정 레이어 -->




	<!-- 소속 조직 설정 레이어 -->
	<div class="layer_box middle address hide" id="org_setting">
		<div class="title_layer text_variables">소속 조직 설정</div>

		<label> <select title="선택" class="select_insa"
			style="width: 100%;" id="org_selector"
			onclick="usermanage.modifyOrgListShow(event)">
				<option value="noselect">조직선택</option>
		</select>
			<div class="dropdown hide" id="org_dropdown" style="width: 100%;">
				<div class="dropdown-menu block"
					style="width: 100%; overflow: auto;">
					<div class="filter_orgtree" id="layerNode" style="height: 250px;"></div>
				</div>
			</div>

		</label>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="usermanage.orgLayerOk()">저장</button>
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
				<option value="112022">대표이사</option>
				<option value="112023">사장</option>
				<option value="112024">상무</option>
				<option value="112025">이사</option>
				<option value="112026">부장</option>
				<option value="112027">차장</option>
				<option value="112028">과장</option>
				<option value="112029">대리</option>
				<option value="112030">주임</option>
				<option value="112031">사원</option>
				<option value="112032">계약직</option>
		</select></label>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="usermanage.positionChange();">저장</button>
			<button type="button"
				onclick="jQuery('#position_setting').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#position_setting').hidePopup(this);" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- //직위 선택 레이어 -->


	<!-- 직위 선택 레이어 -->
	<div class="layer_box middle address hide" id="working_type_setting">
		<div class="title_layer text_variables">근로형태 설정</div>

		<label><select title="선택" class="select_insa"
			style="width: 100%;" id="working_type_selector">
				<option value="3670">일반직</option>
				<option value="3672">임원,촉탁</option>
		</select></label>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="usermanage.workingTypeChange();">저장</button>
			<button type="button"
				onclick="jQuery('#working_type_setting').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#working_type_setting').hidePopup(this);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
	<!-- //직위 선택 레이어 -->

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
							type="radio" name="profile_35" value="mail_id" checked="">ID를
							기준으로 등록</label> <label><input class="hw-radio gt-mr-10"
							type="radio" name="profile_35" value="company_num">사번을
							기준으로 등록</label>
					</div>
				</div>
				<div class="gt-d-table">
					<div class="gt-d-table-cell">이미지zip 파일 등록</div>
					<div class="gt-d-table-cell">
						<form id="upload_zip_form" enctype="multipart/form-data"
							method="post">
							<label><input type="text" id="tmp_zip_file"
								disabled="disabled" title="입력하세요." class="textbox_insa"
								style="width: 500px;" placeholder="대상파일을 선택하세요(*.zip)"></label>&nbsp;
							<input type="file" class="hide" name="zip_file" id="zip_file">
							<input type="hidden" name="page_flag" value="add"> <a
								href="javascript:void(0);"
								onclick="usermanage.readProfileZipFile(event);"
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
				onclick="usermanage.profileImageBulkEnrollment()">등록</button>
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

