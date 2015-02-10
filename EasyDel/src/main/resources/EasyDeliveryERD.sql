
/* Drop Views */

DROP VIEW titles;



/* Drop Triggers */

DROP TRIGGER TRI_address_dongs_dong_id;
DROP TRIGGER TRI_alert_logs_alert_id;
DROP TRIGGER TRI_edmoney_logs_log_id;
DROP TRIGGER TRI_Reports_report_id;
DROP TRIGGER TRI_Requests_request_id;
DROP TRIGGER TRI_request_cmts_cmt_id;



/* Drop Tables */

DROP TABLE Sender_Evals CASCADE CONSTRAINTS;
DROP TABLE Courier_Evals CASCADE CONSTRAINTS;
DROP TABLE Complete_Deliverys CASCADE CONSTRAINTS;
DROP TABLE request_cmts CASCADE CONSTRAINTS;
DROP TABLE Requests CASCADE CONSTRAINTS;
DROP TABLE address_dongs CASCADE CONSTRAINTS;
DROP TABLE address_gus CASCADE CONSTRAINTS;
DROP TABLE alert_logs CASCADE CONSTRAINTS;
DROP TABLE edmoney_logs CASCADE CONSTRAINTS;
DROP TABLE Reports CASCADE CONSTRAINTS;
DROP TABLE report_type CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_address_dongs_dong_id;
DROP SEQUENCE SEQ_alert_logs_alert_id;
DROP SEQUENCE SEQ_edmoney_logs_log_id;
DROP SEQUENCE SEQ_Reports_report_id;
DROP SEQUENCE SEQ_Requests_request_id;
DROP SEQUENCE SEQ_request_cmts_cmt_id;




/* Create Sequences */

CREATE SEQUENCE SEQ_address_dongs_dong_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_alert_logs_alert_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_edmoney_logs_log_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reports_report_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Requests_request_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_request_cmts_cmt_id INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE address_dongs
(
	dong_id number NOT NULL,
	gu_description varchar2(20) NOT NULL,
	dong_desc varchar2(20) NOT NULL,
	coordinate_x number NOT NULL,
	coordinate_y number NOT NULL,
	PRIMARY KEY (dong_id)
);


CREATE TABLE address_gus
(
	gu_name varchar2(20) NOT NULL,
	PRIMARY KEY (gu_name)
);


CREATE TABLE alert_logs
(
	alert_id number NOT NULL,
	user_id varchar2(10) NOT NULL,
	alert_comment varchar2(50) NOT NULL,
	-- 0 - 시스템 로그
	-- 1 - 발송인 로그
	-- 2 - 운송인 로그
	alert_status char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (alert_id)
);


CREATE TABLE Complete_Deliverys
(
	request_id number NOT NULL,
	finish_time date DEFAULT SYSDATE NOT NULL,
	-- 1 - 배송자평가 안함
	-- 2 - 배송자평가 완료
	courier_evalstatus number DEFAULT 1 NOT NULL,
	-- 1-평가안함
	-- 2-평가완료
	sender_evalstatus number DEFAULT 1 NOT NULL,
	PRIMARY KEY (request_id)
);


CREATE TABLE Courier_Evals
(
	request_id number NOT NULL,
	courier_id varchar2(10) NOT NULL,
	courier_cmt varchar2(300),
	PRIMARY KEY (request_id)
);


CREATE TABLE edmoney_logs
(
	log_id number NOT NULL,
	user_id varchar2(10) NOT NULL,
	withdraw_amount number NOT NULL,
	action_date date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (log_id)
);


CREATE TABLE Reports
(
	-- 신고건
	report_id number NOT NULL,
	-- 1 - 욕설 및 언어폭력
	-- 2 - 불법 화물
	-- 3 - 음란물/스팸성 게시글
	-- 4 - 수수료 미결재
	-- 5 - 기타
	report_type number NOT NULL,
	report_cmt varchar2(500),
	PRIMARY KEY (report_id)
);


CREATE TABLE report_type
(
	report_type number NOT NULL,
	report_type_desc varchar2(30),
	PRIMARY KEY (report_type)
);


CREATE TABLE Requests
(
	request_id number NOT NULL,
	sender_id varchar2(10) NOT NULL,
	courier_id varchar2(10),
	-- 0 - 일반 운송
	-- 1 - 구매 후 운송
	request_type char(1) DEFAULT '0' NOT NULL,
	-- 1 - 의뢰글
	-- 2 - 의뢰대기중
	-- 3 - 의뢰진행
	-- 4 - 운송완료
	-- 5 - 거래완료
	-- 6 - 발송인이 취소요청
	-- 7 - 운송인이 취소요청
	request_Status number DEFAULT 1 NOT NULL,
	cargo_name varchar2(40) NOT NULL,
	delivery_price number NOT NULL,
	cargo_picture varchar2(30),
	cargo_desc varchar2(200) NOT NULL,
	sender_phone varchar2(11),
	pickup_min_time date,
	pickup_max_time date,
	pickup_place number NOT NULL,
	pickup_place_desc varchar2(30),
	receiver_name varchar2(5) NOT NULL,
	receiver_phone varchar2(11) NOT NULL,
	arrival_min_time date NOT NULL,
	arrival_max_time date NOT NULL,
	arrival_place number NOT NULL,
	arrival_place_desc varchar2(30) NOT NULL,
	absence_message varchar2(50),
	validation_code number,
	-- 신고건
	report_satus number,
	-- 글의 소멸 일자를 저장한다.
	-- 거래 완료 상태가 되면, 완료 후 7일 후에 지운다.
	expire_date date NOT NULL,
	PRIMARY KEY (request_id)
);


CREATE TABLE request_cmts
(
	cmt_id number NOT NULL,
	request_id number NOT NULL,
	user_id varchar2(10) NOT NULL,
	reply_text varchar2(200),
	-- 텍스트(주소)
	reply_picture varchar2(300),
	PRIMARY KEY (cmt_id)
);


CREATE TABLE Sender_Evals
(
	request_id number NOT NULL,
	sender_id varchar2(10) NOT NULL,
	sender_cmt varchar2(300),
	PRIMARY KEY (request_id)
);


CREATE TABLE Users
(
	user_id varchar2(10) NOT NULL,
	user_name varchar2(20) NOT NULL,
	user_password varchar2(10) NOT NULL,
	-- 1: 남자
	-- 2: 여자
	user_gender char(1) NOT NULL,
	user_email varchar2(30) NOT NULL,
	-- 미성년자(1996년생 이하 가입불가)
	user_birthdate date NOT NULL,
	user_phone varchar2(11) NOT NULL,
	user_picture varchar2(30),
	edmoney_balance number DEFAULT 0 NOT NULL,
	courier_avg_time number DEFAULT 0 NOT NULL,
	courier_avg_kind number DEFAULT 0 NOT NULL,
	courier_avg_safe number DEFAULT 0 NOT NULL,
	courier_totalcnt number DEFAULT 0 NOT NULL,
	courier_successcnt number DEFAULT 0 NOT NULL,
	sender_avg_time number DEFAULT 0 NOT NULL,
	sender_avg_kind number DEFAULT 0 NOT NULL,
	sender_avg_thing number DEFAULT 0 NOT NULL,
	sender_totalcnt number DEFAULT 0 NOT NULL,
	sender_successcnt number DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE Requests
	ADD FOREIGN KEY (pickup_place)
	REFERENCES address_dongs (dong_id)
;


ALTER TABLE Requests
	ADD FOREIGN KEY (arrival_place)
	REFERENCES address_dongs (dong_id)
;


ALTER TABLE address_dongs
	ADD FOREIGN KEY (gu_description)
	REFERENCES address_gus (gu_name)
;


ALTER TABLE Sender_Evals
	ADD FOREIGN KEY (request_id)
	REFERENCES Complete_Deliverys (request_id)
;


ALTER TABLE Courier_Evals
	ADD FOREIGN KEY (request_id)
	REFERENCES Complete_Deliverys (request_id)
;


ALTER TABLE Requests
	ADD FOREIGN KEY (report_satus)
	REFERENCES Reports (report_id)
;


ALTER TABLE Reports
	ADD FOREIGN KEY (report_type)
	REFERENCES report_type (report_type)
;


ALTER TABLE Complete_Deliverys
	ADD FOREIGN KEY (request_id)
	REFERENCES Requests (request_id)
;


ALTER TABLE request_cmts
	ADD FOREIGN KEY (request_id)
	REFERENCES Requests (request_id)
;


ALTER TABLE Courier_Evals
	ADD FOREIGN KEY (courier_id)
	REFERENCES Users (user_id)
;


ALTER TABLE Requests
	ADD FOREIGN KEY (courier_id)
	REFERENCES Users (user_id)
;


ALTER TABLE Sender_Evals
	ADD FOREIGN KEY (sender_id)
	REFERENCES Users (user_id)
;


ALTER TABLE Requests
	ADD FOREIGN KEY (sender_id)
	REFERENCES Users (user_id)
;


ALTER TABLE alert_logs
	ADD FOREIGN KEY (user_id)
	REFERENCES Users (user_id)
;


ALTER TABLE edmoney_logs
	ADD FOREIGN KEY (user_id)
	REFERENCES Users (user_id)
;


ALTER TABLE request_cmts
	ADD FOREIGN KEY (user_id)
	REFERENCES Users (user_id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_address_dongs_dong_id BEFORE INSERT ON address_dongs
FOR EACH ROW
BEGIN
	SELECT SEQ_address_dongs_dong_id.nextval
	INTO :new.dong_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_alert_logs_alert_id BEFORE INSERT ON alert_logs
FOR EACH ROW
BEGIN
	SELECT SEQ_alert_logs_alert_id.nextval
	INTO :new.alert_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_edmoney_logs_log_id BEFORE INSERT ON edmoney_logs
FOR EACH ROW
BEGIN
	SELECT SEQ_edmoney_logs_log_id.nextval
	INTO :new.log_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Reports_report_id BEFORE INSERT ON Reports
FOR EACH ROW
BEGIN
	SELECT SEQ_Reports_report_id.nextval
	INTO :new.report_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_Requests_request_id BEFORE INSERT ON Requests
FOR EACH ROW
BEGIN
	SELECT SEQ_Requests_request_id.nextval
	INTO :new.request_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_request_cmts_cmt_id BEFORE INSERT ON request_cmts
FOR EACH ROW
BEGIN
	SELECT SEQ_request_cmts_cmt_id.nextval
	INTO :new.cmt_id
	FROM dual;
END;

/




/* Create Views */

CREATE OR REPLACE VIEW titles AS select          R.request_id                   as request_id,
                  R.request_type               as request_type,
                  R.request_status             as request_status,
                  R.cargo_name                as cargo_name,
                  R.sender_id                   as sender_id,
                  ((U.sender_avg_time + U.sender_avg_kind + U.sender_avg_thing) / 3) as sender_avg,
                  A1.gu_description          as pick_up_gu,
                  A1.dong_desc                as pick_up_dong,
                  A1.coordinate_x             as pick_up_addr_x,
                  A1.coordinate_y             as pick_up_addr_y,
                  A2.gu_description          as arrival_place_gu,
                  A2.dong_desc                as arrival_place_dong,
                  A2.coordinate_x             as arrival_place_addr_x,
                  A2.coordinate_y             as arrival_place_addr_y,
                  R.delivery_price              as delivery_price,
                  R.expire_date                 as expire_date
from           REQUESTS R
left join       USERS U
on              R.sender_id=U.user_id
left join       ADDRESS_DONGS A1
on              R.pickup_place=A1.dong_id
left join       ADDRESS_DONGS A2
on              R.arrival_place=A2.dong_id
where         R.request_status <= 3;



/* Comments */

COMMENT ON COLUMN alert_logs.alert_status IS '0 - 시스템 로그
1 - 발송인 로그
2 - 운송인 로그';
COMMENT ON COLUMN Complete_Deliverys.courier_evalstatus IS '1 - 배송자평가 안함
2 - 배송자평가 완료';
COMMENT ON COLUMN Complete_Deliverys.sender_evalstatus IS '1-평가안함
2-평가완료';
COMMENT ON COLUMN Reports.report_id IS '신고건';
COMMENT ON COLUMN Reports.report_type IS '1 - 욕설 및 언어폭력
2 - 불법 화물
3 - 음란물/스팸성 게시글
4 - 수수료 미결재
5 - 기타';
COMMENT ON COLUMN Requests.request_type IS '0 - 일반 운송
1 - 구매 후 운송';
COMMENT ON COLUMN Requests.request_Status IS '1 - 의뢰글
2 - 의뢰대기중
3 - 의뢰진행
4 - 운송완료
5 - 거래완료
6 - 발송인이 취소요청
7 - 운송인이 취소요청';
COMMENT ON COLUMN Requests.report_satus IS '신고건';
COMMENT ON COLUMN Requests.expire_date IS '글의 소멸 일자를 저장한다.
거래 완료 상태가 되면, 완료 후 7일 후에 지운다.';
COMMENT ON COLUMN request_cmts.reply_picture IS '텍스트(주소)';
COMMENT ON COLUMN Users.user_gender IS '1: 남자
2: 여자';
COMMENT ON COLUMN Users.user_birthdate IS '미성년자(1996년생 이하 가입불가)';



