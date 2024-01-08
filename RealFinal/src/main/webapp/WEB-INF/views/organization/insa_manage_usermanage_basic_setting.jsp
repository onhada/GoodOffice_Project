<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3 style="font-size: 22px;">기본 설정</h3>
	</div>

	<div class="content_inbox insa-new">
		<div class="contents_insa">
			<h4 class="tle_insa_01">사용자 정보 수정 권한 설정</h4>
			<p class="Lh16">
				사용자정보의 개인 수정 허용 여부를 설정할 수 있습니다.<br> 개인 수정을 허용하지 않는 경우, 내 정보 관리
				및 프로필 설정에서 개인정보 및 프로필 사진을 등록/수정할 수 없습니다.<br>
			</p>
			<form id="modify_permission_setting" method="post"
				action="/gabia.biz/insa/manage/usermanage/modify_permission_setting">
				<br>
				<div>
					<label class="gt-mr-20"><input class="gt-mr-8" type="radio"
						name="modify_permission" checked="" value="personal" id="personal">개인
						수정 허용</label> <label class="gt-mr-20"><input class="gt-mr-8"
						type="radio" name="modify_permission" value="admin"
						id="only_admin">관리자만 수정 가능</label>
				</div>
				<div class="bt_left">
					<button class="gt-round-medium" type="submit" id="saveJob">저장</button>
				</div>
			</form>
		</div>

		<div class="contents_insa">
			<h4 class="tle_insa_01">중요정보 일괄 비공개 처리</h4>
			<p class="Lh16">
				비공개 설정 가능한 사용자 정보를 관리자가 일괄로 비공개 설정할 수 있습니다.<br> 비공개 처리된 사용자 정보는
				인사관리자 및 상위 조직장에게만 노출됩니다.<br> 단, 사용자 정보 수정 권한에 따라 개인 수정이 허용된
				경우에는 비공개처리된 정보를 사용자가 직접 공개로 변경할 수 있습니다.<br> 모든 사용자의 사용자 정보에서
				비공개로 전환할 항목을 체크하세요.<br>
			</p>
			<form method="post" onsubmit="return infoVisibleSettingConfirm(this)"
				action="/gabia.biz/insa/manage/usermanage/info_visible_setting">
				<fieldset>
					<br> <label class="gt-mr-20"><input class="gt-mr-8"
						type="checkbox" name="info_visible[]" value="cell">휴대전화</label> <label
						class="gt-mr-20"><input class="gt-mr-8" type="checkbox"
						name="info_visible[]" value="email">개인 이메일</label> <label
						class="gt-mr-20"><input class="gt-mr-8" type="checkbox"
						name="info_visible[]" value="company_num">사번</label> <label
						class="gt-mr-20"><input class="gt-mr-8" type="checkbox"
						name="info_visible[]" value="joindate">입사일</label> <label
						class="gt-mr-20"><input class="gt-mr-8" type="checkbox"
						name="info_visible[]" value="birthday">생년월일</label> <label
						class="gt-mr-20"><input class="gt-mr-8" type="checkbox"
						name="info_visible[]" value="address">자택주소</label> <label
						class="gt-mr-20"><input class="gt-mr-8" type="checkbox"
						name="info_visible[]" value="etc">기타정보</label> <br>
					<div class="bt_left">
						<button class="gt-round-medium" type="submit" id="saveJob">저장</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<script>
    function infoVisibleSettingConfirm(info){
        const infoList = {
            "cell": "휴대전화",
            "email": "개인 이메일",
            "company_num": "사번",
            "joindate": "입사일",
            "birthday": "생년월일",
            "address": "자택주소",
            "etc": "기타정보"
        };

        let toUnvisibleInfos = [];
        if (typeof(info.elements['info_visible[]'].length) == 'undefined') //단일
        {
            if (info.elements['info_visible[]'].checked===true)
            {
                console.log(info.elements['info_visible[]']);
            }
        } else { // 다중
            for (var i=0; i<info.elements['info_visible[]'].length; i++)
            {
                if (info.elements['info_visible[]'][i].checked===true)
                {
                    toUnvisibleInfos.push(infoList[info.elements['info_visible[]'][i].value]);
                }
            }
        }
        if(toUnvisibleInfos.length === 0) return false;
        return confirm(toUnvisibleInfos.join(", ") + "을(를) 일괄 비공개 처리하시겠습니까?");
    }
</script>
</div>