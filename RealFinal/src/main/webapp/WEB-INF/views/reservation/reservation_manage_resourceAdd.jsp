<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>






<!-- 해당 jsp는 카테고리 추가, 카테고리 삭제, 자원 추가, 자원 삭제 4가지 모두 사용할 것임. 담당자가 알아서 수정! -->

<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3>자원 추가하기</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field category-add">
			<form id="add_frm" enctype="multipart/form-data" method="post">
				<input type="hidden" name="category_no" value="1982">
				<ul>
					<li>
						<p>자원 이름</p>
						<div>
							<input type="text" name="name" class="input_text w200 required"
								title="자원 이름" value="">
						</div>
					</li>
					<li>
						<p>자원 설명</p>
						<div>
							<textarea name="description" id="" cols="30" rows="10"></textarea>
						</div>
					</li>
					<li>
						<p>사진</p>
						<div class="category-images">
							<div class="after">
								<div class="fl large-img">
									<img src="/static/ui/images/resource/default01.jpeg" alt=""
										id="resource_default_img"> <input type="file"
										name="resource_file" id="resource_file_btn"
										onchange="bookingResourceDetail.setUploadImg();"
										style="width: 0; height: 0;" accept="image/*"> <input
										type="hidden" name="resource_default_file"
										id="resource_file_hidden" value=""> <span
										onclick="$j('#resource_file_btn').click();"></span>
								</div>
								<ul class="fl after">
									<li class="select-button"><a href="javascript:void(0);"
										class="weakblue">사진<br>선택
									</a></li>
									<li><a href="javascript:void(0);"><img
											src="/static/ui/images/resource/default01.jpeg" alt=""
											class="resource_default_img_list" num="default1"></a></li>
									<li><a href="javascript:void(0);"><img
											src="/static/ui/images/resource/default02.jpeg" alt=""
											class="resource_default_img_list" num="default2"></a></li>
									<li><a href="javascript:void(0);"><img
											src="/static/ui/images/resource/default03.jpeg" alt=""
											class="resource_default_img_list" num="default3"></a></li>
									<li><a href="javascript:void(0);"><img
											src="/static/ui/images/resource/default04.jpeg" alt=""
											class="resource_default_img_list" num="default4"></a></li>
									<li><a href="javascript:void(0);"><img
											src="/static/ui/images/resource/default05.jpeg" alt=""
											class="resource_default_img_list" num="default5"></a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="title">
							<span>이용 불가 시간</span> <a href="javascript:void(0)"
								class="icon question tipsIcon"
								style="position: relative; top: 2px; margin-left: 10px"><span
								class="blind">세부 설명</span></a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 이용 불가 시간</p>
									<p>이용을 제한할 시간, 요일, 날짜를 지정합니다. 사내 행사 등 자원 예약이 불가한 시간, 요일,
										날짜를 지정해주세요.</p>
								</div>
							</div>
						</div>
						<div class="text">
							<dl class="after" id="not_available_dl">
								<dt class="disabled-time no_limit_dl" id="no_limit_dt">제한
									없음</dt>
								<dd class="no_limit_dl" id="no_limit_dd">
									<a href="javascript:void(0);" class="weakblue"
										id="set_detail_not_available_btn"
										onclick="bookingResourceDetail.notAvailableLayer();">상세 설정</a>
								</dd>
							</dl>
						</div>
					</li>
					<li>
						<div class="title">
							<span>연속 예약 제한</span> <a href="javascript:void(0)"
								class="icon question tipsIcon"
								style="position: relative; top: 2px; margin-left: 10px"><span
								class="blind">세부 설명</span></a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 연속 예약 제한</p>
									<p>한번에 예약할 수 있는 최대 시간을 설정할 수 있습니다. 특정 사용자가 자원을 장기간 이용하는 것을
										방지할 수 있습니다.</p>
								</div>
							</div>
						</div>
						<div class="text">
							<label for="continuity_limit_yn_N" class="mgr60"> <input
								type="radio" name="continuity_limit_yn" value="N"
								id="continuity_limit_yn_N" checked=""> 제한 없음
							</label> <label for="continuity_limit_yn_Y" class="mgr60"> <input
								type="radio" name="continuity_limit_yn" value="Y"
								id="continuity_limit_yn_Y"> 최대 <input type="text"
								name="continuity_limit" style="width: 50px;" value=""
								disabled=""> 시간 <!-- [D]날짜형은 일 -->
							</label>
						</div>
					</li>
					<li>
						<div class="title">
							<span>신청 기간</span> <a href="javascript:void(0)"
								class="icon question tipsIcon"
								style="position: relative; top: 2px; margin-left: 10px"><span
								class="blind">세부 설명</span></a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 신청 기간</p>
									<p>예약 신청을 할 수 있는 기간을 설정할 수 있습니다. 예) 예약일 기준 1달 전부터 예약 가능</p>
								</div>
							</div>
						</div>
						<div class="text">
							<span class="mgr60" id="period_no_limit_span">제한 없음</span> <a
								href="javascript:void(0);" class="weakblue"
								onclick="bookingResourceDetail.applicationPeriodLayer();">상세
								설정</a>
						</div>
					</li>
					<li>
						<div class="title">승인 여부</div>
						<div class="text">
							<label for="is_confirm_N" class="mgr60"> <input
								type="radio" name="is_confirm" value="N" id="is_confirm_N"
								onclick="bookingResourceAdd.isManagerApproveView(false);"
								checked=""> 바로 예약
							</label> <label for="is_confirm_Y" class="mgr60"> <input
								type="radio" name="is_confirm" value="Y" id="is_confirm_Y"
								onclick="bookingResourceAdd.isManagerApproveView(true);">
								관리자 승인
							</label>
						</div>
					</li>
					<li id="is_alarm_li" class="hide">
						<div class="title">
							<span>알림 설정</span> <a href="javascript:void(0)"
								class="icon question tipsIcon"
								style="position: relative; top: 2px; margin-left: 10px"><span
								class="blind">세부 설명</span></a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 알림 설정</p>
									<p>- 관리자 승인 요청 시 설정한 대상자에게 알림이 제공되며, 알림 방법을 선택할 수 있습니다.</p>
									<p>- 알림 기본 설정은 카테고리 관리의 기본 자원 설정 내역이 출력됩니다.</p>
								</div>
							</div>
						</div>
						<div class="text">
							<label for="is_web_alarm" class="mgr60"> <input
								type="checkbox" name="is_web_alarm" id="is_web_alarm" value="Y"
								checked=""> 웹 알림
							</label> <label for="is_mail_alarm" class="mgr60"> <input
								type="checkbox" name="is_mail_alarm" id="is_mail_alarm"
								value="Y"> 메일 알림
							</label> <a href="javascript:void(0);" class="weakblue"
								onclick="bookingResourceDetail.resourceAlarmUserSettingLayer();">대상자
								설정</a>
						</div>
					</li>
					<li id="is_alarm_user_li" class="hide">
						<div class="title">
							<span>알림 대상자</span>
						</div>
						<div class="text">
							<span>대상자 없음.</span>
						</div>
					</li>
					<li id="is_overlap_li" class="hide">
						<div class="title">중복 예약</div>
						<div class="text">
							<label for="is_overlap_Y" class="mgr60"> <input
								type="radio" name="is_overlap" value="Y" id="is_overlap_Y">
								사용함
							</label> <label for="is_overlap_N" class="mgr60"> <input
								type="radio" name="is_overlap" value="N" id="is_overlap_N"
								checked=""> 사용 안함
							</label>
						</div>
					</li>
					<li>
						<div class="title">반납 여부</div>
						<div class="text">
							<label for="is_return_Y" class="mgr60"> <input
								type="radio" name="is_return" value="Y" id="is_return_Y">
								반납 필수 자원
							</label> <label for="is_return_N" class="mgr60"> <input
								type="radio" name="is_return" value="N" id="is_return_N"
								checked=""> 반납이 필요없는 자원
							</label>
						</div>
					</li>
					<li class="pdb_0">
						<p>사용 여부</p>
						<div>
							<label for="is_use_Y" class="mgr60"> <input type="radio"
								name="is_use" value="Y" id="is_use_Y" class="is_use_radio"
								checked=""> 사용함
							</label> <label for="is_use_N" class="mgr60"> <input type="radio"
								name="is_use" value="N" id="is_use_N" class="is_use_radio">
								사용 안함
							</label>
						</div>
					</li>
				</ul>
				<div class="bt_left">
					<button type="button"
						onclick="bookingResourceAdd.addResource('add');">저장</button>
				</div>
			</form>
		</div>
		<!-- Contents End-->
	</div>
</div>