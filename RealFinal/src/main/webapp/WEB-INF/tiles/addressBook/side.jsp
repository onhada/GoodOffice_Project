<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sidebar" id="sidebar">
	<div class="fixed-area">
		<button type="button" class="add-address-btn">
			<div class="d-table w-100">
				<div class="d-table-row">
					<div class="d-table-cell align-middle">
						<i class="far fa-plus"></i><span class="txt">주소 추가</span>
					</div>
				</div>
			</div>
		</button>
	</div>
	<div class="vb vb-invisible"
		style="width: auto; height: calc(100% - 104px); position: relative; overflow: hidden;">
		<div class="vb-content"
			style="display: block; overflow: hidden scroll; height: 100%; width: calc(100% + 8px);">
			<nav class="menu-wrap">
				<div class="menu-item">
					<a href="/starred"
						class="link pl-10 router-link-exact-active router-link-active route-active"
						aria-current="page"><span class="before-icon icon-starred"><i
							class="fas fa-star"></i></span><span class="name">중요 주소록</span></a>
				</div>
				<div role="tablist" aria-multiselectable="true"
					class="el-collapse mb-20">
					<div class="el-collapse-item is-active">
						<div role="tab" aria-expanded="true"
							aria-controls="el-collapse-content-3653"
							aria-describedby="el-collapse-content-3653">
							<div role="button" id="el-collapse-head-3653" tabindex="0"
								class="el-collapse-item__header is-active">
								<div class="menu-item">
									<span class="link pl-10"><span class="before-icon"><i
											class="fal fa-chevron-down"></i></span><span
										class="name collpase-name">개인 주소록</span>
										<button type="button" class="float-right">
											<button data-v-21506c5c="" tabindex="-1"
												class="el-tooltip hw-icon"
												aria-describedby="el-tooltip-1786">
												<i data-v-21506c5c="" class="far fa-plus-circle"></i>
											</button>
										</button></span>
								</div>
								<i class="el-collapse-item__arrow el-icon-arrow-right is-active"></i>
							</div>
						</div>
						<div role="tabpanel" aria-labelledby="el-collapse-head-3653"
							id="el-collapse-content-3653" class="el-collapse-item__wrap">
							<div class="el-collapse-item__content">
								<div class="menu-item">
									<a href="/private" class="link"><span class="before-icon"><i
											class="fas fa-address-book"></i></span><span class="name">전체</span></a>
								</div>
								<div>
									<div class="menu-item">
										<a href="/private/36692" class="link"><span
											class="before-icon"><i class="fas fa-tag"></i></span><span
											class="name">CEO</span>
											<div class="float-right el-dropdown">
												<button type="button" aria-haspopup="list"
													aria-controls="dropdown-menu-8452" role="button"
													tabindex="0" class=" el-dropdown-selfdefine">
													<button data-v-21506c5c="" tabindex="-1"
														class="el-tooltip hw-icon"
														aria-describedby="el-tooltip-8651">
														<i data-v-21506c5c="" class="far fa-ellipsis-h"></i>
													</button>
												</button>
												<ul class="el-dropdown-menu el-popper"
													id="dropdown-menu-8452" style="display: none;">
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->삭제
													</li>
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->이름 변경
													</li>
												</ul>
											</div></a>
									</div>
								</div>
								<div class="menu-item">
									<a href="/private/untagged" class="link"><span
										class="before-icon"><i class="fas fa-tag"></i></span><span
										class="name">미등록 태그</span></a>
								</div>
							</div>
						</div>
					</div>
					<div class="el-collapse-item is-active">
						<div role="tab" aria-expanded="true"
							aria-controls="el-collapse-content-7002"
							aria-describedby="el-collapse-content-7002">
							<div role="button" id="el-collapse-head-7002" tabindex="0"
								class="el-collapse-item__header is-active">
								<div class="menu-item">
									<span class="link pl-10"><span class="before-icon"><i
											class="fal fa-chevron-down"></i></span><span
										class="name collpase-name">공유 주소록</span>
										<button type="button" class="float-right">
											<button data-v-21506c5c="" tabindex="-1"
												class="el-tooltip hw-icon"
												aria-describedby="el-tooltip-3109">
												<i data-v-21506c5c="" class="far fa-plus-circle"></i>
											</button>
										</button></span>
								</div>
								<i class="el-collapse-item__arrow el-icon-arrow-right is-active"></i>
							</div>
						</div>
						<div role="tabpanel" aria-labelledby="el-collapse-head-7002"
							id="el-collapse-content-7002" class="el-collapse-item__wrap">
							<div class="el-collapse-item__content">
								<div class="menu-item">
									<a href="/shared" class="link"><span class="before-icon"><i
											class="fas fa-address-book"></i></span><span class="name">전체</span></a>
								</div>
								<div>
									<div class="menu-item">
										<a href="/shared/36693" class="link"><span
											class="before-icon"><i class="fas fa-tag"></i></span><span
											class="name">관리부</span>
											<div class="float-right el-dropdown">
												<button type="button" aria-haspopup="list"
													aria-controls="dropdown-menu-7861" role="button"
													tabindex="0" class=" el-dropdown-selfdefine">
													<button data-v-21506c5c="" tabindex="-1"
														class="el-tooltip hw-icon"
														aria-describedby="el-tooltip-4337">
														<i data-v-21506c5c="" class="far fa-ellipsis-h"></i>
													</button>
												</button>
												<ul class="el-dropdown-menu el-popper"
													id="dropdown-menu-7861" style="display: none;">
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->삭제
													</li>
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->이름 변경
													</li>
												</ul>
											</div></a>
									</div>
									<div class="menu-item">
										<a href="/shared/36694" class="link"><span
											class="before-icon"><i class="fas fa-tag"></i></span><span
											class="name">기업 거래처</span>
											<div class="float-right el-dropdown">
												<button type="button" aria-haspopup="list"
													aria-controls="dropdown-menu-3053" role="button"
													tabindex="0" class=" el-dropdown-selfdefine">
													<button data-v-21506c5c="" tabindex="-1"
														class="el-tooltip hw-icon"
														aria-describedby="el-tooltip-5347">
														<i data-v-21506c5c="" class="far fa-ellipsis-h"></i>
													</button>
												</button>
												<ul class="el-dropdown-menu el-popper"
													id="dropdown-menu-3053" style="display: none;">
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->삭제
													</li>
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->이름 변경
													</li>
												</ul>
											</div></a>
									</div>
									<div class="menu-item">
										<a href="/shared/36695" class="link"><span
											class="before-icon"><i class="fas fa-tag"></i></span><span
											class="name">생산부</span>
											<div class="float-right el-dropdown">
												<button type="button" aria-haspopup="list"
													aria-controls="dropdown-menu-8503" role="button"
													tabindex="0" class=" el-dropdown-selfdefine">
													<button data-v-21506c5c="" tabindex="-1"
														class="el-tooltip hw-icon"
														aria-describedby="el-tooltip-639">
														<i data-v-21506c5c="" class="far fa-ellipsis-h"></i>
													</button>
												</button>
												<ul class="el-dropdown-menu el-popper"
													id="dropdown-menu-8503" style="display: none;">
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->삭제
													</li>
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->이름 변경
													</li>
												</ul>
											</div></a>
									</div>
									<div class="menu-item">
										<a href="/shared/36696" class="link"><span
											class="before-icon"><i class="fas fa-tag"></i></span><span
											class="name">영업부</span>
											<div class="float-right el-dropdown">
												<button type="button" aria-haspopup="list"
													aria-controls="dropdown-menu-9364" role="button"
													tabindex="0" class=" el-dropdown-selfdefine">
													<button data-v-21506c5c="" tabindex="-1"
														class="el-tooltip hw-icon"
														aria-describedby="el-tooltip-6295">
														<i data-v-21506c5c="" class="far fa-ellipsis-h"></i>
													</button>
												</button>
												<ul class="el-dropdown-menu el-popper"
													id="dropdown-menu-9364" style="display: none;">
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->삭제
													</li>
													<li tabindex="-1" class="el-dropdown-menu__item">
														<!---->이름 변경
													</li>
												</ul>
											</div></a>
									</div>
								</div>
								<div class="menu-item">
									<a href="/shared/untagged" class="link"><span
										class="before-icon"><i class="fas fa-tag"></i></span><span
										class="name">미등록 태그</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr class="divider">
				<div class="menu-item">
					<a href="/trash" class="link pl-10"><span class="before-icon"><i
							class="fas fa-trash-alt"></i></span><span class="name collpase-name">휴지통</span></a>
				</div>
			</nav>
		</div>
		<div class="vb-dragger"
			style="position: absolute; height: 0px; top: 0px;">
			<div class="vb-dragger-styler"></div>
		</div>
	</div>
	<div data-v-3c90b7b0="" class="el-dialog__wrapper"
		style="display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog"
			class="el-dialog lg add-address new-dark-layer"
			style="margin-top: 15vh;">
			<div class="el-dialog__header">
				<div data-v-3c90b7b0="">
					<span data-v-3c90b7b0="" class="modal-title">주소 추가</span>
					<!---->
					<!---->
				</div>
				<button type="button" aria-label="Close"
					class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<!---->
			<div class="el-dialog__footer">
				<div data-v-3c90b7b0="" class="dialog-footer clearfix">
					<div data-v-3c90b7b0="">
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-left cancel-button secondary">
							<!---->
							<span data-v-f8d3258e="" class="label">취소</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							disabled="disabled"
							class="hw-button float-right filled-button primary">
							<!---->
							<span data-v-f8d3258e="" class="label">저장 후 계속 추가</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							disabled="disabled"
							class="hw-button float-right filled-button primary">
							<!---->
							<span data-v-f8d3258e="" class="label">저장</span>
							<!---->
						</button>
					</div>
					<div data-v-3c90b7b0="" style="display: none;">
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-left destructive-button info">
							<!---->
							<span data-v-f8d3258e="" class="label">삭제</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							disabled="disabled"
							class="hw-button float-right ml-10 filled-button primary">
							<!---->
							<span data-v-f8d3258e="" class="label">수정</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-right cancel-button secondary">
							<!---->
							<span data-v-f8d3258e="" class="label">취소</span>
							<!---->
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div data-v-a3178e54="" class="el-dialog__wrapper"
		style="display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog"
			class="el-dialog md" style="margin-top: 15vh; width: 400px;">
			<div class="el-dialog__header">
				<div data-v-a3178e54="" class="modal-title">
					<span data-v-a3178e54="">태그 만들기</span>
				</div>
				<button type="button" aria-label="Close"
					class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<!---->
			<div class="el-dialog__footer">
				<div data-v-a3178e54="" class="dialog-footer">
					<button data-v-f8d3258e="" data-v-a3178e54="" type="button"
						class="hw-button secondary">
						<!---->
						<span data-v-f8d3258e="" class="label">취소</span>
						<!---->
					</button>
					<button data-v-f8d3258e="" data-v-a3178e54="" type="button"
						disabled="disabled" class="hw-button primary">
						<!---->
						<span data-v-f8d3258e="" class="label">저장</span>
						<!---->
					</button>
				</div>
			</div>
		</div>
	</div>
	<div data-v-4e967ea4="" class="el-dialog__wrapper"
		style="display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog"
			class="el-dialog md" style="margin-top: 15vh; width: 400px;">
			<div class="el-dialog__header">
				<div data-v-4e967ea4="" class="modal-title">
					<span data-v-4e967ea4="" class="modal-title">태그 이름 변경</span>
				</div>
				<button type="button" aria-label="Close"
					class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<!---->
			<div class="el-dialog__footer">
				<div data-v-4e967ea4="" class="dialog-footer">
					<button data-v-f8d3258e="" data-v-4e967ea4="" type="button"
						class="hw-button secondary">
						<!---->
						<span data-v-f8d3258e="" class="label">취소</span>
						<!---->
					</button>
					<button data-v-f8d3258e="" data-v-4e967ea4="" type="button"
						disabled="disabled" class="hw-button primary">
						<!---->
						<span data-v-f8d3258e="" class="label">수정</span>
						<!---->
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="el-dialog__wrapper" style="display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog"
			class="el-dialog md delete-private-tag new-dark-layer"
			style="margin-top: 15vh; width: 400px;">
			<div class="el-dialog__header">
				<div class="modal-title">
					<span class="modal-title"> 태그를 삭제 하시겠습니까?<br>삭제 방법을
						선택하세요.
					</span>
				</div>
				<button type="button" aria-label="Close"
					class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<!---->
			<div class="el-dialog__footer">
				<div class="dialog-footer">
					<button data-v-f8d3258e="" type="button"
						class="hw-button cancel-button secondary">
						<!---->
						<span data-v-f8d3258e="" class="label">취소</span>
						<!---->
					</button>
					<button data-v-f8d3258e="" type="button"
						class="hw-button destructive-button info">
						<!---->
						<span data-v-f8d3258e="" class="label">삭제</span>
						<!---->
					</button>
				</div>
			</div>
		</div>
	</div>
	<div data-v-225858ee="" class="el-dialog__wrapper"
		style="display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog"
			class="el-dialog md delete-share-tag new-dark-layer"
			style="margin-top: 15vh; width: 600px;">
			<div class="el-dialog__header">
				<div data-v-225858ee="" class="modal-title">태그 삭제</div>
				<button type="button" aria-label="Close"
					class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<!---->
			<div class="el-dialog__footer">
				<div data-v-225858ee="" class="dialog-footer">
					<button data-v-f8d3258e="" data-v-225858ee="" type="button"
						class="hw-button cancel-button secondary">
						<!---->
						<span data-v-f8d3258e="" class="label">취소</span>
						<!---->
					</button>
					<button data-v-f8d3258e="" data-v-225858ee="" type="button"
						class="hw-button destructive-button info">
						<!---->
						<span data-v-f8d3258e="" class="label">삭제</span>
						<!---->
					</button>
				</div>
			</div>
		</div>
	</div>
</div>