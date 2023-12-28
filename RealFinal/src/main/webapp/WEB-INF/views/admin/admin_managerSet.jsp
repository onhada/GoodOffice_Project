<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>




<div id="contents">
	<div class="setting_title">
		<h3>관리자 설정</h3>
	</div>
	<div class="content_inbox">
		<div class="cont_box">
			<div class="setting_field office-api--page office-newmanage--page">
				<div class="office-manage-tab gt-tab" id="officeManageTab">
					<div class="office-manage-tab gt-tab" id="officeManageTab">
						<div class="gt-tab-nav gt-mb-30">
							<a
								href="https://office.hiworks.com/gabia.biz/h_admin/Adminconfig/setmanager"
								target="_self" class="gt-nav-item gt-active">전체 관리자</a> <a
								href="https://office.hiworks.com/gabia.biz/insa/manage/insamanager"
								target="_blank" class="gt-nav-item ">인사 관리자</a> <a
								href="https://approval.office.hiworks.com/gabia.biz/approval/settings/manager"
								target="_blank" class="gt-nav-item ">전자결재 관리자</a>
							<!-- <a href="https://sms.office.hiworks.com/gabia.biz/sms/setting/set_admin" target="_blank" class="gt-nav-item ">메시징 관리자</a> -->
							<a
								href="https://booking.office.hiworks.com/gabia.biz/booking/bookingManage/bookingAdmin"
								target="_blank" class="gt-nav-item ">예약 관리자</a>
						</div>
					</div>
					<!-- content -->
					<div id="outline" class="place1">
						<div id="df_container" class="place1">
							<div class="clearDiv"></div>
							<table class="outline_table" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td style="width: 100%; vertical-align: top;">
											<div id="df_content" class="place1">
												<!-- start content -->
												<div id="requestList">
													<table cellspacing="0" cellpadding="0"
														class="basic_info_table">
														<tbody>
															<tr>
																<td>
																	<div id="managerSetting">
																		<div class="setting_content">
																			<h3>이름 / 아이디 검색</h3>
																			<input type="text" id="keyword" class="keyword"
																				onkeydown="setManager.Enter(event);"> <img
																				src="./aaaaaaa_files/btn_sear.gif"
																				style="cursor: pointer; float: left;"
																				onclick="setManager.searchUser();"> <select
																				id="searchList" size="15"
																				ondblclick="setManager.selectAdmin();">
																				<option value="68565#kang">강과장 (kang) -
																					영업2팀</option>
																				<option value="68562#kim">김이사 (kim) - 생산1팀</option>
																				<option value="68561#park">박상무 (park) -
																					구매총무팀</option>
																				<option value="68567#ahn">안주임 (ahn) - 품질관리팀</option>
																				<option value="68566#yang">양대리 (yang) -
																					재무회계팀</option>
																				<option value="68563#oh">오부장 (oh) - 생산2팀</option>
																				<option value="68568#lee">이사원 (lee) - 고객지원팀</option>
																				<option value="68564#jo">조차장 (jo) - 영업1팀</option>
																				<option value="68569#joo">주알바 (joo) - 재무회계팀</option>
																			</select>
																			<p></p>
																		</div>
																		<div id="selectButton">
																			<img src="./aaaaaaa_files/lyr_select_btn.gif"
																				style="margin: 25px 2px 2px 2px; cursor: pointer;"
																				onclick="setManager.selectAdmin();"> <img
																				src="./aaaaaaa_files/lyr_del_btn.gif"
																				style="margin: 2px; cursor: pointer;"
																				onclick="setManager.deleteAdmin();">
																		</div>
																		<div class="setting_content">
																			<h3 class="blue">전체 관리자 (최대 5명)</h3>
																			<select id="managerList" size="3"
																				ondblclick="setManager.deleteAdmin();">
																				<option value="68559#ceo">대표이사 (ceo) -
																					하이웍스산업</option>
																				<option value="68560#choi">최사장 (choi) - 인사팀</option>
																			</select> <img src="./aaaaaaa_files/btn_confirm.gif"
																				style="float: right; margin: 5px 0px; padding: 0px; display: inline; cursor: pointer;"
																				onclick="setManager.saveData();">

																			<table cellspacing="0" cellpadding="0"
																				class="guideTable">
																				<tbody>
																					<tr>
																						<td style="height: 5px; width: 5px;"><img
																							height="5" width="5" class="backimg"
																							src="./aaaaaaa_files/round1_01.gif"></td>
																						<td
																							style="height: 5px; width: auto; background: url(/static/images/common/bg/round1_02.gif) repeat-x left top;"></td>
																						<td style="height: 5px; width: 5px;"><img
																							height="5" width="5" class="backimg"
																							src="./aaaaaaa_files/round1_03.gif"></td>
																					</tr>
																					<tr>
																						<td
																							style="width: 5px; background: url(/static/images/common/bg/round1_08.gif) repeat-y left top;"></td>
																						<td
																							style="background-color: #f9f9f9; width: auto;">
																							<h4>이용안내</h4>
																							<ul class="guide">
																								<li class="guideLi">[선택]버튼으로 사용자를 지정한 후, <span
																									class="orange">[확인] 버튼을 클릭</span>하시기 바랍니다.
																								</li>
																								<li class="guideLi">전체 관리자는 <span
																									class="orange">최대 5명까지</span> 지정할 수 있습니다. (단,
																									최소 1명은 지정되어야 합니다.)
																								</li>
																							</ul>
																						</td>
																						<td
																							style="width: 5px; background: url(/static/images/common/bg/round1_04.gif) repeat-y left top;"></td>
																					</tr>
																					<tr>
																						<td
																							style="height: 5px; width: 5px; background: url(/static/images/common/bg/round1_07.gif) no-repeat left bottom;"></td>
																						<td
																							style="height: 5px; width: auto; background: url(/static/images/common/bg/round1_06.gif) repeat-x left bottom;"></td>
																						<td
																							style="height: 5px; width: 5px; background: url(/static/images/common/bg/round1_05.gif) no-repeat left bottom;"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>

												<!-- end_content -->
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="clearDiv"></div>
						</div>
						<div class="minWidth"></div>
						<div class="clearDiv"></div>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>