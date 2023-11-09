<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
        <main id="main">
          <section class="sec-1">
            <header>
              <div class="header-item">
                <h2 class="sec-title">학생 개인정보 수정(확인) 안내</h2>
              </div>
              <div class="header-item">
                <ul class="list list-narrow-gutter">
                  <li>
                    <button class="btn btn-icon share-btn" type="button">
                      <img src="/common/images/share.svg" alt="공유">
                    </button>
                  </li>
                  <li>
                    <button class="btn btn-icon print-btn" type="button">
                      <img src="/common/images/print.svg" alt="프린트">
                    </button>
                  </li>
                </ul>
              </div>
            </header>
            <div class="sec-body">
              <!-- 학생정보 -->
              <div class="b-table-box" role="table" aria-label="2단 테이블">
                <div class="b-row-box" role="row">
                  <div class="b-row-item">
                    <div class="b-title-box" role="rowheader">
                      <label>학번(수험번호)</label>
                    </div>
                    <div class="b-con-box" role="cell">
                      202002175
                    </div>
                  </div>
                  <div class="b-row-item">
                    <div class="b-title-box" role="rowheader">
                      <label>이름</label>
                    </div>
                    <div class="b-con-box" role="cell">
                      홍길동
                    </div>
                  </div>                  
                </div>                
              </div>
              <!-- /END 학생정보 -->

              <!-- 학생 개인정보 수정(확인) 안내 -->
              <section class="sec-2">
                <header>
                  <h3 class="sec-title">학생 개인정보 수정(확인) 안내</h3>
                </header>
                <div class="sec-body">
                  <div class="message-box message-box-style-2 mt-1">
                    <div class="message-box-inner">
                      <div class="message-header">
                        <img src="/common/images/message_box_icon_01.svg" alt="">
                      </div>
                      <div class="message-body">
                        <p class="mb-1">
                          <span class="text-danger">학생 개인정보는 장학·학사 업무 등 긴급한 업무연락 시 활용하는 소중한 정보입니다.</span><br>
                          <span class="text-danger">본인의 개인정보가 변경되었을 시 즉시 수정하여 불이익을 받는 사례가 없도록 부탁드립니다.</span><br>
                          <span class="text-danger">[학적 ▶ 학생생활기록부 ▶ 개인정보수정] 메뉴에서도 변경 가능합니다.</span>                          
                        </p>
                        <p class="mb-0">
                          상시운영 기간 : 개학 후 한달동안. 강의평가 기간
                        </p>                        
                      </div>
                    </div>
                  </div>                  
                </div>
              </section>
              <!-- /END 학생 개인정보 수정(확인) 안내 -->

              <!-- 개인정보 수집 및 활용 동의 (*필수) -->
              <section class="sec-2">
                <header>
                  <h3 class="sec-title">개인정보 수집 및 활용 동의 (*필수)</h3>
                </header>
                <div class="sec-body">
                  <div class="message-box mb-3">
                    <div class="message-box-inner">                    
                      <div class="message-body">
                        <p class="mb-1">개인정보 수집 및 활용에 동의해야만 학생지원시스템에 로그인 할 수 있습니다.</p>
                        <p class="text-primary mb-0">※ 동의 거부 시 로그인 시 이용가능한 서비스는 제한됩니다.</p>
                      </div>
                    </div>
                  </div>

                  <div class="accordion mb-4">
                    <div class="card">
                      <div class="card-header" id="heading1">
                        <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">
                          1. 개인정보 수집 및 이용에 대한 동의
                        </button>
                      </div>
                      <div id="collapse1" class="collapse show" aria-labelledby="heading1">
                        <div class="card-body">
                          <ul class="list list-style-1">
                            <li>
                              부산대학교가 취급하는 모든 개인정보는 관련 법령에 근거하여 수집·보유 및 처리됩니다.
                            </li>
                            <li>
                              「공공기관의 개인정보에 관한 법률 및 동법 시행령·시행규칙」, 「공공기관의 개인정보보호를 위한 기본 지침」, 「교육(행정)기관의 개인정보 보호 업무지침 」등에 따라 수집·보유 및 처리하는 개인정보는 교육·학술연구, 학사·행정업무, 공공업무에 적법하고 적정하게 사용될 것입니다.
                            </li>
                            <li>
                              수집된 개인정보는 목적 이외의 다른 용도로는 사용되지 않습니다.
                            </li>
                            <li>
                              수집 근거 : 부산대학교 학사운영규정 제6조(학적부 작성) <a class="link link-style-1" href="#">바로가기</a> 및 개인정보처리방침 <a class="link link-style-1" href="#">바로가기</a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header" id="heading2">                        
                        <button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse2" data-expanded="true" data-controls="collapse2">
                          2. 고유식별정보 처리에 대한 동의
                        </button>
                      </div>
                      <div id="collapse2" class="collapse show" aria-labelledby="heading2">
                        <div class="card-body">
                          <ul class="list list-style-1">
                            <li>대학이 위 목적으로 본인의 고유식별번호(주민등록번호)를 수집, 이용하는 것에 동의합니다.</li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header" id="heading3">
                        <button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse3" data-expanded="true" data-controls="collapse3">
                          3. 제3자 정보 제공
                        </button>
                      </div>
                      <div id="collapse3" class="collapse show" aria-labelledby="heading3">
                        <div class="card-body">
                          <ul class="list list-style-1">
                            <li>부산대학교 개인정보처리방침 제3조 (개인정보의 제3자 제공) <a class="link link-style-1" href="#">바로가기</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="card">
                      <div class="card-header" id="heading4">
                        <button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse4" data-expanded="true" data-controls="collapse4">
                          4. 개인정보 처리 위탁
                        </button>
                      </div>
                      <div id="collapse4" class="collapse show" aria-labelledby="heading4">
                        <div class="card-body">
                          <ul class="list list-style-1">
                            <li>부산대학교 개인정보처리방침 제4조 (개인정보 처리 위탁) <a class="link link-style-1" href="#">바로가기</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="text-right">
                    <p class="mb-1">개인정보 수집 및 활용에 동의해야만 학생지원시스템에 로그인 할 수 있습니다.</p>
                    <p class="text-primary mb-3">※ 동의 거부 시 로그인 시 이용가능한 서비스는 제한됩니다.</p>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="radioGroup1" id="radio1" checked>
                      <label class="form-check-label" for="radio1">개인정보 수집 및 활용에 동의</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="radioGroup1" id="radio2">
                      <label class="form-check-label" for="radio2">개인정보 수집 및 활용에 동의하지 않음</label>
                    </div>                    
                  </div>                  
                </div>
              </section>
              <!-- /END 개인정보 수집 및 활용 동의 (*필수) -->

              <!-- 정보수신에 관한 동의 (선택) -->
              <section class="sec-2 mb-5">
                <header>
                  <h3 class="sec-title">정보수신에 관한 동의 (선택)</h3>
                </header>
                <div class="sec-body">
                  <div class="message-box mb-3">
                    <div class="message-box-inner">                    
                      <div class="message-body">
                        <p class="mb-1">부산대학교에서 전송되는 각종 정보에 대한 휴대전화번호와 E-mail 수신을 아래와 같이 확인합니다.</p>
                        <p class="text-primary mb-0">※ 수신 거부 시 장학생선발, 인터넷 휴·복학, 수강취소, 현금등록, 학자금융자, 취업정보, 학생복지혜택(학생의료공제 신청 등), 국제협력실(유학생지원) 등의 안내정보를 받을 수 없습니다.</p>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="phone1">휴대전화번호</label>
                    <div class="form-row align-items-center">
                      <div class="col-sm-6 col-lg-5 mb-1">
                        <div class="row no-gutters">
                          <div class="col">
                            <input class="form-control" id="phone1" type="number">
                          </div>
                          <div class="col-1 text-center py-1">
                            -
                          </div>
                          <div class="col">
                            <input class="form-control" type="number">
                          </div>
                          <div class="col-1 text-center py-1">
                            -
                          </div>
                          <div class="col">
                            <input class="form-control" type="number">
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-6 col-lg-7 mb-1">
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="radioGroup2" id="radio3" checked>
                          <label class="form-check-label" for="radio3">SMS 수신동의</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="radioGroup2" id="radio4">
                          <label class="form-check-label" for="radio4">SMS 수신거부</label>
                        </div>
                      </div>
                    </div>                                       
                  </div>

                  <div class="form-group">
                    <label for="email1">E-mail</label>
                    <ul class="list list-style-1 mb-3">
                      <li>
                        E-mail 수신동의 시, Daum 메일은 반송처리되는 경우가 많아 권장하지 않습니다.
                      </li>
                      <li>
                        휴대전화번호, E-mail, 수신동의 정보는 <b>[학적 ▶ 학생생활기록부 ▶ 개인정보수정]</b>에서 변경할 수 있습니다.
                      </li>
                    </ul>
                    <div class="form-row align-items-center">
                      <div class="col-sm-6 col-lg-5 mb-1">
                        <input class="form-control" id="email1" type="email">
                      </div>
                      <div class="col-md-6 col-lg-7 mb-1">
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="radioGroup3" id="radio5" checked>
                          <label class="form-check-label" for="radio5">E-mail 수신동의</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="radioGroup3" id="radio6">
                          <label class="form-check-label" for="radio6">E-mail 수신거부</label>
                        </div>
                      </div>
                    </div>
                  </div>                  
                </div>
              </section>
              <!-- /END 정보수신에 관한 동의 (선택) -->

              <div class="text-center mb-4">
                <div class="form-group">
                  <button class="btn btn-primary btn-lg" type="button">개인정보 수정 (확인)</button>
                </div>                              
              </div>
              <ul class="list list-with-separator justify-content-center">
                <li>
                  <b>개인정보수정 관련문의</b> <a class="text-primary" href="tel: 051-510-1213">051) 510-1213</a> 학사과
                </li>
                <li>
                  <b>시스템문의</b> <a class="text-primary" href="tel: 051-510-7469">051) 510-7469</a> 정보화본부
                </li>
              </ul>  
            </div>
          </section>      
        </main>
      </div>