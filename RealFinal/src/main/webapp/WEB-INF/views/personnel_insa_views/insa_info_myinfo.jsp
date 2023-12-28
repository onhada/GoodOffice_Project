<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents" style="left: 276px;">
	<!-- insa.office.hiworks.com/hiworks/views/dev/myinfo_admin.php -->
	<div class="setting_title">
		<h3 style="font-size: 22px;">내 정보 관리</h3>
	</div>
	<div class="content_inbox insa-new">
		<div class="cont_box">
			<form name="frmMyinfo" method="post" onsubmit="return false"
				id="frmMyinfo">
				<div class="resourcesInfo_setting">
					<table class="table_insa_gon1">
						<caption>인사정보 설정</caption>
						<colgroup>
							<col style="width: 20px;">
							<col style="width: 180px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th></th>
								<th>이름</th>
								<td><p>대표이사</p></td>
							</tr>
							<tr>
								<th></th>
								<th>소속</th>
								<td>
									<p>하이웍스산업</p>
								</td>
							</tr>
							<tr>
								<th></th>
								<th>근로형태</th>
								<td>일반직</td>
							</tr>
							<tr>
								<th></th>
								<th>직위</th>
								<td>대표이사</td>
							</tr>
							<tr>
								<th></th>
								<th><label for="job">직무</label></th>
								<td><select id="job" name="job">
										<option value="0">선택</option>
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
										<option value="6611" selected="">관리</option>
								</select></td>
							</tr>
							<tr>
								<th></th>
								<th>이메일</th>
								<td><p>ceo@gabia.biz</p></td>
							</tr>
							<tr>
								<th></th>
								<th><label for="phoneNumber">사내 전화</label></th>
								<td><input id="phoneNumber" type="text" name="phone"
									value="100"></td>
							</tr>
							<tr>
								<th></th>
								<th><label for="cellPhone">휴대전화</label></th>
								<td><input id="cellPhone" type="text" name="cell"
									value="010-1111-1111"> <label class="mgl_20"><input
										type="checkbox" id="cell_flag" name="cell_flag" value="Y">
										비공개</label> <a href="javascript:void(0)"
									class="icon question tipsIcon"
									style="float: none; position: relative; top: 3px;"><span
										class="blind">세부 설명</span></a>
									<div class="tooltip hide" style="left: 50px; top: -20px">
										<div class="icon tip_sq" style="left: 240px"></div>
										<div class="tooltip-box" style="width: 440px;">
											비공개로 설정하면, 동료들이 해당 정보를 열람할 수 없습니다.<br>하지만, 소속 조직의 장과
											인사관리자는 비공개 정보도 열람이 가능합니다.<br>
										</div>
									</div></td>
							</tr>
							<tr>
								<th><span class="icon lock"></span></th>
								<th><label for="personalEmail">개인 이메일</label></th>
								<td><input id="personalEmail" type="text" name="email"
									value=""> <label class="mgl_20"><input
										type="checkbox" name="email_flag" checked="checked" value="N">
										비공개</label></td>
							</tr>
							<tr>
								<th><span class="icon lock"></span></th>
								<th>사번</th>
								<td><p class="fl"></p>
									<label class="mgl_20"></label></td>
							</tr>
							<tr>
								<th><span class="icon lock"></span></th>
								<th>입사일</th>
								<td><p class="fl">2012-01-04</p>
									<label class="mgl_20"><input name="joindate_flag"
										value="N" checked="checked" type="checkbox"> 비공개</label></td>
							</tr>
							<tr>
								<th><span class="icon lock"></span></th>
								<th>생년월일</th>
								<td class="birthday"><label><input
										style="width: 70px" type="text" name="birth_year"
										title="년도 입력" value=""> 년</label> <label><input
										style="width: 50px" type="text" name="birth_month"
										title="월 입력" value=""> 월</label> <label><input
										style="width: 50px" type="text" name="birth_day" title="일 입력"
										value=""> 일</label> <input id="gregorian" name="birthday_type"
									type="radio" value="S" checked="checked"><label
									for="gregorian"> 양력</label> <input id="lunar"
									name="birthday_type" type="radio" value="M"><label
									for="lunar"> 음력</label> <label class="mgl_20"><input
										type="checkbox" name="birth_flag" checked="checked" value="N">
										비공개</label></td>
							</tr>
							<tr>
								<th><span class="icon lock"></span></th>
								<th>자택 주소</th>
								<td class="address"><label><input type="text"
										style="width: 70px" name="zipcode1" id="zipcode1" title="우편번호"
										value=""></label>
									<button onclick="myinfo.showfindAddress()">우편번호 검색</button>
									<p>
										<label><input type="text" name="address" id="address"
											style="width: 480px; background: #fff;" title="나머지 주소"
											value=""></label><label class="mgl_20"><input
											name="address_flag" value="N" checked="checked"
											type="checkbox"> 비공개</label>
									</p></td>
							</tr>
							<tr>
								<th><span class="icon lock"></span></th>
								<th><label for="etcInfo">기타 정보</label></th>
								<td><textarea id="etcInfo" name="introduce" rows="5"
										wrap="VIRTUAL" class="box2" style="min-width: 500px"></textarea><label
									class="mgl_20 vt"><input name="intro_flag" value="N"
										checked="checked" type="checkbox" class="vt"> 비공개</label></td>
							</tr>
						</tbody>
					</table>
					<!-- submit button -->
					<div class="bt_left submit_button">
						<button type="button" onclick="myinfo.confirmMyinfo()">저장</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="layer_box large hide popup3"
		style="margin-left: -351px; margin-top: -357.5px;"
		id="mypage_layer_address">
		<div class="title_layer text_variables">우편번호 검색</div>
		<div class="print-item">
			<div class="bold">
				<label class="mgr_20"><input type="radio" name="addressType"
					title="지번주소" onclick="addressInfo.changeAddressType('jibun');"
					checked=""> 지번주소</label> <label><input type="radio"
					name="addressType" title="도로명주소"
					onclick="addressInfo.changeAddressType('road');"> 도로명주소</label>
			</div>
			<table class="cal_table1 bdt mgt_10">
				<caption>주소 검색 목록으로 시도, 시구군, 검색어로 구성되어 있습니다.</caption>
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th>시도</th>
						<td><select name="" id="address_sido" class="w200"
							onchange="addressInfo.getAddressGugun();">
								<option value="">선택</option>
						</select></td>
						<th>시구군</th>
						<td><select name="" id="address_gugun" class="w200"
							onchange="addressInfo.getAddressDong();">
								<option value="">선택</option>
						</select></td>
					</tr>
					<tr class="" id="type_01">
						<th>검색어</th>
						<td colspan="3"><select name="" id="address_dong"
							class="w200">
								<option value="">선택</option>
						</select> + <input type="text" class="w200" id="address_jibun"
							placeholder="지번">
							<button type="button" class="weakblue"
								onclick="addressInfo.searchJibun()">검색</button></td>
					</tr>
					<tr class="hide" id="type_02">
						<th>검색어</th>
						<td colspan="3"><input type="text" class="w200"
							placeholder="도로명" id="address_road"> + <input type="text"
							class="w200" placeholder="건물번호" id="address_build">
							<button type="button" class="weakblue"
								onclick="addressInfo.searchRoad()">검색</button></td>
					</tr>
				</tbody>
			</table>
			<p class="pdt_10">
				검색방법: 시/도 및 시/군/구 선택 후 동(읍/면) + 지번 입력(선택)<br> 예) 역삼동 123 →
				‘서울시’ ‘강남구’ 선택 후 역삼동 + 123
			</p>
			<p class="pdt_10">
				검색방법: 시/도 및 시/군/구 선택 후 도로명 + 건물번호 입력(선택)<br> 예) 테헤란로 123 →
				‘서울시’ ‘강남구’ 선택 후 테헤란로 + 123
			</p>
			<p class="pdt_10 gr_depth1">
				· 지번 주소가 검색되지 않는 경우는 행정안전부 도로명주소&nbsp;<br>안내시스템 (<a
					href="http://www.juso.go.kr" target="_blank">http://www.juso.go.kr</a>)
				에서 확인하시기 바랍니다.
			</p>

			<div class="hide" id="address_detail">
				<p class="pdt_30">아래의 주소 중에서 해당하는 주소를 선택해 주세요.</p>
				<div class="post_scroll mgt_10">
					<table class="tableType01">
						<caption>우편번호 검색 목록으로 우편번호, 주소로 구성되어 있습니다.</caption>
						<colgroup>
							<col width="15%">
							<col width="">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">우편번호</th>
								<th scope="col" colspan="2">주소</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="center">111-111</td>
								<td>서울시 강남구 역삼동 648-23<br> 서울 특별시 강남구 테헤란로 123 (역삼동,
									여삼빌딩)
								</td>
								<td class="ta_r"><button type="button" class="weakblue">선택</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables" onclick="hidePopup();">확인</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
</div>
