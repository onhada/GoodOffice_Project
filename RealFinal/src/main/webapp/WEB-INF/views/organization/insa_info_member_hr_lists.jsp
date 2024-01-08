<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <div id="contents" style="left:276px;">
			<!-- insa.office.hiworks.com/hiworks/views/dev/org.php -->
<link rel="stylesheet" type="text/css" href="https://static.gabia.com/libs/font-awesome/5.0.8/font-awesome.min.css">
<div class="setting_title after gt-pv-10">
	<h3 class="fl" style="font-size: 22px;">
		<div class="gt-align-middle hw-searching" style="width:360px">
			<input type="text" class="hw-input ui-autocomplete-input" placeholder="임직원 검색" id="memberName" autocomplete="off">
			<i class="far fa-search / icon-suffix"></i>
		</div>
	</h3>
	<div class="fr gt-mt-3">
		<button type="button" class="gt-align-middle gt-mr-20 hw-button outline-gray2 rounded font-size-13" id="btn_myinfo">내 정보 보기</button>
		<a class="gt-align-middle icon order" href="javascript:void(0);" title="정렬" id="filter"><span class="blind">정렬</span></a>
        <div class="dropdown hide">
            <ul class="dropdown-menu block" style="right:0;">
                <li class="dropdown-header">정렬</li>
                <li class="active"><a href="javascript:void(0);" onclick="OrgMember.orgFilter('const', this);">조직</a></li>
                <li><a href="javascript:void(0);" id="filter_joindate" onclick="OrgMember.orgFilter('joindate', this);">입사연도</a></li>
				<li><a href="javascript:void(0);" id="filter_name" onclick="OrgMember.orgFilter('name', this);">이름</a></li>
				<li><a href="javascript:void(0);" id="filter_position" onclick="OrgMember.orgFilter('position', this);">직위</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="content_inbox">
	<div class="org-list after" id="type_of_org">
		<section class="org-tree">
			<div class="org-tree-wrap" id="org-tree"><h4 class="active" onclick="OrgMember.getNodeTypeData(null, event)"><i class="far fa-minus" onclick="OrgMember.selectPluseMinus(39438, event);"></i> <span class="title">하이웍스산업</span> <span class="num">(11)</span></h4><ul id="node_39438" class="is-first-node"><li id="node_39440"><div class="container" onclick="OrgMember.getNodeTypeData(39440, event)"><i class="far fa-plus" onclick="OrgMember.selectPluseMinus(39440, event);"></i> <span class="title">관리부 </span> <span class="num">(4)</span></div><ul style="display: none;"><li id="node_39443"><div class="container" onclick="OrgMember.getNodeTypeData(39443, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39443, event);"></i> <span class="title">인사팀 </span> <span class="num">(1)</span></div></li><li id="node_39444"><div class="container" onclick="OrgMember.getNodeTypeData(39444, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39444, event);"></i> <span class="title">구매총무팀 </span> <span class="num">(1)</span></div></li><li id="node_39445"><div class="container" onclick="OrgMember.getNodeTypeData(39445, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39445, event);"></i> <span class="title">재무회계팀 </span> <span class="num">(2)</span></div></li></ul></li><li id="node_39441"><div class="container" onclick="OrgMember.getNodeTypeData(39441, event)"><i class="far fa-plus" onclick="OrgMember.selectPluseMinus(39441, event);"></i> <span class="title">생산부 </span> <span class="num">(3)</span></div><ul style="display: none;"><li id="node_39446"><div class="container" onclick="OrgMember.getNodeTypeData(39446, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39446, event);"></i> <span class="title">생산1팀 </span> <span class="num">(1)</span></div></li><li id="node_39447"><div class="container" onclick="OrgMember.getNodeTypeData(39447, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39447, event);"></i> <span class="title">생산2팀 </span> <span class="num">(1)</span></div></li><li id="node_39448"><div class="container" onclick="OrgMember.getNodeTypeData(39448, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39448, event);"></i> <span class="title">품질관리팀 </span> <span class="num">(1)</span></div></li></ul></li><li id="node_39442"><div class="container" onclick="OrgMember.getNodeTypeData(39442, event)"><i class="far fa-plus" onclick="OrgMember.selectPluseMinus(39442, event);"></i> <span class="title">영업부 </span> <span class="num">(3)</span></div><ul style="display: none;"><li id="node_39449"><div class="container" onclick="OrgMember.getNodeTypeData(39449, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39449, event);"></i> <span class="title">영업1팀 </span> <span class="num">(1)</span></div></li><li id="node_39450"><div class="container" onclick="OrgMember.getNodeTypeData(39450, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39450, event);"></i> <span class="title">영업2팀 </span> <span class="num">(1)</span></div></li><li id="node_39451"><div class="container" onclick="OrgMember.getNodeTypeData(39451, event)"><i class="far org-end" onclick="OrgMember.selectPluseMinus(39451, event);"></i> <span class="title">고객지원팀 </span> <span class="num">(1)</span></div></li></ul></li></ul></div>
		</section>

		<section class="org-members" id="org-members"><h4>하이웍스산업 <span class="count">(11)</span></h4><div class="org-members-unit after"><dl title="대표이사
대표이사" onclick="OrgMember.getOrgMemberInfo(68559)"><dt class="name">대표이사</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68559/80/main" style="display: inline-block;"></dd><dd class="position">대표이사</dd></dl></div><h5>관리부 <span class="count">(4)</span></h5><div class="org-members-unit-small after"></div><p>인사팀</p><div class="org-members-unit-small after"><dl title="최사장
사장
관리부>인사팀" onclick="OrgMember.getOrgMemberInfo(68560)"><dt class="name">최사장</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68560/80/main" style="display: inline-block;"></dd><dd class="teams">인사팀</dd><dd class="position">사장</dd></dl></div><p>구매총무팀</p><div class="org-members-unit-small after"><dl title="박상무
상무
관리부>구매총무팀" onclick="OrgMember.getOrgMemberInfo(68561)"><dt class="name">박상무</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68561/80/main" style="display: inline-block;"></dd><dd class="teams">구매총무팀</dd><dd class="position">상무</dd></dl></div><p>재무회계팀</p><div class="org-members-unit after"><dl title="양대리
대리
관리부>재무회계팀" onclick="OrgMember.getOrgMemberInfo(68566)"><dt class="name">양대리</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68566/80/main" style="display: inline-block;"></dd><dd class="teams">재무회계팀</dd><dd class="position">대리</dd></dl><dl title="주알바
계약직
관리부>재무회계팀" onclick="OrgMember.getOrgMemberInfo(68569)"><dt class="name">주알바</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68569/80/main" style="display: inline-block;"></dd><dd class="teams">재무회계팀</dd><dd class="position">계약직</dd></dl></div><h5>생산부 <span class="count">(3)</span></h5><div class="org-members-unit-small after"></div><p>생산1팀</p><div class="org-members-unit-small after"><dl title="김이사
이사
생산부>생산1팀" onclick="OrgMember.getOrgMemberInfo(68562)"><dt class="name">김이사</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68562/80/main" style="display: inline-block;"></dd><dd class="teams">생산1팀</dd><dd class="position">이사</dd></dl></div><p>생산2팀</p><div class="org-members-unit-small after"><dl title="오부장
부장
생산부>생산2팀" onclick="OrgMember.getOrgMemberInfo(68563)"><dt class="name">오부장</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68563/80/main" style="display: inline-block;"></dd><dd class="teams">생산2팀</dd><dd class="position">부장</dd></dl></div><p>품질관리팀</p><div class="org-members-unit after"><dl title="안주임
주임
생산부>품질관리팀" onclick="OrgMember.getOrgMemberInfo(68567)"><dt class="name">안주임</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68567/80/main" style="display: inline-block;"></dd><dd class="teams">품질관리팀</dd><dd class="position">주임</dd></dl></div><h5>영업부 <span class="count">(3)</span></h5><div class="org-members-unit-small after"></div><p>영업1팀</p><div class="org-members-unit-small after"><dl title="조차장
차장
영업부>영업1팀" onclick="OrgMember.getOrgMemberInfo(68564)"><dt class="name">조차장</dt><dd class="picture"><img class="lazy_img" alt="" width="70px" height="70px" src="/gabia.biz/common/profile/image/68564/80/main" style="display: inline-block;"></dd><dd class="teams">영업1팀</dd><dd class="position">차장</dd></dl></div><p>영업2팀</p><div class="org-members-unit-small after"><dl title="강과장
과장
영업부>영업2팀" onclick="OrgMember.getOrgMemberInfo(68565)"><dt class="name">강과장</dt><dd class="picture"><img class="lazy_img" data-src="/gabia.biz/common/profile/image/68565/80/main" alt="" width="70px" height="70px" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="></dd><dd class="teams">영업2팀</dd><dd class="position">과장</dd></dl></div><p>고객지원팀</p><div class="org-members-unit after"><dl title="이사원
사원
영업부>고객지원팀" onclick="OrgMember.getOrgMemberInfo(68568)"><dt class="name">이사원</dt><dd class="picture"><img class="lazy_img" data-src="/gabia.biz/common/profile/image/68568/80/main" alt="" width="70px" height="70px" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="></dd><dd class="teams">고객지원팀</dd><dd class="position">사원</dd></dl></div></section>
	</div>
	<div class="org-list after hide" id="type_of_other">
		<section class="org-tree">
			<div class="org-tree-wrap" id="other-tree">
				<ul class="search-result"></ul>
			</div>
		</section>

		<section class="org-members" id="other-members"></section>
	</div>
	<div class="org-list after" id="type_of_search" style="display: none;">
		<section class="org-tree">
			<div class="org-tree-wrap" id="search-tree">
				<ul class="search-result">
					<li>
						<div class="container"><h3>검색 결과</h3></div>
					</li>
				</ul>
			</div>
		</section>

		<section class="org-members" id="search-members"></section>
	</div>
</div>

<div class="layer_box mid_large hide" id="insa_info_layer"></div>

<script type="text/javascript">
$j(document).ready(function(e){
	OrgMember.init([{"node_id":"39438","node_name":"\ud558\uc774\uc6cd\uc2a4\uc0b0\uc5c5","parent_no":"39437","no_depth":"0","depth":0,"user_cnt":11},{"node_id":"39440","node_name":"\uad00\ub9ac\ubd80","parent_no":"39438","no_depth":"0","depth":1,"user_cnt":4},{"node_id":"39443","node_name":"\uc778\uc0ac\ud300","parent_no":"39440","no_depth":"0","depth":2,"user_cnt":1},{"node_id":"39444","node_name":"\uad6c\ub9e4\ucd1d\ubb34\ud300","parent_no":"39440","no_depth":"0","depth":2,"user_cnt":1},{"node_id":"39445","node_name":"\uc7ac\ubb34\ud68c\uacc4\ud300","parent_no":"39440","no_depth":"0","depth":2,"user_cnt":2},{"node_id":"39441","node_name":"\uc0dd\uc0b0\ubd80","parent_no":"39438","no_depth":"0","depth":1,"user_cnt":3},{"node_id":"39446","node_name":"\uc0dd\uc0b01\ud300","parent_no":"39441","no_depth":"0","depth":2,"user_cnt":1},{"node_id":"39447","node_name":"\uc0dd\uc0b02\ud300","parent_no":"39441","no_depth":"0","depth":2,"user_cnt":1},{"node_id":"39448","node_name":"\ud488\uc9c8\uad00\ub9ac\ud300","parent_no":"39441","no_depth":"0","depth":2,"user_cnt":1},{"node_id":"39442","node_name":"\uc601\uc5c5\ubd80","parent_no":"39438","no_depth":"0","depth":1,"user_cnt":3},{"node_id":"39449","node_name":"\uc601\uc5c51\ud300","parent_no":"39442","no_depth":"0","depth":2,"user_cnt":1},{"node_id":"39450","node_name":"\uc601\uc5c52\ud300","parent_no":"39442","no_depth":"0","depth":2,"user_cnt":1},{"node_id":"39451","node_name":"\uace0\uac1d\uc9c0\uc6d0\ud300","parent_no":"39442","no_depth":"0","depth":2,"user_cnt":1}]);

	$j(document).on('click', function(e){
		$j('.dropdown').hide();
	});
	$j(document).on('click', '#filter', function(e){
		e.preventDefault();
		e.stopPropagation();
		$j(this).next('.dropdown').show();
	});

	$j(document).on('click', '#btn_myinfo', function(){
		location.href='/gabia.biz/insa/info/myinfo';
	});

	$j(document).on('keydown', '#memberName', function(e){
		if(e.keyCode === 13){
			if($j(this).val() === ''){
				OrgMember.cancelMemberSearch();
				return false;
			}
			$j('#memberSearch').click();
		}
	});

	$j('#memberName').autocomplete({
// 		source: function(request, response){
// 			$j.ajax( {
// 				url: Common.getServiceRoot() + "insa/org_ajax",
// 				dataType: 'json',
// 				type: 'POST',
// 				data: {
// 					pMenu : 'search_org_member',
// 					pKeyword: request.term
// 				},
// 				minLength: 1,
// 				delay: 500,
// 				success: function( data ) {
// 					response( data.result );
// 				}
// 			} );
// 		}
		source : function(request, response){
			var matcher = new RegExp( $j.ui.autocomplete.escapeRegex( request.term ), "i" );
	        response( $j.grep( OrgMember._search_data, function( value ) {
	          value = value.name;
	          return matcher.test( value );
	        }) );
		}
		
		,open: function(){
			//$j(this).data("ui-autocomplete").menu.element.addClass("insa-search");
		}

		,focus: function() {
			return false;
		}

		,autoFocus : false

		,select: function(event, ui){
			$j('#memberName').val(ui.item.name);
			OrgMember.searchResult(ui.item.search_id, 'id');
			return false;
		}

		,response: function(event, ui){

		}

		,appendTo : '#div-insa-search'
	})
	.autocomplete( "instance" )._renderItem = function( ul, item ) {
		ul.addClass('insa-search');
		
		return $j( "<li>" )
		.append( "<div>" + (item.type === 'node' ? '#' + item.name : item.name) + "</div>" )
		.appendTo( ul );
	};

	$j(document).on('click', '#memberSearch', function(e){
		var value = Common.trim($j('#memberName').val());
		if(value === ''){
			return;
		}

		OrgMember.searchResult(value, 'name');
	});
});
</script>
		</div>
    
    