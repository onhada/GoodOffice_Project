<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3 class="fl" style="font-size: 22px;">구성원 관리</h3>
		<a href="javascript:void(0)" class="icon question tipsIcon"
			style="position: relative; top: 1px; margin-left: 5px;"><span
			class="blind">세부 설명</span></a>
		<div class="tooltip hide"
			style="left: 50px; top: 0px; font-weight: normal;">
			<div class="icon tip_sq" style="left: 45px"></div>
			<div class="tooltip-box">
				구성원을 추가하고 리스트를 정렬하여 저장합니다.<br> 직위순 또는 이름순으로 자동 정렬할 수 있으며, 각 라인
				끝에 마우스를 대고 드래그하여 원하는 곳으로 수동 정렬할 수 있습니다.<br> 저장된 순서는 조직도, 메신저 등에
				반영됩니다.<br>
			</div>
		</div>
	</div>


	<div class="content_inbox insa-new">
		<div class="cont_box">
			<div class="insa_container">

				<div class="pdt_10 pdb_20 cont_hidden fl">
					<div class="fl point_color" style="padding-left: 25px;">
						<div id="checkMenu1" class="fl">
							<label><input type="checkbox" title="선택"
								onchange="orgmember.checkAll(this)">&nbsp;</label> <a
								class="layerShow blue_color" href="javascript:void(0)"><span
								id="orgName" data-nodeid="2261">인사팀</span> <img
								src="/static/ui/images/btn_drop.gif" alt="모두보기"
								class="open_drop mgr_20"></a>
							<div class="dropdown hide" id="filter_orgtree_area"
								style="display: none;">
								<div class="dropdown-menu block"
									style="padding: 0; top: 4px; overflow-y: auto;">
									<!-- 조직도 표현 -->
									<div id="orgtree" class="filter_orgtree"
										style="height: 250px; width: 250px; overflow: auto;"></div>
								</div>
							</div>
						</div>
						<div id="checkMenu2" class="fl blue_color hide"
							style="padding-left: 10px;">
							<span>1</span>&nbsp; &nbsp; <a href="javascript:void(0)"
								class="blue_color" onclick="orgmember.memberMove()">부서 이동</a>
							&nbsp; &nbsp; <a href="javascript:void(0)" class="blue_color"
								onclick="orgmember.setAdmin('ADD', 'N')" id="set_constadmin_btn">조직장
								설정</a> <a href="javascript:void(0)" style="display: none;"
								class="blue_color" onclick="orgmember.setAdmin('DELETE', 'N')"
								id="clear_constadmin_btn">조직장 해제</a> &nbsp; &nbsp; <a
								href="javascript:void(0)" class="blue_color"
								onclick="orgmember.removeMember()">소속제외</a>
						</div>
					</div>
				</div>

				<div class="pdt_10 fr">
					<a class="icon order layerShow" href="javascript:void(0);"
						title="정렬"><span class="blind">정렬</span></a>
					<div class="dropdown hide" style="display: none;">
						<ul class="dropdown-menu block" style="left: -106px">
							<li id="order_position"><a href="javascript:void(0)"
								onclick="orgmember.setOrdering('position')">직위순 저장</a></li>
							<li id="order_name"><a href="javascript:void(0)"
								onclick="orgmember.setOrdering('name')">이름순 저장</a></li>
						</ul>
					</div>
				</div>

				<!-- 검색 -->
				<div class="insa_search fos2">
					<a href="javascript:void(0)" class="search_bt blue_color fl hide"
						style="margin: 0px 10px 0 0;"
						onclick="orgmember.cancelUserSearch();" id="cancel_search"> <span
						class="sp_menu searchCancel"></span>검색 취소
					</a>
					<div class="search fr">
						<fieldset>
							<input type="text" id="txtSearch" autocomplete="off"
								maxlength="30" name="txtSearch" value="" placeholder="이름, ID 검색">
							<span class="btn_search"><span class="icon src"
								onclick="orgmember.searchMember(event)"><em class="blind">검색</em></span></span>
						</fieldset>
					</div>
				</div>
				<!-- //검색 -->


				<table class="tableType01 gon">
					<caption>구성원 관리 표</caption>
					<colgroup>
						<col style="width: 62px;">
						<col style="width: 250px;">
						<col style="width: 160px;">
						<col style="width: 160px;">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">이름</th>
							<th scope="col">ID</th>
							<th scope="col">직위</th>
							<th></th>
						</tr>
					</thead>
				</table>
				<!-- 구성원 추가 -->
				<div class="gu_chuga">
					<label>구성원 추가 &nbsp; <input type="text" id="memSearch"
						class="box_gon1 ui-autocomplete-input" style="width: 140px;"
						placeholder="이름 입력" autocomplete="off"></label> <a
						class="spr_insa btn_insa_plus" href="javascript:void(0)"
						onclick="orgmember.memberAddLayer();">추가</a>
				</div>
				<!-- 구성원 리스트, 하위조직 리스트 -->
				<div id="memberList">
					<table id="dragMoveTableRow" class="tableType01 gon"
						style="border-top: none; border-bottom: none;">
						<colgroup>
							<col style="width: 62px;">
							<col style="width: 250px;">
							<col style="width: 160px;">
							<col style="width: 160px;">
							<col>
						</colgroup>
						<tbody>
							<tr id="row-1" no="2813" style="cursor: move;">
								<td class="center"><label><input data-row-no="1"
										type="checkbox" value="2813"
										onchange="orgmember.memberChk(this)"></label></td>
								<td class="left"><span>최사장</span></td>
								<td>choi</td>
								<td>사장</td>
								<td class="last_space"><span class="move_list"></span></td>
							</tr>
						</tbody>
					</table>


					<ul class="gu_sub_org">
					</ul>
				</div>

				<div class="bt_left submit_button">
					<button type="button" style="width: 130px;"
						onclick="location.href='/gabia.biz/insa/manage/orgmanage'">조직도로
						이동</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 구성원 추가 레이어 -->
	<div class="layer_box large address hide" id="member_add"
		style="width: 565px;">
		<div class="title_layer text_variables">구성원 추가</div>

		<div class="Clearfix">
			<div class="Fl" style="width: 242px;">
				<input type="text" class="search_box2" id="memberLayerSearchTxt"
					style="width: 208px;" placeholder="이름 검색"
					onkeydown="orgmember.memberAddLayerSearchTxt(event, this)"><a
					href="javascript:void(0)" class="btn_search2"
					onclick="orgmember.memberAddLayerSearchBtn()"></a>
			</div>
		</div>

		<div class="Clearfix cont_insa_b01">
			<div class="filter_orgtree list_insa_option" id="ot_member_add"
				style="padding-left: 10px; width: 238px; overflow: auto; height: 437px;"></div>

			<ul class="tree_option_btn">
				<li><a class="icon btn_to_right" href="javascript:void(0)"
					onclick="orgmember.memberAddRightBtn();"></a></li>
				<li><a class="icon btn_to_left" href="javascript:void(0)"
					onclick="orgmember.memberAddLeftBtn();"></a></li>
			</ul>

			<div class="list_insa_option Fl">
				<select multiple="multiple" name="" id="select_member"></select>
			</div>
		</div>

		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="orgmember.memberAddOkBtn()">확인</button>
			<button type="button" onclick="orgmember.closeOrgMemberLayer()">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="orgmember.closeOrgMemberLayer()" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- //구성원 추가 레이어 -->

	<!-- 부서이동 레이어 -->
	<div class="layer_box large address hide" id="member_move_layer"
		style="width: 565px;">
		<div class="title_layer text_variables">소속 조직 설정</div>

		<div class="Clearfix cont_insa_b01">
			<div class="filter_orgtree list_insa_option"
				style="padding-left: 10px; width: 238px; height: 437px; overflow: auto;"
				id="layerOrgMove">
				<ul id="organization-nodes-root" class="hw-org-branch root">
					<li class="organization-nodes" no="2256">
						<div class="container">
							<strong class="js-org-selected-node">하이웍스산업</strong> <span
								style="color: silver; font-size: 8pt;">(11)</span> <img
								src="/static/ui/images/icon_minus.png" class="js-org-folding">
						</div>
						<ul class="js-node-area hw-org-branch" style="display: block;">
							<li class="organization-nodes" no="2258">
								<div class="container">
									<strong class="js-org-selected-node">관리부</strong> <span
										style="color: silver; font-size: 8pt;">(4)</span> <img
										src="/static/ui/images/icon_plus.png" class="js-org-folding">
								</div>
								<ul class="js-node-area hw-org-branch" style="display: none;">
									<li class="organization-nodes" no="2261">
										<div class="container">
											<strong class="js-org-selected-node">인사팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
									<li class="organization-nodes" no="2262">
										<div class="container">
											<strong class="js-org-selected-node">구매총무팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
									<li class="organization-nodes" no="2263">
										<div class="container">
											<strong class="js-org-selected-node">재무회계팀</strong> <span
												style="color: silver; font-size: 8pt;">(2)</span>
										</div>
									</li>
								</ul>
							</li>
							<li class="organization-nodes" no="2259">
								<div class="container">
									<strong class="js-org-selected-node">생산부</strong> <span
										style="color: silver; font-size: 8pt;">(3)</span> <img
										src="/static/ui/images/icon_plus.png" class="js-org-folding">
								</div>
								<ul class="js-node-area hw-org-branch" style="display: none;">
									<li class="organization-nodes" no="2264">
										<div class="container">
											<strong class="js-org-selected-node">생산1팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
									<li class="organization-nodes" no="2265">
										<div class="container">
											<strong class="js-org-selected-node">생산2팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
									<li class="organization-nodes" no="2266">
										<div class="container">
											<strong class="js-org-selected-node">품질관리팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
								</ul>
							</li>
							<li class="organization-nodes" no="2260">
								<div class="container">
									<strong class="js-org-selected-node">영업부</strong> <span
										style="color: silver; font-size: 8pt;">(3)</span> <img
										src="/static/ui/images/icon_plus.png" class="js-org-folding">
								</div>
								<ul class="js-node-area hw-org-branch" style="display: none;">
									<li class="organization-nodes" no="2267">
										<div class="container">
											<strong class="js-org-selected-node">영업1팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
									<li class="organization-nodes" no="2268">
										<div class="container">
											<strong class="js-org-selected-node">영업2팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
									<li class="organization-nodes" no="2269">
										<div class="container">
											<strong class="js-org-selected-node">고객지원팀</strong> <span
												style="color: silver; font-size: 8pt;">(1)</span>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
			</div>

			<ul class="tree_option_btn">
				<li><a class="icon btn_to_right" href="javascript:void(0)"
					onclick="orgmember.orgLayerRightBtn();"></a></li>
				<li><a class="icon btn_to_left" href="javascript:void(0)"
					onclick="orgmember.orgLayerLeftBtn()"></a></li>
			</ul>

			<div class="list_insa_option Fl">
				<select multiple="multiple" id="layer_org_select"></select>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="orgmember.orgLayerOk()">확인</button>
			<button type="button"
				onclick="jQuery('#member_move_layer').hidePopup(this);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="jQuery('#member_move_layer').hidePopup(this);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
</div>
