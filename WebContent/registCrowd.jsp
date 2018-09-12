<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
  

<div class="modal fade" id="addCrowd" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<a class="navbar-brand js-scroll-trigger">FANDOM-모금 추가</a>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form id="facilityform"
				style="padding-top: 30px; padding-bottom: 30px">
				<div class="modal-body">
					<div class="container">
						<div class="form-group">
							<label>아이돌 이름</label> <input type="text" class="form-control"
								name="f_name" placeholder="아이돌 이름">
						</div>

						<div class="form-group">
							<label>모금 이름</label> <input type="text" class="form-control"
								id="" name="f_address" placeholder="모금 이름">
						</div>
						<div class="form-group">
							<label>모금 내용</label> <input type="text" class="form-control"
								id="" name="f_tel" placeholder="모금 내용">
						</div>

						<div class="form-group">
							<label>목표 가격</label> <input type="number" class="form-control" min="0" step="10000"
								id="" name="f_price" placeholder="목표 가격">
						</div>

						<div class="form-group">
							<label>기간(시간 단위)</label> <input type="number" class="form-control"
								id="" name="f_opentime" placeholder="기간">
						</div>

						<div class="form-group">
							<label for="exampleInputFile">파일 업로드(800x800)</label> <input type="file" min="0"
								id="exampleInputFile" name="img">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					
					<button class="btn btn-primary" id="facilityadd" type="submit">추가</button>
					<button class="btn btn-secondary" type="reset"
						data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
