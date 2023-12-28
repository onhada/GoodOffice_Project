<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="contents" class="sc-9f5ea563-2 bjcWTx"
	style="width: calc(100% - 276px);">
	<div class="sc-9f5ea563-3 feoGRI">
		<div class="sc-7903fa12-0 ePwVOL">
			<h2 class="sc-7903fa12-1 cAidkx">게시판 만들기</h2>
			<div class="sc-7903fa12-2 cqjvbi">이름</div>
			<input placeholder="게시판 이름을 입력하세요." maxlength="60"
				class="sc-7903fa12-3 kmdxxe">
			<div class="sc-7903fa12-2 cqjvbi">
				게시판 종류
				<div class="popover" data-headlessui-state="">
					<button class="sc-c9ca0472-0 ceATpR"
						id="headlessui-popover-button-:r7h:" type="button"
						aria-expanded="false" data-headlessui-state="">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							viewBox="0 0 16 16" fill="#909090" class="help">
											<path data-name="패\uC2A4 98650"
								d="M8 .996a7 7 0 1 0 7 7 7 7 0 0 0-7-7m0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6"
								fill="current"></path>
											<path data-name="패\uC2A4 98651"
								d="M8 10.996a.75.75 0 1 1-.75.75.75.75 0 0 1 .75-.75"
								fill="current"></path>
											<path data-name="패\uC2A4 98652"
								d="M8.5 3.996h-.75a2.25 2.25 0 0 0-2.25 2.25v.25h1v-.25a1.25 1.25 0 0 1 1.25-1.25h.75a1.25 1.25 0 0 1 0 2.5h-1v2.25h1v-1.25a2.25 2.25 0 0 0 0-4.5"
								fill="current"></path>
											<path data-name="\uC0AC\uAC01형 144464" d="M0 0h16v16H0z"
								style="fill: none;"></path></svg>
					</button>
				</div>
			</div>
			<div class="sc-7903fa12-4 clHBOl">
				<label class="sc-e91c9578-0 ddDpEN"><input id="radio-:r7k:"
					type="radio" name="kind" class="sc-e91c9578-1 jLrGsI"
					value="전사 게시판 -"><span class="sc-e91c9578-2 iMESbc value">전사
						게시판 -</span>
					<div class="sc-d805a9c4-0 htsvgG">
						<div data-headlessui-state="">
							<button id="headlessui-menu-button-:r7l:" type="button">
								<div class="sc-7903fa12-5 foIZjB">
									조직에 속한 모든 사람과 공유 (조직없음 제외)
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										viewBox="0 0 16 16" fill="#909090" class="icon">
														<path data-name="패\uC2A4 98615"
											d="M8.4 10.306a.5.5 0 0 1-.705.089.511.511 0 0 1-.089-.089l-3.5-4.494A.5.5 0 0 1 4.5 5h7a.5.5 0 0 1 .4.812z"
											fill="current"></path>
														<path data-name="\uC0AC\uAC01형 144415" d="M0 0h16v16H0z"
											style="fill: none;"></path></svg>
								</div>
							</button>
						</div>
					</div></label><label class="sc-e91c9578-0 ddDpEN"><input id="radio-:r7k:"
					type="radio" name="kind" class="sc-e91c9578-1 jLrGsI"
					value="그룹 게시판 - 소유자 및 관리자가 지정한 사람과 공유" checked=""><span
					class="sc-e91c9578-2 iMESbc value">그룹 게시판 - 소유자 및 관리자가 지정한
						사람과 공유</span></label>
			</div>
			<div class="sc-7903fa12-2 cqjvbi">
				게시판 유형
				<div class="popover" data-headlessui-state="">
					<button class="sc-c9ca0472-0 ceATpR"
						id="headlessui-popover-button-:r7n:" type="button"
						aria-expanded="false" data-headlessui-state="">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							viewBox="0 0 16 16" fill="#909090" class="help">
											<path data-name="패\uC2A4 98650"
								d="M8 .996a7 7 0 1 0 7 7 7 7 0 0 0-7-7m0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6"
								fill="current"></path>
											<path data-name="패\uC2A4 98651"
								d="M8 10.996a.75.75 0 1 1-.75.75.75.75 0 0 1 .75-.75"
								fill="current"></path>
											<path data-name="패\uC2A4 98652"
								d="M8.5 3.996h-.75a2.25 2.25 0 0 0-2.25 2.25v.25h1v-.25a1.25 1.25 0 0 1 1.25-1.25h.75a1.25 1.25 0 0 1 0 2.5h-1v2.25h1v-1.25a2.25 2.25 0 0 0 0-4.5"
								fill="current"></path>
											<path data-name="\uC0AC\uAC01형 144464" d="M0 0h16v16H0z"
								style="fill: none;"></path></svg>
					</button>
				</div>
			</div>
			<div class="sc-7903fa12-4 clHBOl">
				<label class="sc-e91c9578-0 ddDpEN"><input id="radio-:r7q:"
					type="radio" name="type" class="sc-e91c9578-1 jLrGsI" value="일반형"
					checked=""><span class="sc-e91c9578-2 iMESbc value">일반형</span></label><label
					class="sc-e91c9578-0 ddDpEN"><input id="radio-:r7q:"
					type="radio" name="type" class="sc-e91c9578-1 jLrGsI" value="익명형"><span
					class="sc-e91c9578-2 iMESbc value">익명형</span></label>
			</div>
			<div class="sc-7903fa12-2 cqjvbi">사용자 및 권한</div>
			<div class="sc-c0cc27fb-0 bBzpLs">
				<div>
					<div>
						<span>멤버 1명</span>
						<button class="sc-b47602a1-0 iqqprB" type="button">
							<span class="sc-c0cc27fb-3 bQUNF"><svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									viewBox="0 0 16 16" fill="#2985db">
													<path data-name="\uC0AC\uAC01형 144459" d="M0 0h16v16H0z"
										style="fill: none;"></path>
													<path data-name="합\uCE58\uAE30 699"
										d="M7 15V9H1V7h6V1h2v6h6v2H9v6z" fill="current"></path>
													<path data-name="합\uCE58\uAE30 698"
										d="M7 15V9H1V7h6V1h2v6h6v2H9v6z" fill="current"></path></svg></span><span
								class="text">멤버 추가</span>
						</button>
					</div>
					<div>
						<input placeholder="사용자 이름 검색" class="sc-c0cc27fb-1 fMwMMH">
					</div>
				</div>
				<div class="sc-eaef989a-0 jXYAOR">
					<div class="sc-eaef989a-1 eUYPXM">
						<span>이름</span>
						<div>
							<span>기본 권한</span>
							<div class="popover" data-headlessui-state="">
								<button class="sc-c9ca0472-0 ceATpR"
									id="headlessui-popover-button-:r88:" type="button"
									aria-expanded="false" data-headlessui-state="">
									<div class="sc-eaef989a-3 cZNHnu">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											viewBox="0 0 16 16" fill="#909090">
															<path data-name="패\uC2A4 98650"
												d="M8 .996a7 7 0 1 0 7 7 7 7 0 0 0-7-7m0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6"
												fill="current"></path>
															<path data-name="패\uC2A4 98651"
												d="M8 10.996a.75.75 0 1 1-.75.75.75.75 0 0 1 .75-.75"
												fill="current"></path>
															<path data-name="패\uC2A4 98652"
												d="M8.5 3.996h-.75a2.25 2.25 0 0 0-2.25 2.25v.25h1v-.25a1.25 1.25 0 0 1 1.25-1.25h.75a1.25 1.25 0 0 1 0 2.5h-1v2.25h1v-1.25a2.25 2.25 0 0 0 0-4.5"
												fill="current"></path>
															<path data-name="\uC0AC\uAC01형 144464" d="M0 0h16v16H0z"
												style="fill: none;"></path></svg>
									</div>
								</button>
							</div>
							<div class="sc-55964cf4-0 hQtaIl select">
								<label class="sc-55964cf4-1 dkFmPo"
									id="headlessui-listbox-label-:r8b:" data-headlessui-state="">기본
									권한 선택</label>
								<button class="sc-55964cf4-2 bCVTze"
									id="headlessui-listbox-button-:r8c:" type="button"
									aria-haspopup="true" aria-expanded="false"
									data-headlessui-state=""
									aria-labelledby="headlessui-listbox-label-:r8b: headlessui-listbox-button-:r8c:">
									읽기/쓰기<i class="fal fa-chevron-down"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="sc-eaef989a-2 kGfnpZ" style="position: relative;">
						<div style="overflow: visible; width: 0px;">
							<div aria-label="grid" aria-readonly="true"
								class="ReactVirtualized__Grid ReactVirtualized__List"
								role="grid" tabindex="0"
								style="box-sizing: border-box; direction: ltr; height: 373px; position: relative; width: 899px; will-change: transform; overflow: hidden;">
								<div class="ReactVirtualized__Grid__innerScrollContainer"
									role="rowgroup"
									style="width: auto; height: 44px; max-width: 899px; max-height: 44px; overflow: hidden; position: relative;">
									<div class="sc-eaef989a-4 iRkhge"
										style="height: 44px; left: 0px; position: absolute; top: 0px; width: 100%;">
										<div class="sc-622e34aa-0 iwwYaV">
											<div class="user-profile">
												<img alt="김이사"
													srcset="https://account-api.office.hiworks.com/profile-image/offices/617927/office-users/86917?filter[is_dark]=N&amp;w=26&amp;q=75 1x, https://account-api.office.hiworks.com/profile-image/offices/617927/office-users/86917?filter[is_dark]=N&amp;w=26&amp;q=75 2x"
													src="https://account-api.office.hiworks.com/profile-image/offices/617927/office-users/86917?filter[is_dark]=N&amp;w=26&amp;q=75"
													width="26" height="26" decoding="async" data-nimg="1"
													loading="lazy" style="color: transparent;"><span
													class="name">김이사</span>
											</div>
											<div>
												<label for="checkbox-:r8e:" class="sc-e952bce-0 kkExOm"><span
													class="sc-e952bce-1 bvXoCY"><span
														class="sc-e952bce-2 hhhWRC"></span><input
														id="checkbox-:r8e:" type="checkbox" disabled=""
														readonly="" checked=""><span
														class="sc-e952bce-3 rdHkc">쓰기</span></span></label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="resize-triggers">
							<div class="expand-trigger">
								<div style="width: 892px; height: 368px;"></div>
							</div>
							<div class="contract-trigger"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="sc-7903fa12-2 cqjvbi">말머리 설정</div>
			<div class="sc-7903fa12-4 clHBOl">
				<label class="sc-e91c9578-0 ddDpEN"><input id="radio-:r7r:"
					type="radio" name="tag" class="sc-e91c9578-1 jLrGsI" value="사용"><span
					class="sc-e91c9578-2 iMESbc value">사용</span></label><label
					class="sc-e91c9578-0 ddDpEN"><input id="radio-:r7r:"
					type="radio" name="tag" class="sc-e91c9578-1 jLrGsI" value="사용 안 함"
					checked=""><span class="sc-e91c9578-2 iMESbc value">사용
						안 함</span></label>
			</div>
			<div class="sc-7903fa12-2 cqjvbi">기타 설정</div>
			<div class="sc-cd819f0f-0 khTOaq">
				<div class="sc-cd819f0f-1 bDQIpz">
					<div class="sc-cd819f0f-2 jYgoIA">
						기본 알림
						<div class="popover" data-headlessui-state="">
							<button class="sc-c9ca0472-0 ceATpR"
								id="headlessui-popover-button-:r7s:" type="button"
								aria-expanded="false" data-headlessui-state="">
								<div class="sc-cd819f0f-4 iCoGpz">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										viewBox="0 0 16 16" fill="#909090">
														<path data-name="패\uC2A4 98650"
											d="M8 .996a7 7 0 1 0 7 7 7 7 0 0 0-7-7m0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6"
											fill="current"></path>
														<path data-name="패\uC2A4 98651"
											d="M8 10.996a.75.75 0 1 1-.75.75.75.75 0 0 1 .75-.75"
											fill="current"></path>
														<path data-name="패\uC2A4 98652"
											d="M8.5 3.996h-.75a2.25 2.25 0 0 0-2.25 2.25v.25h1v-.25a1.25 1.25 0 0 1 1.25-1.25h.75a1.25 1.25 0 0 1 0 2.5h-1v2.25h1v-1.25a2.25 2.25 0 0 0 0-4.5"
											fill="current"></path>
														<path data-name="\uC0AC\uAC01형 144464" d="M0 0h16v16H0z"
											style="fill: none;"></path></svg>
								</div>
							</button>
						</div>
					</div>
					<div class="sc-cd819f0f-3 jswGam">
						<label class="sc-e91c9578-0 ddDpEN"><input
							id="radio-:r7v:" type="radio" name="notification"
							class="sc-e91c9578-1 jLrGsI" value="사용"><span
							class="sc-e91c9578-2 iMESbc value">사용</span></label><label
							class="sc-e91c9578-0 ddDpEN"><input id="radio-:r7v:"
							type="radio" name="notification" class="sc-e91c9578-1 jLrGsI"
							value="사용 안 함" checked=""><span
							class="sc-e91c9578-2 iMESbc value">사용 안 함</span></label>
					</div>
				</div>
				<div class="sc-cd819f0f-1 bDQIpz">
					<div class="sc-cd819f0f-2 jYgoIA">
						게시글 공유
						<div class="popover" data-headlessui-state="">
							<button class="sc-c9ca0472-0 ceATpR"
								id="headlessui-popover-button-:r80:" type="button"
								aria-expanded="false" data-headlessui-state="">
								<div class="sc-cd819f0f-4 iCoGpz">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										viewBox="0 0 16 16" fill="#909090">
														<path data-name="패\uC2A4 98650"
											d="M8 .996a7 7 0 1 0 7 7 7 7 0 0 0-7-7m0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6"
											fill="current"></path>
														<path data-name="패\uC2A4 98651"
											d="M8 10.996a.75.75 0 1 1-.75.75.75.75 0 0 1 .75-.75"
											fill="current"></path>
														<path data-name="패\uC2A4 98652"
											d="M8.5 3.996h-.75a2.25 2.25 0 0 0-2.25 2.25v.25h1v-.25a1.25 1.25 0 0 1 1.25-1.25h.75a1.25 1.25 0 0 1 0 2.5h-1v2.25h1v-1.25a2.25 2.25 0 0 0 0-4.5"
											fill="current"></path>
														<path data-name="\uC0AC\uAC01형 144464" d="M0 0h16v16H0z"
											style="fill: none;"></path></svg>
								</div>
							</button>
						</div>
					</div>
					<div class="sc-cd819f0f-3 jswGam">
						<label class="sc-e91c9578-0 ddDpEN"><input
							id="radio-:r83:" type="radio" name="share"
							class="sc-e91c9578-1 jLrGsI" value="허용" checked=""><span
							class="sc-e91c9578-2 iMESbc value">허용</span></label><label
							class="sc-e91c9578-0 ddDpEN"><input id="radio-:r83:"
							type="radio" name="share" class="sc-e91c9578-1 jLrGsI"
							value="허용 안 함"><span class="sc-e91c9578-2 iMESbc value">허용
								안 함</span></label>
					</div>
				</div>
				<div class="sc-cd819f0f-1 bDQIpz">
					<div class="sc-cd819f0f-2 jYgoIA">
						게시판 사용 여부
						<div class="popover" data-headlessui-state="">
							<button class="sc-c9ca0472-0 ceATpR"
								id="headlessui-popover-button-:r84:" type="button"
								aria-expanded="false" data-headlessui-state="">
								<div class="sc-cd819f0f-4 iCoGpz">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										viewBox="0 0 16 16" fill="#909090">
														<path data-name="패\uC2A4 98650"
											d="M8 .996a7 7 0 1 0 7 7 7 7 0 0 0-7-7m0 13a6 6 0 1 1 6-6 6 6 0 0 1-6 6"
											fill="current"></path>
														<path data-name="패\uC2A4 98651"
											d="M8 10.996a.75.75 0 1 1-.75.75.75.75 0 0 1 .75-.75"
											fill="current"></path>
														<path data-name="패\uC2A4 98652"
											d="M8.5 3.996h-.75a2.25 2.25 0 0 0-2.25 2.25v.25h1v-.25a1.25 1.25 0 0 1 1.25-1.25h.75a1.25 1.25 0 0 1 0 2.5h-1v2.25h1v-1.25a2.25 2.25 0 0 0 0-4.5"
											fill="current"></path>
														<path data-name="\uC0AC\uAC01형 144464" d="M0 0h16v16H0z"
											style="fill: none;"></path></svg>
								</div>
							</button>
						</div>
					</div>
					<div class="sc-cd819f0f-3 jswGam">
						<label class="sc-e91c9578-0 ddDpEN"><input
							id="radio-:r87:" type="radio" name="use"
							class="sc-e91c9578-1 jLrGsI" value="사용" checked=""><span
							class="sc-e91c9578-2 iMESbc value">사용</span></label><label
							class="sc-e91c9578-0 ddDpEN"><input id="radio-:r87:"
							type="radio" name="use" class="sc-e91c9578-1 jLrGsI"
							value="사용 안 함"><span class="sc-e91c9578-2 iMESbc value">사용
								안 함</span></label>
					</div>
				</div>
			</div>
			<button class="sc-b47602a1-0 igcdCy" type="button">취소</button>
			<button class="sc-b47602a1-0 erJFJu" type="button" disabled="">생성</button>
		</div>
	</div>
</div>