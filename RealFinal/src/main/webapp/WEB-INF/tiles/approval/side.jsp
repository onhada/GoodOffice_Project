<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div id="leftmenu">
				<!-- left -->
				<div class="new-split-item left">
					<div class="new-sidebar">
						<div class="fixed-area">
							<button type="button" class="hw-button plain"
								style="display: flex; height: 40px; align-items: center; justify-content: center;">
								<i class="gi gi-info gt-mr-8" style="font-size: 16px;"></i> <a
									href="https://www.hiworks.com/hiworks_beta/" target="_blank">
									<span class="gt-pb-2">전자결재 매뉴얼</span>
								</a>
							</button>
						</div>
						<a href="/gabia.biz/approval/document/write">
							<button type="button" class="main-btn">
								<i class="gi gi-plus"></i> <span>작성하기</span>
							</button>
						</a>
						<nav class="menu-wrap">
							<ul>
								<li class="el-collapse">
									<div class="el-collapse-item ">
										<div class="el-collapse-item__header menu-item"
											id="cookie_approval_menu_first"
											onclick="new_sidebar.toggleParent(this.id)">
											<span class="link gt-pl-10"> <span
												class="collapse-prefix-icon open"><i
													class="fal fa-chevron-up"></i></span> <span
												class="flex-truncate collapse">진행 중인 문서</span>
											</span>
										</div>
										<div class="el-collapse-item__wrap" style="display: block;">
											<ul class="el-collapse-item__content">
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/lists/A"
													class="link  router-link-exact-active"> <span
														class="link-prefix-icon"><i
															class="gis gi-documents"></i></span> <span class="flex-truncate">전체
															<span class="counting type-text"
															id="js-approval-lists-all" style="">2</span>
													</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/lists/W" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-hourglass"></i></span> <span class="flex-truncate">대기
															<span class="counting" id="js-approval-lists-wait"
															style="">2</span>
													</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/lists/V" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-check"></i></span> <span class="flex-truncate">확인
															<span class="counting" id="js-approval-lists-view-check"
															style="display: none;"></span>
													</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/lists/E" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-clock"></i></span> <span class="flex-truncate">예정
															<span class="counting type-text"
															id="js-approval-lists-expect" style="display: none;"></span>
													</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/lists/P" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-spinner"></i></span> <span class="flex-truncate">진행
															<span class="counting type-text"
															id="js-approval-lists-progress" style="display: none;"></span>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</li>

								<li class="el-collapse">
									<div class="el-collapse-item ">
										<div class="el-collapse-item__header menu-item"
											id="cookie_approval_menu_second"
											onclick="new_sidebar.toggleParent(this.id)">
											<a class="link gt-pl-10"> <span
												class="collapse-prefix-icon open"><i
													class="fal fa-chevron-up"></i></span> <span
												class="flex-truncate collapse">문서함</span>
											</a>
										</div>
										<div class="el-collapse-item__wrap" style="display: block;">
											<ul class="el-collapse-item__content">
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/box/all" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-documents"></i></span> <span class="flex-truncate">전체</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/box/writer"
													class="link "> <span class="link-prefix-icon"><i
															class="gis gi-pencil"></i></span> <span class="flex-truncate">기안</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/box/approval"
													class="link "> <span class="link-prefix-icon"><i
															class="gis gi-signature"></i></span> <span class="flex-truncate">결재</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/box/refer" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-user"></i></span> <span class="flex-truncate">수신</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/box/read" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-user-plus"></i></span> <span class="flex-truncate">회람/참조</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/document/box/return"
													class="link "> <span class="link-prefix-icon"><i
															class="gis gi-ban"></i></span> <span class="flex-truncate">반려</span>
												</a></li>
											</ul>
										</div>
									</div>
								</li>


								<li class="menu-item only"><a
									href="/gabia.biz/approval/document/box/temp"
									class="link gt-pl-10 "> <span class="link-prefix-icon"><i
											class="gis gi-archive"></i></span> <span class="flex-truncate">임시저장</span>
								</a></li>

								<li class="menu-item only"><a
									href="/gabia.biz/approval/person/settings"
									class="link gt-pl-10 "> <span class="link-prefix-icon"><i
											class="gis gi-cog"></i></span> <span class="flex-truncate">설정</span>
								</a></li>

								<hr>
								<li class="el-collapse">
									<div class="el-collapse-item ">
										<div class="el-collapse-item__header menu-item"
											id="cookie_approval_menu_third"
											onclick="new_sidebar.toggleParent(this.id)">
											<span class="link gt-pl-10"> <span
												class="collapse-prefix-icon open"><i
													class="fal fa-chevron-up"></i></span> <span
												class="flex-truncate collapse">관리자 설정</span>
											</span>
										</div>
										<div class="el-collapse-item__wrap" style="display: block;">
											<ul class="el-collapse-item__content">
												<li class="menu-item"><a
													href="/gabia.biz/approval/settings/basic" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-cog"></i></span> <span class="flex-truncate">기본
															설정</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/settings/forms" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-paper"></i></span> <span class="flex-truncate">양식함
															관리</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/settings/document" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-list"></i></span> <span class="flex-truncate">전체
															문서 목록</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/settings/deleted_document"
													class="link "> <span class="link-prefix-icon"><i
															class="gis gi-trash-alt"></i></span> <span class="flex-truncate">삭제
															문서 목록</span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/settings/backup" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-approval-backup"></i></span> <span
														class="flex-truncate">문서 백업</span> <!-- 안 읽은 메일 갯수 표기 -->
														<span class="several counting"></span>
												</a></li>
												<li class="menu-item"><a
													href="/gabia.biz/approval/settings/manager" class="link ">
														<span class="link-prefix-icon"><i
															class="gis gi-user-cog"></i></span> <span class="flex-truncate">전자결재
															관리자</span>
												</a></li>
											</ul>
										</div>
									</div>
								</li>
								<li class="menu-item only"><a
									href="/gabia.biz/accounting/basic/criteria"
									class="link gt-pl-10"> <span class="link-prefix-icon"><i
											class="gis gi-history"></i></span> <span class="flex-truncate">회계지원</span>
								</a></li>
							</ul>
						</nav>
					</div>

				</div>




				<script>
    var new_sidebar = {
        toggleParent: function(menuID) {
            var _this = $j("#" + menuID);
            _this.closest('.el-collapse-item').toggleClass('is-active');
            _this.siblings('.el-collapse-item__wrap').slideToggle(50);
            (getCookie(menuID) === "1" || getCookie(menuID) === "") ? setCookie(menuID, "0", 365) : setCookie(menuID, "1", 365);
        },
    }

    $j(document).ready(function(){
        Approval.getApprvalCount();
    });
</script>


				<!-- left End -->
			</div>
 