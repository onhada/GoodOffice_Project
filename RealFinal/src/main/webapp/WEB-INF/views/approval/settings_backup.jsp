<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contents">
	<div class="setting_title">
		<h3>문서 백업</h3>
	</div>
	<div class="content_inbox approval-admin">
		<!-- Contents -->
		<div class="cont_box">
			<button type="button" id="test"></button>
			<!-- Contents -->
			<div class="setting_field approval">
				<form action="">
					<fieldset>
						<table class="tableType01 table-backup-form">
							<caption>결재 등록 양식 리스트</caption>
							<colgroup>
								<col>
								<col>
								<col style="width: 120px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">문서 구분</th>
									<th scope="col">문서 수</th>
									<th scope="col">백업</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>결재 중</td>
									<td class="center">1</td>
									<td id="btn_approval_progress"><button type="button"
											class="weakblue"
											onclick="ApprovalBackup.showBackupLayer('I', 'request', '');">백업</button></td>
								</tr>
								<tr>
									<td>결재 완료</td>
									<td class="center">1</td>
									<td id="btn_approval_complete"><button type="button"
											class="weakblue"
											onclick="ApprovalBackup.showBackupLayer('C', 'else', '50959');">백업
											확인</button></td>
								</tr>
								<tr>
									<td>삭제</td>
									<td class="center">1</td>
									<td id="btn_approval_delete"><button type="button"
											class="weakblue"
											onclick="ApprovalBackup.showBackupLayer('D', 'request', '');">백업</button></td>
								</tr>
								<tr>
									<td>전체</td>
									<td class="center">3</td>
									<td id="btn_approval_all"><button type="button"
											class="weakblue"
											onclick="ApprovalBackup.showBackupLayer('A', 'request', '');">백업</button></td>
								</tr>
							</tbody>
						</table>
						<ul class="backup-txt">
							<li>ㆍ 백업 중에 문서를 작성하거나 삭제하면, 백업된 파일이 실제 데이터와 다를 수 있습니다.</li>
							<li>ㆍ 백업: 클릭 시 백업 파일 수집이 시작됩니다.</li>
							<li>ㆍ 백업 파일 생성 중: 최대 24시간이 소요되며, 준비가 완료되면 백업할 때 작성하신 안내 메일
								주소로 발송됩니다.</li>
							<li>ㆍ 다운로드 : 다운로드는 3일간 활성화됩니다. 3일이 지난 후에는 다운로드 버튼이 사라지며,
								재다운로드를 원하시면 다시 백업을 시도하세요.<br> &nbsp;&nbsp;&nbsp; 파일은
								브라우저상에서 바로 확인할 수 있는 Html 형식으로 제공됩니다.
							</li>
							<li>ㆍ 문서 백업 시 급여지급 품의는 제외 후 백업 됩니다.</li>
						</ul>

						<h4>백업 이력</h4>
						<p style="padding-bottom: 20px;">문서 백업은 관리자만 가능하며, 모든 관리자의
							다운로드 이력을 살펴볼 수 있습니다.</p>

						<table class="tableType01" id="tableApprovalBackupList">
							<caption>백업 이력 목록</caption>
							<colgroup>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th scope="col">이름</th>
									<th scope="col">아이디</th>
									<th scope="col">구분</th>
									<th scope="col">기간</th>
									<th scope="col">기안자</th>
									<th scope="col">메일 주소</th>
									<th scope="col">요청 시각</th>
									<th scope="col">결과</th>
								</tr>
								<tr>
									<td>대표이사</td>
									<td>ceo</td>
									<td>결재 완료</td>
									<td>전체</td>
									<td>전체</td>
									<td>gfhghrt@gmail.com</td>
									<td class="center">2023-12-03 10:36:06</td>
									<td>백업완료</td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>

						<!-- page nav -->
						<div class="listbottom bt0">
							<div class="paginate">
								<span class="paging_numbers"><strong><span
										class="blind">현재 페이지 : </span>1</strong></span>
							</div>
						</div>
						<!-- //page nav -->
					</fieldset>
				</form>
			</div>

		</div>
	</div>

</div>
