#DROP TABLE IF EXISTS qna;

-- UTF-8(utf8mb4) 인코딩 설정으로 스키마 생성
CREATE DATABASE IF NOT EXISTS homepick
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

-- 생성된 스키마 사용
USE homepick;

-- qna --
CREATE TABLE qna (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT '대기중', -- '대기중' 또는 '답변완료'
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) AUTO_ID_CACHE 1; 


-- 회원가입 --
CREATE TABLE member (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    role VARCHAR(20) DEFAULT 'ROLE_USER',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) AUTO_ID_CACHE 1;

-- 테스트용 초기 데이터 3건
INSERT INTO qna (title, content, writer) VALUES
('직접 방문 상담 가능한가요?', '강남구 매물 보고 있는데 오프라인 사무실 방문 상담도 가능한지 문의드립니다.', 'user01'),
('전세자금대출 가능 여부 확인', '마포구 투룸 매물 전세자금대출(버팀목) 신청 가능한 집인지 궁금합니다.', 'home_seeker'),
('매물 등록 방법 문의', '집주인입니다. 아파트 매매 매물을 직접 등록하려면 어떤 서류가 필요한가요?', 'owner99'),
('주차 공간 관련 질문', '등록되어 있는 빌라 매물에 세대당 1대 지정주차가 가능한지 확인 부탁드립니다.', 'car_owner'),
('반려동물 입주 가능 여부', '원룸 매물 중 강아지(소형견) 사육이 가능한 곳만 필터링해서 볼 수 있나요?', 'pet_love'),
('허위매물 신고 절차', '방금 확인한 매물이 이미 계약 완료되었다고 하는데, 허위매물 신고는 어떻게 하나요?', 'clean_user'),
('중개수수료 할인 이벤트 문의', '신규 가입 시 제공되는 중개수수료 할인 쿠폰 적용 범위를 알고 싶습니다.', 'discount_search'),
('집 구경(집보기) 예약 변경', '내일 오후 3시로 예약한 오피스텔 방문 시간을 오후 5시로 변경할 수 있을까요?', 'time_flex'),
('관리비 포함 내역 문의', '월세 50/50 매물의 관리비 10만 원에 청소비와 인터넷이 포함되어 있나요?', 'money_check'),
('옵션 가전제품 상태 확인', '옵션으로 제공되는 에어컨과 세탁기 제조 연도나 상태를 미리 알 수 있나요?', 'option_master'),
('단기 임대 매물도 있나요?', '3개월 정도 출장으로 거주할 예정인데 단기 임대 가능한 매물도 조회 가능한가요?', 'short_term'),
('계약금 입금 시 주의사항', '마음에 드는 매물이 있어서 가계약금을 넣으려고 하는데 안전하게 거래하는 팁이 있나요?', 'safe_deal'),
('입주 지정일 연기 가능 여부', '신축 아파트 첫 입주인데 입주 지정일을 한 달 정도 뒤로 미룰 수 있는지 궁금합니다.', 'new_house'),
('상가 매물 권리금 문의', '홍대입구역 근처 1층 상가 매물 권리금 협상이 가능한지 중개사님께 문의드립니다.', 'store_owner'),
('등기부등본 무료 열람', '앱에서 매물 상세페이지를 볼 때 등기부등본도 바로 확인할 수 있나요?', 'check_doc'),
('입주 전 청소 서비스', '계약 후 입주 청소나 방역 서비스를 연계해 주는 제도가 있는지 문의합니다.', 'clean_house'),
('오피스텔 전입신고 가능 여부', '주거용 오피스텔 매물 전입신고 및 확정일자 받는 데 문제없는 매물인가요?', 'tax_free'),
('알림 설정 방법', '원하는 조건(역세권, 보증금 1억 이하)의 매물이 올라왔을 때 푸시 알림을 받을 수 있나요?', 'push_alarm'),
('중개사 회원가입 절차', '공인중개사 사무소 대표입니다. 파트너 중개사로 등록하려면 어떻게 해야 하나요?', 'realtor_kim'),
('비밀번호 찾기 오류', '계정 비밀번호 재설정 이메일이 오지 않는데 확인해 주실 수 있나요?', 'user_help');
SELECT * FROM qna