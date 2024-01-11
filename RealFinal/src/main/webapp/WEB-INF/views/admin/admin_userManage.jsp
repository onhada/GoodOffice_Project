<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>



<style>
.documentListPagination {
	display: table;
	margin: auto;
}

.label {
	border: 0px;
}

.name[data-v-4f2a5c28] {
	width: 170px;
	min-width: 170px;
	max-width: 170px;
}

.user_id[data-v-4f2a5c28] {
	width: 170px;
	min-width: 170px;
	max-width: 170px;
}

.pwd[data-v-4f2a5c28] {
	width: 170px;
	min-width: 170px;
	max-width: 170px;
}

.working_type[data-v-4f2a5c28] {
	width: 270px;
	min-width: 270px;
	max-width: 270px;
}

.const[data-v-4f2a5c28] {
	width: 300px;
	min-width: 300px;
	max-width: 300px;
}

.position[data-v-4f2a5c28] {
	width: 270px;
	min-width: 270px;
	max-width: 270px;
}
</style>
<link href="<%=ctxPath%>/resources/css/admin/NewFile.css" rel="stylesheet">






<script type="text/javascript">
	$(document).ready(function() {
		/* $("p.teamChoice").click(function() {
			// 조직 선택을 클릭하였을 경우
			if ($("p.teamChoice i").hasClass("is-reverse-icon")) {
				// 아직 조직 리스트가 안보여져 있는 상황이므로 보여줘야함

				$("p.teamChoice i").removeClass("is-reverse-icon");
			} else {
				// 조직 리스트가 보여져 있는 상황이므로 안보이게 가려야함

				$("p.teamChoice i").addClass("is-reverse-icon");
			}
		}) */

		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		$("td.working_type").click(function() {
			// 근무 형태를 클릭하였을 경우
			if ($("td.working_type i").hasClass("is-reverse-icon")) {
				// 아직 근무 형태 리스트가 안보여져 있는 상황이므로 보여줘야함

				$("div.workingTypeList").show();
				$("td.working_type i").removeClass("is-reverse-icon");
			} else {
				// 근무 형태 리스트가 보여져 있는 상황이므로 안보이게 가려야함

				$("div.workingTypeList").hide();
				$("td.working_type i").addClass("is-reverse-icon");
			}
		})
		
		
		$("td.const").click(function() {
			// 조직 클릭하였을 경우
			if ($("td.const i").hasClass("is-reverse-icon")) {
				// 아직 조직 리스트가 안보여져 있는 상황이므로 보여줘야함

				$("div.teamDropDown").show();
				$("td.const i").removeClass("is-reverse-icon");
			} else {
				// 조직 리스트가 보여져 있는 상황이므로 안보이게 가려야함

				$("div.teamDropDown").hide();
				$("td.const i").addClass("is-reverse-icon");
			}
		})
		
		
		$("td.position").click(function() {
			// 직위를 클릭하였을 경우
			if ($("td.position i").hasClass("is-reverse-icon")) {
				// 아직 직위 리스트가 안보여져 있는 상황이므로 보여줘야함

				$("div.positionDropDown").show();
				$("td.position i").removeClass("is-reverse-icon");
			} else {
				// 직위 리스트가 보여져 있는 상황이므로 안보이게 가려야함

				$("div.positionDropDown").hide();
				$("td.position i").addClass("is-reverse-icon");
			}
		})
		
		
		
		//////////////////////////////////////////////////////////////////////////////////////////
		$("ul.workTypeUl li").each(function(){
			
			$(this).click(function(){
				// 근로 형태 드롭다운 리스트에서 선택했을 경우
				$("input.inputWorkType").val($(this).find("span").text());
				$("input.inputWorkType").attr('id',$(this).find("span").attr('id'));
				
				//selected 변경
				$("ul.workTypeUl li").each(function(){
					//selected 지우기
					
					if($(this).hasClass("selected")){
						$(this).removeClass("selected");
						return false;
					}
				})
				
				// 선택한 애에 selected값 부여
				$(this).addClass("selected");
				
				$("div.workingTypeList").hide();
				$("td.working_type i").addClass("is-reverse-icon");
			})
			
		})
		
		$("div.teamName").each(function(){
			
			$(this).click(function(){
				// 조직 드롭다운 리스트에서 선택했을 경우
				$("span.teamChoice").html($(this).find("span").text());
				$("span.teamChoice").attr('id', $(this).find("span").attr('id'));
				$("span.teamChoice").removeClass("none-select");
				
				$("div.teamDropDown").hide();
				$("td.const i").addClass("is-reverse-icon");
			})
			
		})
		
		
		
		
		$("ul.positionUl li").each(function(){
			
			$(this).click(function(){
				// 직위 드롭다운 리스트에서 선택했을 경우
				$("input.inputPosition").val($(this).find("span").text());
				$("input.inputPosition").attr('id', $(this).find("span").attr('id'));
				
				
				
				//selected 변경
				$("ul.positionUl li").each(function(){
					//selected 지우기
					
					if($(this).hasClass("selected")){
						$(this).removeClass("selected");
						return false;
					}
				})
				
				// 선택한 애에 selected값 부여
				$(this).addClass("selected");
				
				$("div.positionDropDown").hide();
				$("td.position i").addClass("is-reverse-icon");
			})
			
		})
		
		// 아이디가 영어로 입력되도록
		$("input.inputId").keyup(function() {
			$(this).val($(this).val().replace(/[^a-zA-Z0-9]/g, ''));
		});
		
		
		
		
		 $("input.search-input").keyup(function(key){
			if(key.keyCode == 13) {
				if($("input.search-input").val().trim() != ""){
					// 검색한다
					$(location).attr('href','?searchWord='+ $("input.search-input").val().trim());
				}else{
					alert("검색어를 입력하세요.")
				}
			}     
		});
		
		
		$("button.search-reset-btn").click(function(){
			$(location).attr('href', window.location.origin + window.location.pathname);
		})
		
		
		
		
		
		
		
		
		
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 체크박스 체크 이벤트
		
		$("input.checkAll").change(function(){
       	 if($("input.checkAll").is(":checked")){
        	// 전체 선택
        	$("input.checkAll").parent("div.hu-checkbox").addClass("checked");
        	
        	$("input.checkUser").each(function(){
        		
        		$(this).parent("div.hu-checkbox").addClass("checked");
        		
        		$(this).prop("checked", true);
        		
   				$("span.count-span").html($("input:checkbox[name='checkUser']:checked").length);
   				$("div.afterCheck").show();
        		
        	})
        	
        }else{
        	// 전체 선택 해제
        	$("input.checkAll").parent("div.hu-checkbox").removeClass("checked");
        	
        	$("input.checkUser").each(function(){
        		$(this).parent("div.hu-checkbox").removeClass("checked");
        		$(this).prop("checked", false);
        		
        		$("div.afterCheck").hide();
        		
        	})
        }
	 });
	
	
	
	$("input.checkUser").each(function(){
		$(this).change(function(){
			$(this).parent("div.hu-checkbox").toggleClass("checked");
			
			var total = $("input[name=checkUser]").length;
			var checked = $("input[name=checkUser]:checked").length;

			if(total != checked){
				$("input.checkAll").prop("checked", false);
				$("input.checkAll").parent("div.hu-checkbox").removeClass("checked");
				
			}else {
				$("input.checkAll").prop("checked", true); 
				$("input.checkAll").parent("div.hu-checkbox").addClass("checked");
			}
			
			// 체크된 갯수
			if(checked > 0){
				
				$("span.count-span").html($("input:checkbox[name='checkUser']:checked").length);
				$("div.afterCheck").show();
				
			}else{
				$("div.afterCheck").hide();
			}
			
			
		})
		
		
	})
	
	
	
	
	//////////////////////////////////////////////////////////////////////////
	// 일괄 근로형태 수정 클릭시 모달에 나옴
	$("div.modifyInputWorkTypeSetting").click(function(){
		$("div.modifyInputWorkTypeDropDown").toggle();
	})
	
	$("ul.modifyInputWorkTypeDropDownUl li").each(function(){
		$(this).click(function(){
			// 근로형태 수정 모달_ 근로형태 드롭다운 리스트에서 선택했을 경우
			$("input.modifyInputWorkType").val($(this).find("span").text());
			$("input.modifyInputWorkType").attr('id', $(this).find("span").attr('id'));
			
			
			
			//selected 변경
			$("ul.modifyInputWorkTypeDropDownUl li").each(function(){
				//selected 지우기
				
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					/* return false; */
				}
			})
			
			// 선택한 애에 selected값 부여
			$(this).addClass("selected");
			
			$("div.modifyInputWorkTypeDropDown").toggle();
			
			$("div.showModifyWorkType i").addClass("is-reverse-icon");
			
		})
		
	})
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	// 일괄 직위 수정 클릭시 모달에 나옴
	$("div.modifyInputPositionSetting").click(function(){
		$("div.modifyInputPositionDropDown").toggle();
	})
	
	$("ul.modifyInputPositionDropDownUl li").each(function(){
		$(this).click(function(){
			// 근로형태 수정 모달_ 근로형태 드롭다운 리스트에서 선택했을 경우
			$("input.modifyInputPosition").val($(this).find("span").text());
			$("input.modifyInputPosition").attr('id', $(this).find("span").attr('id'));
			
			
			
			//selected 변경
			$("ul.modifyInputPositionDropDownUl li").each(function(){
				//selected 지우기
				
				if($(this).hasClass("selected")){
					$(this).removeClass("selected");
					/* return false; */
				}
			})
			
			// 선택한 애에 selected값 부여
			$(this).addClass("selected");
			
			$("div.modifyInputPositionDropDown").toggle();
			
			$("div.showModifyPosition i").addClass("is-reverse-icon");
			
		})
		
	})
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	// 일괄 상태 수정 클릭시 모달에 나옴
	$("div.selectRadio").each(function(){
		$(this).click(function(){
			
			$("div.selectRadio").each(function(){
				// 선택되어있는 걸 지운다
				$(this).find("div.hu-radio").removeClass("selected")
			})
		
			$(this).find("div.hu-radio").addClass("selected")
			
		})
	})
	
	
	
	
	
		
		
	

	})// end of document.ready ----------------------------------------------------------------
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
	// 일괄 근로형태 수정 확인 눌렀을 경우
	function batchModifyWorkType(){
		let workType = $("input.modifyInputWorkType").attr('id');
		$("input[name='empType']").val(workType);
		
		// 폼(form)을 전송(submit)
		const frm = document.checkFrm;
		frm.method = "post";
		frm.action = "<%= ctxPath%>/admin/batch/workType.gw";
		frm.submit();
	}
	
	
	
	// 일괄 직위 수정 확인 눌렀을 경우
	function batchModifyPosition(){
		let positionId = $("input.modifyInputPosition").attr('id');
		$("input[name='positionId']").val(positionId);
		
		// 폼(form)을 전송(submit)
		const frm = document.checkFrm;
		frm.method = "post";
		frm.action = "<%= ctxPath%>/admin/batch/position.gw";
		frm.submit();
	}
	
	
	// 일괄 상태 수정 확인 눌렀을 경우
	function batchModifyStatus(){
		let status = $("input[name='modifyStatus']:checked").val();
		$("input[name='userStatus']").val(status);
		
		// 폼(form)을 전송(submit)
		const frm = document.checkFrm;
		frm.method = "post";
		frm.action = "<%= ctxPath%>/admin/batch/status.gw";
		frm.submit();
	}
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////
	// 입력 검사
	function checkInput(){
		let isCheck = true;
		
		if($("input.inputName").val().trim() == ""){
			// 공백일 경우
			isCheck = false;
			alert("이름을 입력하여주세요.")
			$("input.inputName").val('')
			return isCheck;
		}
		
		if($("input.inputId").val().trim() == ""){
			// 공백일 경우
			isCheck = false;
			alert("아이디를 입력하여주세요.")
			$("input.inputId").val('')
			return isCheck;
		}else{
			// 공백이 아닐 경우 id가 db에 겹치는지 확인
			
			$.ajax({
				url: "<%=ctxPath%>/approval/isExistId.gw",
				data: { "id": $("input.inputId").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					if(text.isExist){
						// 존재할 경우
						isCheck = false;
						alert("이미 존재하는 아이디입니다. 재입력해주세요.")
						$("input.inputId").val('')
						return isCheck;
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
			
		}
		
		
		let pw = $("input.inputPwd").val();
		let number = pw.search(/[0-9]/g);
        let english = pw.search(/[a-z]/ig);
        let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
        let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

        if (pw.length < 8 || pw.length > 20) {
            alert("8자리 ~ 20자리 이내로 입력해주세요.");
            $("input.inputPwd").val('')
            isCheck = false;
            return isCheck;
            
        } else if (pw.search(/\s/) != -1) {
            alert("비밀번호는 공백 없이 입력해주세요.");
            $("input.inputPwd").val('')
            isCheck = false;
            return isCheck;
            
        } else if (number < 0 || english < 0 || spece < 0) {
            alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
            $("input.inputPwd").val('')
            isCheck = false;
            return isCheck;
        } 
        
        
        if($("input.inputWorkType").val().trim() == ""){
			// 근로 형태 선택하지 않았을 경우
			isCheck = false;
			alert("근로 형태를 선택하여주세요.")
			return isCheck;
		}
        
        if($("span.teamChoice").hasClass("none-select")){
        	// 조직 선택 하지 않았을 경우
        	isCheck = false;
        	alert("조직을 선택하여주세요.")
        	return isCheck;
        }
        
        if($("input.inputPosition").val().trim() == ""){
			// 직위 선택하지 않았을 경우
			isCheck = false;
			alert("직위를 선택하여주세요.")
			return isCheck;
		}
        
        if(isCheck){
        	// 유효성검사 통과했을 경우
        	insertUser();
        	
        }
	}
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// 유저 저장
	
	function insertUser(){
		
		$.ajax({
			url: "<%=ctxPath%>/admin/insertUser.gw",
			data: { "id": $("input.inputId").val().trim(),
					"empName" : $("input.inputName").val().trim(),
					"pwd" : $("input.inputPwd").val(),
					"empType": $("input.inputWorkType").attr('id'),
					"fk_teamId" : $("span.teamChoice").attr('id'),
					"fk_positionId" : $("input.inputPosition").attr('id')
			},
			type: "post",
			async: true,
			dataType: "json",
			success: function(text) {
				if(text.isAdd){
					location.reload();
				}
			},
			error: function(request, status, error) {
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
		});
	}
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////
	// 일괄 수정
	function showModifyWorkTypeModal(){
		$("div.showModifyWorkType").show();
	}
	
	function showModifyPositionModal(){
		$("div.showModifyPosition").show();
	}
	
	function showModifyStatusModal(){
		$("div.showModifyStatus").show();
	}
	
</script>




<div id="router_split_item" class="split-item right" style="width: calc(100% - 234px); overflow: hidden;">
	<div id="contents" class="contents-wrap">
		<div data-v-1f83c670="" class="accounts">
			<div data-v-1f83c670="" class="topper">
				<h1 data-v-1f83c670="" class="accounts__header">사용자 관리</h1>
				<section data-v-1f83c670="" class="accounts__dashboard">
					<div data-v-1f83c670="" class="left">
						<div data-v-6f2e11ef="" data-v-1f83c670="" class="dashboard">
							<div data-v-6f2e11ef="" class="dashboard__contents">
								<div data-v-6f2e11ef="" class="dashboard__contents--name">사용자</div>
								<div data-v-6f2e11ef="" class="dashboard__contents--info">
									<span data-v-1f83c670="" data-v-6f2e11ef="" class="mr-2">${requestScope.totalCount}명 </span>
									<!-- <span data-v-1f83c670="" data-v-6f2e11ef="" class="non-emphasize"> (사용: 6 / 일시정지: 0)</span> -->
								</div>
							</div>
						</div>
						<!-- <div data-v-6f2e11ef="" data-v-1f83c670="" class="dashboard">
							<div data-v-6f2e11ef="" class="dashboard__contents">
								<div data-v-6f2e11ef="" class="dashboard__contents--name">서비스 이용 계정</div>
								<div data-v-6f2e11ef="" class="dashboard__contents--info">
									<div data-v-1f83c670="" data-v-6f2e11ef="" class="mr-40">
										<span data-v-1f83c670="" data-v-6f2e11ef="" class="mr-12">근무관리</span>
										<span data-v-1f83c670="" data-v-6f2e11ef="" class="">6</span>
										<span data-v-1f83c670="" data-v-6f2e11ef="" class="mv-2 mh-0">/</span>
										<span data-v-1f83c670="" data-v-6f2e11ef="">49</span>
									</div>
								</div>
							</div>
						</div> -->
					</div>
					<div data-v-1f83c670="" class="right">

						<!-- 수정필 민경 언니 -->
						<a data-v-1f83c670="" href="수정필">
							<object data-v-1f83c670="" type="image/svg+xml" data="/svg/blue/chart-hr(s).svg" alt="icon"></object>
							<span data-v-1f83c670=""> 조직관리 </span>
						</a>
						<div data-v-1f83c670="" class="divider"></div>
						<a data-v-1f83c670="" href="수정필">
							<object data-v-1f83c670="" type="image/svg+xml" data="/svg/blue/hr-card(s).svg" alt="icon"></object>
							<span data-v-1f83c670=""> 직위/직무관리 </span>
						</a>
					</div>
				</section>
				<section data-v-1f83c670="" class="accounts__buttons">
					<!-- <a data-v-1f83c670="" href="/accounts/add_user" class="">
						<button data-v-1434033c="" data-v-1f83c670="" type="button" class="hu-button">
							
							<span data-v-1434033c="" class="label">사용자 등록</span>
							
						</button>
					</a>
					<a data-v-1f83c670="" href="/accounts/user_regist_batch_form" class="">
						<button data-v-1434033c="" data-v-1f83c670="" type="button" class="hu-button">
							
							<span data-v-1434033c="" class="label">일괄 등록</span>
							
						</button>
					</a>
					<a data-v-1f83c670="" href="/accounts/user_modify_batch_form" class="">
						<button data-v-1434033c="" data-v-1f83c670="" type="button" class="hu-button">
							
							<span data-v-1434033c="" class="label">일괄 수정</span>
							
						</button>
					</a>
					<div data-v-1f83c670="" class="divider"></div>
					<a data-v-1f83c670="" href="/deactivation" class="">
						<button data-v-1434033c="" data-v-1f83c670="" type="button" class="hu-button">
							
							<span data-v-1434033c="" class="label">비활성사용자</span>
							
						</button>
					</a> -->
				</section>
			</div>
			<section data-v-1f83c670="" class="accounts__list">
				<div data-v-5c8be384="" data-v-1f83c670="" class="accounts-list">
					<div data-v-3fb3a1b8="" data-v-5c8be384="" class="accounts-list-header">
						
						
						
						<div data-v-3fb3a1b8="" class="accounts-list-header__left">

							<div data-v-3fb3a1b8="" class="console-buttons afterCheck" style="display:none">
								<span data-v-3fb3a1b8="" class="count-span mr-30"></span>
								<button data-v-1434033c="" data-v-3fb3a1b8=""  onclick="showModifyWorkTypeModal()" type="button" class="hu-button mr-30 text">
									<!---->
									<span data-v-1434033c="" class="label">근로형태 수정</span>
									<!---->
								</button>
								<button data-v-1434033c="" data-v-3fb3a1b8="" onclick="showModifyPositionModal()" type="button" class="hu-button mr-30 text">
									<!---->
									<span data-v-1434033c="" class="label">직위 수정</span>
									<!---->
								</button>
								<!---->
								<button data-v-1434033c="" data-v-3fb3a1b8="" onclick="showModifyStatusModal()" type="button" class="hu-button mr-30 text">
									<!---->
									<span data-v-1434033c="" class="label">상태 수정</span>
									<!---->
								</button>
							</div>
						</div>

						<div data-v-3fb3a1b8="" class="accounts-list-header__right">
							<!---->
							<c:if test="${not empty requestScope.searchWord}">
								<button data-v-3fb3a1b8="" type="button" class="search-reset-btn">
									<i data-v-3fb3a1b8="" class="gis gi-redo"></i> 검색 취소
								</button>
							</c:if>
							<div data-v-3fb3a1b8="" class="search-area">
								<article data-v-788c42fd="" data-v-3fb3a1b8="" class="autocomplete-wrap">
									<div data-v-788c42fd="" class="input-box use-prefix-icon">
										<div data-v-788c42fd="" type="button" class="prefix-icon">
											<i data-v-788c42fd="" class="fal fa-search"></i>
										</div>
										<input data-v-788c42fd="" type="text" placeholder="이름, ID 검색" value="${requestScope.searchWord}" class="search-input">
										<!---->
									</div>
									<div data-v-788c42fd="" class="list-box" style="display: none;">
										<div data-v-788c42fd="" class="search-list" style="max-height: 200px;">
											<div data-v-788c42fd="" class="search-list-item-wrapper"></div>
											<div data-v-788c42fd="" class="detail-search-list">상세 검색</div>
										</div>
									</div>
								</article>
							</div>
							<!-- <button data-v-5a097b0d="" data-v-3fb3a1b8="" type="button" class="download-button-wrapper">
								<img data-v-5a097b0d="" src="https://static.hiworks.com/hr/svg/xls.svg" alt="Do Download Excel">
							</button>
							<button data-v-5a097b0d="" data-v-3fb3a1b8="" type="button">
								<img data-v-5a097b0d="" src="https://static.hiworks.com/hr/svg/icon_cog.svg" alt="Do Setting">
							</button> -->
						</div>
					</div>
					<section data-v-5c8be384="">
						<div data-v-4f2a5c28="" data-v-5c8be384="" class="accounts-table" lastselectedaccountindex="0" style="height: calc(100vh - 397px);">
							<table data-v-4f2a5c28="" class="account-header">
								<colgroup data-v-4f2a5c28="">
									<col data-v-4f2a5c28="" class="checkbox">
									<col data-v-4f2a5c28="" class="name">
									<col data-v-4f2a5c28="" class="user_id">
									<col data-v-4f2a5c28="" class="pwd">
									<!-- <col data-v-4f2a5c28="" class="license" style="min-width: 130px;"> -->
									<col data-v-4f2a5c28="" class="working_type" style="min-width: 130px;">
									<col data-v-4f2a5c28="" class="const">
									<col data-v-4f2a5c28="" class="position">
									<col data-v-4f2a5c28="" class="status">
								</colgroup>
								<thead data-v-4f2a5c28="">
									<tr data-v-4f2a5c28="" class="table-header">
										<th data-v-4f2a5c28="" class="checkbox">
											<label data-v-5eae55e0="" data-v-4f2a5c28="" class="hu-checkbox-wrapper">
												<div data-v-5eae55e0="" class="hu-checkbox">
													<span data-v-5eae55e0="" class="checkbox-input"></span>
													<input data-v-5eae55e0="" type="checkbox" class="checkbox-original checkAll">
													<span data-v-5eae55e0="" class="title"></span>
												</div>
											</label>
										</th>
										<th data-v-4f2a5c28="" class="account-table-header-item name">
											<button data-v-4f2a5c28="" type="button" class="icon-button" style="cursor: pointer;">
												<span data-v-4f2a5c28="">이름</span>


												<%-- <c:if test="${empty requestScope.orderType || requestScope.orderType eq 'desc'}">
													<span data-v-4f2a5c28="" class="icon-wrapper ml-4 nameIcon">
														<object data-v-4f2a5c28="" data="https://static.hiworks.com/icon/caret-down.svg" class="icon rotate"></object>
													</span>
												</c:if>
												<c:if test="${not empty requestScope.orderType && requestScope.orderType eq 'asc'}">
													<span data-v-4f2a5c28="" class="icon-wrapper ml-4 nameIcon">
														<object data-v-4f2a5c28="" data="https://static.hiworks.com/icon/caret-down.svg" class="icon"></object>
													</span>
												</c:if> --%>



											</button>
										</th>
										<th data-v-4f2a5c28="" class="account-table-header-item user_id">
											<button data-v-4f2a5c28="" type="button" class="icon-button" style="cursor: pointer;">
												<span data-v-4f2a5c28="">ID</span>




												<!-- <span data-v-4f2a5c28="" class="icon-wrapper ml-4">
													<object data-v-4f2a5c28="" data="https://static.hiworks.com/icon/caret-down.svg" class="icon off"></object>
												</span> -->
											</button>
										</th>
										<th data-v-4f2a5c28="" class="pwd">
											<button data-v-4f2a5c28="" type="button" class="icon-button" style="cursor: default;">
												<span data-v-4f2a5c28="">비밀번호</span>
												<!---->
											</button>
										</th>
										<!-- <th data-v-4f2a5c28="" class="license-th">
											<div data-v-4f2a5c28="" class="license-wrap">
												<div data-v-4f2a5c28="" class="license-wrap-inner">
													<div data-v-4f2a5c28="" class="account-table-header-item">
														<button data-v-4f2a5c28="" type="button" class="icon-button" style="cursor: pointer;">
															<span data-v-4f2a5c28="">근무관리</span>
															<span data-v-4f2a5c28="" class="icon-wrapper ml-4">
																<object data-v-4f2a5c28="" data="https://static.hiworks.com/icon/caret-down.svg" class="icon off"></object>
															</span>
														</button>
													</div>
												</div>
											</div>
										</th> -->
										<th data-v-4f2a5c28="" class="account-table-header-item working_type">
											<button data-v-4f2a5c28="" type="button" class="icon-button" style="cursor: pointer;">
												<span data-v-4f2a5c28="">근로형태</span>
												<!-- <span data-v-4f2a5c28="" class="icon-wrapper ml-4">
													<object data-v-4f2a5c28="" data="https://static.hiworks.com/icon/caret-down.svg" class="icon off"></object>
												</span> -->
											</button>
										</th>
										<th data-v-4f2a5c28="" class="account-table-header-item const">
											<button data-v-4f2a5c28="" type="button" class="icon-button" style="cursor: pointer;">
												<span data-v-4f2a5c28="">소속조직</span>
												<!-- <span data-v-4f2a5c28="" class="icon-wrapper ml-4">
													<object data-v-4f2a5c28="" data="https://static.hiworks.com/icon/caret-down.svg" class="icon off"></object>
												</span> -->
											</button>
										</th>
										<th data-v-4f2a5c28="" class="account-table-header-item position">
											<button data-v-4f2a5c28="" type="button" class="icon-button" style="cursor: pointer;">
												<span data-v-4f2a5c28="">직위</span>
												<!-- <span data-v-4f2a5c28="" class="icon-wrapper ml-4">
													<object data-v-4f2a5c28="" data="https://static.hiworks.com/icon/caret-down.svg" class="icon off"></object>
												</span> -->
											</button>
										</th>
										<th data-v-4f2a5c28="" class="account-table-header-item status">
											<span data-v-4f2a5c28="" class="account-table-tab-name"> 상태 </span>
											<!---->
										</th>
									</tr>
								</thead>








								<tbody data-v-4f2a5c28="">
									<tr data-v-0bda246c="" data-v-4f2a5c28="" class="add-account-quickly-row">
										<td data-v-0bda246c="" class="checkbox"></td>
										<td data-v-0bda246c="" class="name">
											<input data-v-257b8828="" data-v-0bda246c="" type="text" name="name" placeholder="이름 입력" min="0" max="0" maxlength="20" class="inputName hu-input">
										</td>
										<!---->
										<!---->
										<td data-v-0bda246c="" class="user_id">
											<input data-v-257b8828="" data-v-0bda246c="" type="text" name="id" placeholder="ID 입력" min="0" max="0" maxlength="20" class="inputId hu-input">
										</td>
										<!---->
										<!---->
										<!---->
										<td data-v-0bda246c="" class="pwd">
											<input data-v-257b8828="" data-v-0bda246c="" type="password" name="pwd" placeholder="비밀번호 입력" min="0" max="0" maxlength="16" class="inputPwd hu-input" autocomplete="new-password" style="background-color: inherit;">
										</td>
										<!---->
										<!---->
										<!---->
										<!---->
										<td data-v-0bda246c="" class="working_type">
											<div data-v-0bda246c="" class="el-select">
												<!---->
												<div class="el-input el-input--suffix">
													<!---->
													<input type="text" readonly="readonly" autocomplete="off" placeholder="근로형태 선택" value="일반직" class="el-input__inner inputWorkType">
													<!---->
													<span class="el-input__suffix">
														<span class="el-input__suffix-inner">
															<i class="el-select__caret el-input__icon el-icon-arrow-up is-reverse-icon"></i>
															<!---->
															<!---->
															<!---->
															<!---->
															<!---->
														</span>
														<!---->
													</span>
													<!---->
													<!---->
												</div>
											</div>
										</td>
										<!---->
										<!---->
										<td data-v-0bda246c="" class="const">
											<div data-v-0bda246c="" class="select-box selection-button organization-select-box-placeholder">
												<p data-v-0bda246c="" class="select-box-content">
													<span data-v-0bda246c="" class="teamChoice none-select"> 조직 선택 </span>
													<span data-v-0bda246c="">
														<i data-v-0bda246c="" class="el-select__caret el-input__icon el-icon-arrow-up is-reverse-icon"></i>
													</span>
												</p>
											</div>
										</td>
										<!---->
										<!---->
										<!---->
										<td data-v-0bda246c="" class="position">
											<div data-v-0bda246c="" class="el-select">
												<!---->
												<div class="el-input el-input--suffix">
													<!---->
													<input type="text" readonly="readonly" autocomplete="off" placeholder="직위 선택" class="el-input__inner inputPosition">
													<!---->
													<span class="el-input__suffix">
														<span class="el-input__suffix-inner">
															<i class="el-select__caret el-input__icon el-icon-arrow-up is-reverse-icon"></i>
															<!---->
															<!---->
															<!---->
															<!---->
															<!---->
														</span>
														<!---->
													</span>
													<!---->
													<!---->
												</div>
											</div>
										</td>
										<td data-v-0bda246c="" class="text-center">
											<button data-v-1434033c="" data-v-0bda246c="" type="button" class="hu-button primary sm" onclick="checkInput()">
												<!---->
												<span data-v-1434033c="" class="label">저장</span>
												<!---->
											</button>
										</td>
									</tr>








									<form name="checkFrm" id="checkFrm">
										<input type="hidden" name="empType" value="" />
										<input type="hidden" name="positionId" value="" />
										<input type="hidden" name="userStatus" value="" />
									<c:forEach var="empVo" items="${requestScope.employeeList}">
									

										<tr data-v-9a88e898="" data-v-4f2a5c28="" class="account-row">
											<td data-v-9a88e898="" ondragstart="return false" onselectstart="return false" class="text-center checkbox">
												<label data-v-5eae55e0="" data-v-9a88e898="" class="hu-checkbox-wrapper">
													<div data-v-5eae55e0="" class="hu-checkbox">
														<span data-v-5eae55e0="" class="checkbox-input"></span>
														<input data-v-5eae55e0="" type="checkbox" name= "checkUser" value = "${empVo.empId}" class="checkbox-original checkUser">
														<span data-v-5eae55e0="" class="title"></span>
													</div>
												</label>
											</td>
											<td data-v-9a88e898="" class="name is-editable">${empVo.empName}</td>
											<!---->
											<td data-v-9a88e898="" class="user_id">
												<button data-v-1434033c="" data-v-9a88e898="" type="button" class="hu-button text">
													<!---->
													<span data-v-1434033c="" class="label">${empVo.id}</span>
													<!---->
												</button>
											</td>
											<!---->
											<!---->
											<td data-v-9a88e898="" class="pwd is-editable">확인 불가</td>
											<!---->
											<!-- <td data-v-9a88e898="">
												<div data-v-9a88e898="" class="license-wrap">
													<div data-v-9a88e898="" class="license-wrap-inner">
														<div data-v-9a88e898="" class="license-text">
															<span data-v-9a88e898="" class=""> 사용 </span>
														</div>
													</div>
												</div>
											</td> -->
											<!---->
											<td data-v-9a88e898="" class="working_type">${empVo.empType}</td>
											<!---->
											<td data-v-9a88e898="" class="const">
												<span data-v-9a88e898="">${empVo.teamName}</span>
											</td>
											<!---->
											<td data-v-9a88e898="" class="position">${empVo.positionName}</td>
											<td data-v-9a88e898="" class="text-center status">${empVo.status}</td>
										</tr>

									</c:forEach>
									</form>
								</tbody>






							</table>
						</div>
						<section data-v-5c8be384="" class="pagination mt-24">
							<!-- 수정필  -->
							<div class="documentListPagination">
								<nav>
									<ul class="pagination">${requestScope.pageBar}
									</ul>
								</nav>
							</div>
						</section>
					</section>
				</div>
			</section>
		</div>
	</div>
</div>