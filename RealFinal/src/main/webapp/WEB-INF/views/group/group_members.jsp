<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>








<div class="split-item right">
	<div class="contents-wrap">
		<div data-v-6266692f="" id="MembersView" class="contents-wrapper">
			<div data-v-6266692f="" class="contents-top">
				<div data-v-6266692f="" class="title-wrapper">
					<span data-v-6266692f="" class="title">멤버</span><span
						data-v-6266692f="" class="count">(5)</span>
				</div>
				<div data-v-6266692f="" class="top-controller">
					<div data-v-6266692f="" class="search">
						<!---->
					</div>
					<%-- 아래는 검색 아이콘 눌렸을 때 나오는 긴 인풋
								<div data-v-6266692f="" class="search searching">
									<div data-v-6266692f="" class="hw-input-wrap icon left inline">
										<i data-v-6266692f="" class="gi gi-search"></i><input
											data-v-6266692f="" placeholder="멤버 검색" class="hw-input icon">
									</div>
								</div>
								--%>
					<div data-v-6266692f="" class="divide-vertical"></div>
					<div data-v-6266692f="" class="controll-btn">
						<div data-v-6266692f="" class="hw-button icon">
							<span data-v-6266692f="" class="icon left"><i
								data-v-6266692f="" class="gi gi-plus"></i></span>
							<div data-v-6266692f="" class="label">멤버추가</div>
						</div>
					</div>
				</div>
			</div>
			<div data-v-6266692f="" class="contents-body">
				<div data-v-6266692f="" class="member-list-wrapper">
					<!---->
					<div data-v-6266692f="" class="member-list">
						<div data-v-6266692f="" class="member-item card">
							<div data-v-6266692f="" class="card-top">
								<div data-v-6266692f="" class="hw-button icon circle">
									<i data-v-6266692f="" class="gis gi-ellipsis-h"></i>
								</div>
							</div>
							<div data-v-6266692f="" class="card-wrapper">
								<div data-v-6266692f="" class="card-contents">
									<div data-v-6266692f="" class="member-profile thumb circle">
										<img data-v-6266692f=""
											src="https://account-api.office.hiworks.com/profile-image/users/7870902">
									</div>
									<div data-v-6266692f="" class="member-info">
										<div data-v-6266692f="" class="name">
											대표이사
											<div data-v-6266692f="" class="role role-OWNER">
												<span data-v-6266692f="">소유자</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div data-v-6266692f="" class="member-item card">
							<div data-v-6266692f="" class="card-top">
								<div data-v-6266692f="" class="hw-button icon circle">
									<i data-v-6266692f="" class="gis gi-ellipsis-h"></i>
								</div>
							</div>
							<div data-v-6266692f="" class="card-wrapper">
								<div data-v-6266692f="" class="card-contents">
									<div data-v-6266692f="" class="member-profile thumb circle">
										<img data-v-6266692f=""
											src="https://account-api.office.hiworks.com/profile-image/users/7870926">
									</div>
									<div data-v-6266692f="" class="member-info">
										<div data-v-6266692f="" class="name">안주임</div>
									</div>
								</div>
							</div>
						</div>
						<div data-v-6266692f="" class="member-item card">
							<div data-v-6266692f="" class="card-top">
								<div data-v-6266692f="" class="hw-button icon circle">
									<i data-v-6266692f="" class="gis gi-ellipsis-h"></i>
								</div>
							</div>
							<div data-v-6266692f="" class="card-wrapper">
								<div data-v-6266692f="" class="card-contents">
									<div data-v-6266692f="" class="member-profile thumb circle">
										<img data-v-6266692f=""
											src="https://account-api.office.hiworks.com/profile-image/users/7870914">
									</div>
									<div data-v-6266692f="" class="member-info">
										<div data-v-6266692f="" class="name">오부장</div>
									</div>
								</div>
							</div>
						</div>
						<div data-v-6266692f="" class="member-item card">
							<div data-v-6266692f="" class="card-top">
								<div data-v-6266692f="" class="hw-button icon circle">
									<i data-v-6266692f="" class="gis gi-ellipsis-h"></i>
								</div>
							</div>
							<div data-v-6266692f="" class="card-wrapper">
								<div data-v-6266692f="" class="card-contents">
									<div data-v-6266692f="" class="member-profile thumb circle">
										<img data-v-6266692f=""
											src="https://account-api.office.hiworks.com/profile-image/users/7870917">
									</div>
									<div data-v-6266692f="" class="member-info">
										<div data-v-6266692f="" class="name">조차장</div>
									</div>
								</div>
							</div>
						</div>
						<div data-v-6266692f="" class="member-item card">
							<div data-v-6266692f="" class="card-top">
								<div data-v-6266692f="" class="hw-button icon circle">
									<i data-v-6266692f="" class="gis gi-ellipsis-h"></i>
								</div>
							</div>
							<div data-v-6266692f="" class="card-wrapper">
								<div data-v-6266692f="" class="card-contents">
									<div data-v-6266692f="" class="member-profile thumb circle">
										<img data-v-6266692f=""
											src="https://account-api.office.hiworks.com/profile-image/users/7870932">
									</div>
									<div data-v-6266692f="" class="member-info">
										<div data-v-6266692f="" class="name">주알바</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!---->
				<div data-v-6266692f="" class="context-wrapper">
					<div data-v-6266692f="" class="contents-dialog">
						<div class="dialog bottom start"
							style="top: 145px; left: 504px; width: 200px;">
							<!-- 
										<div class="context-menu dropdown-menu">
											<div class="context-group dropdown-items-group">
												
												<div class="context-item">
													<div class="item-wrapper">
														<div class="item-title">
															
															<span>관리자에서 제외</span>
														</div>
														
													</div>
												</div>
												<div class="context-item">
													<div class="item-wrapper">
														<div class="item-title">
															
															<span>그룹 탈퇴 처리</span>
														</div>
														
													</div>
												</div>
											</div>
										</div>
										 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>