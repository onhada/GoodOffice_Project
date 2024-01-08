<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>



<div id="contents">
	<div class="setting_title">
		<h3>기본 설정</h3>
	</div>
	<div class="content_inbox approval-admin">
		<!-- Contents -->
		<div class="cont_box">
			<div class="setting_field approval basic-setting">
				<form name="settingBasicFrm" id="formBasicSetting">
					<!-- 보안 등급별 열람 설정 -->
					<div class="cont-tit first after">
						<strong class="fl">보안 등급별 열람 설정</strong>
						<!-- <a href="수정필" class="icon question tipsIcon vm" style="margin-left: 5px">
							<span class="blind">세부 설명</span>
						</a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 460px;">
								<p>A등급과 B등급 문서가 결재 완료된 후 기본 열람할 수 있는 직위 등급을 설정합니다.</p>
								<p>직위 등급은 인사관리에서 설정합니다.</p>
							</div>
						</div> -->
					</div>
					<table class="tableType02">
						<caption>보안 등급별 열람 설정</caption>
						<colgroup>
							<col style="width: 20%">
							<col>
						</colgroup>
						<tbody>


							<c:forEach var="securityVo" items="${requestScope.securityLevelList}">

								<c:if test="${securityVo.securityLevel eq 'S'}">
									<tr>
										<th scope="row">
											<label for="level${securityVo.securityLevel}">${securityVo.securityLevel}등급</label>
										</th>
										<td>기안 상에 설정된 관련자들만 문서 열람</td>
									</tr>
								</c:if>

								<c:if test="${securityVo.securityLevel eq 'A' || securityVo.securityLevel eq 'B'}">
									<tr>
										<th scope="row">
											<label for="level${securityVo.securityLevel}">${securityVo.securityLevel}등급</label>
										</th>
										<td>
											결재 완료 후 직위
											<select id="level${securityVo.securityLevel}" class="level-select" name="security_level_${fn:toLowerCase(securityVo.securityLevel)}">

												<c:forEach var="sdVo" items="${requestScope.securityLevelDetailList}">
													<c:if test="${securityVo.securityLevel eq sdVo.securityLevel}">
														<option value="${sdVo.positionId}" selected>${sdVo.positionId}등급(${sdVo.positionName})</option>
													</c:if>
													<c:if test="${securityVo.securityLevel ne sdVo.securityLevel}">
														<option value="${sdVo.positionId}">${sdVo.positionId}등급(${sdVo.positionName})</option>
													</c:if>


												</c:forEach>
											</select>
											이상 기본 열람
										</td>
									</tr>
								</c:if>
								
								<c:if test="${securityVo.securityLevel eq 'C'}">
									<tr>
										<th scope="row">
											<label for="level${securityVo.securityLevel}">${securityVo.securityLevel}등급</label>
										</th>
										<td>모든 임직원(계약직 포함)이 문서 열람</td>
									</tr>
								</c:if>

							</c:forEach>
						</tbody>
					</table>
					<p class="tablebtm-infotxt">※ S등급과 C등급은 설정할 수 없습니다.</p>


					<div class="bt_left mgt_30">
						<button type="button" id="settingBasicActionSubmitBtn">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	
	
<script type="text/javascript">
$(document).ready(function() {
	 
 	console.log("hi");
 	
	$("button#settingBasicActionSubmitBtn").click(function(){
		
		if(Number($("select[name=security_level_a]").val()) >= Number($("select[name=security_level_b]").val())){
			alert("A등급의 직위가 B등급의 직위보다 낮거나 같을 수 없습니다.")
		}else{
			const pathname = "/" + window.location.pathname.split("/")[1];
			const origin = window.location.origin;
			const contextPath = origin + pathname;

			const frm = document.settingBasicFrm;
			frm.action = contextPath + `/approval/settings/basic.gw`;
			frm.method = "post";
			frm.submit();
		}
		
	})
})

</script>
	
<%-- <script src="<%=ctxPath%>/resources/js/approval/settings_basic.js" type="text/javascript"></script> --%>
</div>
