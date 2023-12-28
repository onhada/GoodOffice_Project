-- 오라클 계정 생성을 위해서는 SYS 또는 SYSTEM 으로 연결하여 작업을 해야 합니다. [SYS 시작] --
show user;
-- USER이(가) "SYS"입니다.

-- 오라클 계정 생성시 계정명 앞에 c## 붙이지 않고 생성하도록 하겠습니다.
alter session set "_ORACLE_SCRIPT"=true;
-- Session이(가) 변경되었습니다.

-- 오라클 계정명은 final_orauser2 이고 암호는 gclass 인 사용자 계정을 생성합니다.
create user final_orauser2 identified by gclass default tablespace users; 
-- User FINAL_ORAUSER2이(가) 생성되었습니다.

-- 위에서 생성되어진 final_orauser2 이라는 오라클 일반사용자 계정에게 오라클 서버에 접속이 되어지고,
-- 테이블 생성 등등을 할 수 있도록 여러가지 권한을 부여해주겠습니다.
grant connect, resource, create view, unlimited tablespace to final_orauser2;
-- Grant을(를) 성공했습니다.



/* --------------------------------------------------- */


-- === employee 중 해당 이메일이 존재하는지 확인한다. === --
select empId, email
from tbl_employee
where email ='admin@project.com';





-- #################### 메일쓰기 시작 ################### --

-- === 하나의 메일을 tbl_mail 테이블에 insert ===
-- 원메일인 경우 	
insert into tbl_mail(mailId, subject, mailContent, sendDay, orgMailId)
values(mailSeq.nextval, #{subject}, #{mailContent}, sysdate, default);
/*
insert into tbl_mail(mailId, subject, mailContent, sendDay, orgMailId)
values(mailSeq.nextval, '123', '123', sysdate, default);
*/

-- 답장메일인 경우 (수정필)
/*
insert into tbl_mail(mailId, subject, mailContent, sendDay, orgMailId)
values(mailSeq.nextval, #{subject}, #{mailContent}, sysdate, #{orgMailId});
*/

-- === 메일의 첨부파일 : tbl_mailfile 테이블에 insert ===
insert into tbl_mailfile(fileId, fk_mailId, fileName, fileSize, orgFileName)
values(mailfileSeq.nextval, #{mailId}, #{fileName}, #{fileSize}, #{orgFileName})


-- === 수신메일을 tbl_incomemail 테이블에 insert ===
insert into tbl_incomemail(incomeMailId, fk_mailId, fk_empId, isRead, isImportant, isDelete)
values(incomemailSeq.nextval, #{mailId}, #{incomeEmpId}, default, default, default)


-- === 참조메일을 tbl_referenceMail 테이블에 insert ===
insert into tbl_referencemail(referenceMailId, fk_mailId, fk_empId, isHiddenReference, isImportant, isDelete)
values(refmailSeq.nextval, #{mailId}, #{referenceEmpId}, default, default, default)
   

-- === 숨은참조메일을 tbl_referenceMail 테이블에 insert ===    
insert into tbl_referencemail(referenceMailId, fk_mailId, fk_empId, isHiddenReference, isImportant, isDelete)
values(refmailSeq.nextval, #{mailId}, #{referenceEmpId}, 1, default, default)
   

-- === 발신메일을 tbl_sendMail 테이블에 insert === 
insert into tbl_sendMail(sendMailId, fk_mailId, fk_empId, isDelete, isImportant, isCancel)
values(sendmailSeq.nextval, #{mailId}, #{loginEmpId}, default, default, default)


-- === 임시저장메일을 tbl_tempMail 테이블에 insert === 
insert into tbl_tempMail(tempMailId, fk_mailId, fk_empId, isDelete, isImportant)
values(tempmailSeq.nextval, #{mailId}, #{loginEmpId}, default, default)


-- === 예약메일을 tbl_reservationMail 테이블에 insert ===  
sql문 작성해야함 


-- #################### 메일쓰기 끝 ################### --

SELECT MAILSEQ.NEXTVAL FROM DUAL;
SELECT MAILSEQ.CURRVAL FROM DUAL;



-- #################### 총 게시물 건수(totalCount) 구하기 시작 #################### --

-- 받은편지함
/*
tbl_incomeMail 의 isDelete가 0이어야하며
같은 mailId가 발신메일함인 tbl_sendMail 에 존재해야한다. (join해서 확인)
또한 받은사람의 isRead가 0(읽지않음)인 경우 보낸사람의 보낸편지함에 해당 mailId의 isCancel이 0이어야한다.
또한 받은사람의 isRead가 1(읽음)인 경우 보낸사람 isCancel 값 무관.
*/
select *
from tbl_incomeMail I
join tbl_sendMail S
on I.fk_mailId = S.fk_mailId
where I.fk_empId = 9999 and I.isDelete = 0      -- #{loginEmpId}
      and ( I.isRead = 1
            or (I.isRead = 0 and S.isCancel = 0 ) ); 

select count(*)
from tbl_incomeMail I
join tbl_sendMail S
on I.fk_mailId = S.fk_mailId
where I.fk_empId = 9999 and I.isDelete = 0      -- #{loginEmpId}
      and ( I.isRead = 1
            or (I.isRead = 0 and S.isCancel = 0 ) );


-- 보낸편지함
/*
tbl_sendMail 의 isDelete가 0
*/
select *
from tbl_sendMail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}

select count(*)
from tbl_sendMail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}


-- 보낼편지함 
/*
예약시 -> 하나의 메일, 수신, 예약 테이블에 insert하고 ==> 실제 예약시간에 발송시 예약테이블에서 delete 후 발신메일함 insert
tbl_reservationmail에서 isDelete가 0
*/
select *
from tbl_reservationmail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}

select count(*)
from tbl_reservationmail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}


-- 임시보관함 
/*
tbl_tempmail에서 isDelete가 0
*/
select *
from tbl_tempMail
where fk_empId = 9999 and isDelete = 0 -- #{loginEmpId}

select count(*)
from tbl_tempMail
where fk_empId = 9999 and isDelete = 0 -- #{loginEmpId}


-- 휴지통 
/*
받은
보낸
보낼
임시
개인
*/
select
(   ( -- 받은편지함에서 휴지통으로 
    select count(*)
    from tbl_incomeMail I
    join tbl_sendMail S
    on I.fk_mailId = S.fk_mailId
    where I.fk_empId = 9999 and I.isDelete = 1      -- #{loginEmpId}
          and ( I.isRead = 1
                or (I.isRead = 0 and S.isCancel = 0 ) ) 
    ) 
    +
    ( -- 보낸편지함에서 휴지통으로  
    select count(*)
    from tbl_sendMail
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    ) 
    +
    ( -- 보낼편지함에서 휴지통으로 
    select count(*)
    from tbl_reservationmail
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    )
    +
    ( -- 임시보관함에서 휴지통으로 
    select count(*)
    from tbl_tempMail
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    )
    +
    ( -- 개인편지함에서 휴지통으로 
    select count(*)
    from tbl_personalmailclass
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    )
)   as cnt
from dual;


-- 개인편지함 
select *
from tbl_personalMailClass 
where fk_empId = 9999 and isDelete = 0 and fk_personalMailboxTypeId = 1001;

select count(*)
from tbl_personalMailClass 
where fk_empId = 9999 and isDelete = 0 and fk_personalMailboxTypeId = 1001; -- #{loginEmpId} #{personalMailboxTypeId} 

-- #################### 총 게시물 건수(totalCount) 구하기 끝 #################### --





-- #################### 페이징 처리한 메일목록 가져오기 시작 #################### --
-- @@@ 필요한 값 : empId, empName, email(발신사원), mailId, subject, sendDay, orgMailId, isImportant, fileId
-- @@@ 이메일 주소 : 받는편지함-보낸사람, 개인편지함-보낸사람, 보낸편지함-받는사람, 보낼편지함-받는사람,임시보관함-받는사람 or 보낸사람, 휴지통-어디서 버렸냐에 따라서 다르게  


-- ## 받은메일함인 경우 ## --
SELECT empId, empName, email, mailId, subject, sendDay, orgMailId, isImportant, hasFile
FROM
(
    select rownum AS rno, O.empId as empId, empName, email, O.mailId as mailId, subject, sendDay, orgMailId, isImportant, nvl2(f.fk_mailId, 1, 0) as hasFile
    from
    (
        select I.fk_empId as empId, I.fk_mailId as mailId, I.isImportant
        from tbl_incomeMail I
        join tbl_sendMail S
        on I.fk_mailId = S.fk_mailId
        where I.fk_empId = 9999 and I.isDelete = 0      -- #{loginEmpId}
              and ( I.isRead = 1
                    or (I.isRead = 0 and S.isCancel = 0 ) )
    ) O
    join tbl_employee E
    on O.empId = E.empId
    join tbl_mail M
    on O.mailId = M.mailId
    left join (select fk_mailId from tbl_mailFile group by fk_mailId) F 
    on O.mailId = F.fk_mailId
    order by sendDay desc, mailId desc
)
WHERE RNO between 51 and 60; -- #{startRno} and #{endRno}

SELECT empId, empName, email, mailId, subject, sendDay, orgMailId, isImportant, hasFile
FROM
(
    SELECT rownum AS rno, empId, empName, email, mailId, subject, sendDay, orgMailId, isImportant, hasFile
    FROM
    (
        select O.empId as empId, empName, email, O.mailId as mailId, subject, sendDay, orgMailId, isImportant, nvl2(f.fk_mailId, 1, 0) as hasFile
        from
        (
            select I.fk_empId as empId, I.fk_mailId as mailId, I.isImportant
            from tbl_incomeMail I
            join tbl_sendMail S
            on I.fk_mailId = S.fk_mailId
            where I.fk_empId = 9999 and I.isDelete = 0      -- #{loginEmpId}
                  and ( I.isRead = 1
                        or (I.isRead = 0 and S.isCancel = 0 ) )
        ) O
        join tbl_employee E
        on O.empId = E.empId
        join tbl_mail M
        on O.mailId = M.mailId
        left join (select fk_mailId from tbl_mailFile group by fk_mailId) F 
        on O.mailId = F.fk_mailId
        order by sendDay desc
    )
)    
WHERE RNO between 51 and 60; -- #{startRno} and #{endRno}


-- ## 보낸메일함인 경우 ## --
SELECT empId, empName, email, mailId, subject, sendDay, orgMailId, isImportant, hasFile
FROM(
    select rownum AS rno, O.empId as empId, empName, email, O.mailId as mailId, subject, sendDay, orgMailId, isImportant, nvl2(f.fk_mailId, 1, 0) as hasFile
    from    
    (
        select fk_empId as empId, fk_mailId as mailId, isImportant
        from tbl_sendMail S
        where fk_empId = 9999 and isDelete = 0 -- #{loginEmpId}
    ) O
    join tbl_employee E
    on O.empId = E.empId
    join tbl_mail M
    on O.mailId = M.mailId
    left join (select fk_mailId from tbl_mailFile group by fk_mailId) F 
    on O.mailId = F.fk_mailId
    order by sendDay desc
)
WHERE RNO between 1 and 100; -- #{startRno} and #{endRno}


-- ## 보낼(예약)메일함인 경우 ## --
SELECT empId, empName, email, mailId, subject, sendDay, orgMailId, hasFile
FROM
(
    select rownum as rno, O.empId as empId, empName, email, O.mailId as mailId, subject, sendDay, orgMailId, nvl2(f.fk_mailId, 1, 0) as hasFile
    from
    (
        select fk_empId as empId, fk_mailId as mailId, isImportant
        from tbl_reservationmail
        where fk_empId = 9999 and isDelete = 0 -- #{loginEmpId}
    ) O
    join tbl_employee E
    on O.empId = E.empId
    join tbl_mail M
    on O.mailId = M.mailId
    left join (select fk_mailId from tbl_mailFile group by fk_mailId) F 
    on O.mailId = F.fk_mailId
    order by sendDay desc
)
WHERE RNO between 1 and 10; -- #{startRno} and #{endRno}


-- ## 임시보관함인 경우 ## --
SELECT empId, empName, email, mailId, subject, sendDay, orgMailId, hasFile
FROM
(
    select rownum as rno, O.empId as empId, empName, email, O.mailId as mailId, subject, sendDay, orgMailId, nvl2(f.fk_mailId, 1, 0) as hasFile
    from
    (
        select fk_empId as empId, fk_mailId as mailId, isImportant
        from tbl_tempMail
        where fk_empId = 9999 and isDelete = 0 -- #{loginEmpId}
    ) O
    join tbl_employee E
    on O.empId = E.empId
    join tbl_mail M
    on O.mailId = M.mailId
    left join (select fk_mailId from tbl_mailFile group by fk_mailId) F 
    on O.mailId = F.fk_mailId
    order by sendDay desc
)
WHERE RNO between 1 and 10; -- #{startRno} and #{endRno}


-- ## 휴지통인 경우 ## --
SELECT empId, empName, email, mailId, subject, sendDay, orgMailId, hasFile
FROM
(
    select rownum as rno, O.empId as empId, empName, email, O.mailId as mailId, subject, sendDay, orgMailId, nvl2(f.fk_mailId, 1, 0) as hasFile
    from
    (
        (-- 받은편지함에서 휴지통으로
            select I.fk_empId as empId, I.fk_mailId as mailId, I.isImportant, 'income' as mailType
            from tbl_incomeMail I
            join tbl_sendMail S
            on I.fk_mailId = S.fk_mailId
            where I.fk_empId = 9999 and I.isDelete = 1      -- #{loginEmpId}
                  and ( I.isRead = 1
                        or (I.isRead = 0 and S.isCancel = 0 ) )
        )
        union
        (-- 보낸편지함에서 휴지통으로 
            select fk_empId as empId, fk_mailId as mailId, isImportant
            from tbl_sendMail S
            where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
        )
        union
        (-- 보낼편지함에서 휴지통으로 
            select fk_empId as empId, fk_mailId as mailId, isImportant
            from tbl_reservationmail
            where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
        )
        union
        (-- 임시보관함에서 휴지통으로
            select fk_empId as empId, fk_mailId as mailId, isImportant
            from tbl_tempMail
            where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
        )
        union
        (-- 개인편지함에서 휴지통으로 
            select fk_empId as empId, fk_mailId as mailId, isImportant
            from tbl_personalMailClass 
            where fk_empId = 9999 and isDelete = 1  -- #{loginEmpId} 
        )
    ) O
    join tbl_employee E
    on O.empId = E.empId
    join tbl_mail M
    on O.mailId = M.mailId
    left join (select fk_mailId from tbl_mailFile group by fk_mailId) F 
    on O.mailId = F.fk_mailId
    order by sendDay desc
)
WHERE RNO between 1 and 10; -- #{startRno} and #{endRno}


-- ## 개인메일함인 경우 ## --
SELECT empId, empName, email, mailId, subject, sendDay, orgMailId, hasFile
FROM
(
    select rownum as rno, O.empId as empId, empName, email, O.mailId as mailId, subject, sendDay, orgMailId, nvl2(f.fk_mailId, 1, 0) as hasFile
    from
    (
        select fk_empId as empId, fk_mailId as mailId, isImportant
        from tbl_personalMailClass 
        where fk_empId = 9999 and isDelete = 0 and fk_personalMailboxTypeId = 1001 -- #{loginEmpId} #{personalMailboxTypeId} 
    ) O
    join tbl_employee E
    on O.empId = E.empId
    join tbl_mail M
    on O.mailId = M.mailId
    left join (select fk_mailId from tbl_mailFile group by fk_mailId) F 
    on O.mailId = F.fk_mailId
    order by sendDay desc
)
WHERE RNO between 1 and 10; -- #{startRno} and #{endRno}

-- #################### 페이징 처리한 메일목록 가져오기 끝 #################### --



-- === personalmailboxtype 테이블에서 개인편지함 가져오기 ===
select personalMailboxTypeId, personalMailboxTypeName, fk_empId
from tbl_personalmailboxtype
where fk_empId = 9999
order by personalMailboxTypeId asc;


-- ################### 중요메일 여부 업데이트 시작 ################### --
-- 받은편지함
select *
from tbl_incomeMail 

-- 보낸편지함
/*
tbl_sendMail 의 isDelete가 0
*/
select *
from tbl_sendMail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}

select count(*)
from tbl_sendMail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}


-- 보낼편지함 
/*
예약시 -> 하나의 메일, 수신, 예약 테이블에 insert하고 ==> 실제 예약시간에 발송시 예약테이블에서 delete 후 발신메일함 insert
tbl_reservationmail에서 isDelete가 0
*/
select *
from tbl_reservationmail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}

select count(*)
from tbl_reservationmail
where fk_empId = 9999 and isDelete = 0; -- #{loginEmpId}


-- 임시보관함 
/*
tbl_tempmail에서 isDelete가 0
*/
select *
from tbl_tempMail
where fk_empId = 9999 and isDelete = 0 -- #{loginEmpId}

select count(*)
from tbl_tempMail
where fk_empId = 9999 and isDelete = 0 -- #{loginEmpId}


-- 휴지통 
/*
받은
보낸
보낼
임시
개인
*/
select
(   ( -- 받은편지함에서 휴지통으로 
    select count(*)
    from tbl_incomeMail I
    join tbl_sendMail S
    on I.fk_mailId = S.fk_mailId
    where I.fk_empId = 9999 and I.isDelete = 1      -- #{loginEmpId}
          and ( I.isRead = 1
                or (I.isRead = 0 and S.isCancel = 0 ) ) 
    ) 
    +
    ( -- 보낸편지함에서 휴지통으로  
    select count(*)
    from tbl_sendMail
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    ) 
    +
    ( -- 보낼편지함에서 휴지통으로 
    select count(*)
    from tbl_reservationmail
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    )
    +
    ( -- 임시보관함에서 휴지통으로 
    select count(*)
    from tbl_tempMail
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    )
    +
    ( -- 개인편지함에서 휴지통으로 
    select count(*)
    from tbl_personalmailclass
    where fk_empId = 9999 and isDelete = 1 -- #{loginEmpId}
    )
)   as cnt
from dual;


-- 개인편지함 
select *
from tbl_personalMailClass 
where fk_empId = 9999 and isDelete = 0 and fk_personalMailboxTypeId = 1001;

-- ################### 중요메일 여부 업데이트 끝 ################### --



-- ################### 메일을 휴지통으로 이동하기 시작 ################### --
<update id="moveToTrashbox" parameterType="HashMap">
    <choose>
        <when test='mailType == "1"'>
            update tbl_incomeMail set isDelete = 1
            where fk_mailId = #{mailId}
        </when>	
        <when test='mailType == "2"'>
            update tbl_sendMail set isDelete = 1
            where fk_mailId = #{mailId}
        </when>
        <when test='mailType == "3"'>
            update tbl_reservationmail set isDelete = 1
            where fk_mailId = #{mailId}
        </when>
        <when test='mailType == "4"'>
            update tbl_tempMail set isDelete = 1
            where fk_mailId = #{mailId}
        </when>
        <when test='mailType == "6"'>
            update tbl_personalMailClass set isDelete = 1
            where fk_mailId = #{mailId}
        </when>
    </choose>
</update>
-- ################### 메일을 휴지통으로 이동하기 끝 ################### --



-- ################### 메일 영구삭제하기 시작 ################### --
delete from tbl_sendMail where fk_mailId = 186;

delete from tbl_gogek
  where gogekid = 'hongkd';
-- STS에 쓴 게 맞는 거임 ...
-- ################### 메일 영구삭제하기 끝 ################### --



-- ################### 메일을 개인편지함으로 이동 시작 ################### --



update tbl_mailmemo set memoContent = '메모메일타입변경', mailType = 6
where fk_mailId = 230 and fk_empId = 9999 and mailType = 2;

-- ################### 메일을 개인편지함으로 이동 끝 ################### --



-- ############### 하나의 메일 정보 가져오기 시작 ############### --
-- 필요한 정보 : 메일id, 제목, 내용, 발신날짜, 원메일여부, 메모(메모여부?),
-- 첨부파일갯수, 첨부파일제목,첨부파일크기, 서명(서명여부?),
-- 보낸사람, 받는사람, 참조,-- 보낸사람, 받는사람, 참조,
to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
-- 메일id, 제목, 내용, 발신날짜, 원메일여부, 메모(메모여부?), 서명(서명여부?)????,
select subject, mailContent, sendDay, orgmailId, nvl(M.memoContent, ' ') as memoContent
from
(
    select mailId, subject, to_char(sendDay, 'yyyy-mm-dd hh24:mi:ss') as sendDay, mailContent, orgmailId
    from tbl_mail 
    where mailId = 230 -- #{mailId}
) O
left join tbl_mailMemo M
on O.mailId = M.fk_mailId and M.fk_empId = 9999 and mailType = 6; -- #{loginEmpId}
/*
left join tbl_signature S
on M.fk_empId = S.fk_empId;
*/

이즈임포턴트를 가져와야 하는데, 해당메일아이디에서 fk_empId가 로그인임프아이디
		<when test="메일타입 어쩌구 일경">
		select isImportant
		from tbl_sendMail
		where fk_mailId = 230 and fk_empId = 9999;

select *
from tbl_Mail
where mailId = 247;

-- 첨부파일갯수(갯수는 자바에서 가져와도 될듯?), 첨부파일제목, 첨부파일크기, 
select fileName, fileSize, orgFileName
from tbl_mailFile
where fk_mailId = 220
order by fileId asc;

group by FILEID,
FK_MAILID,
FILENAME,
FILESIZE,
ORGFILENAME;

-- 보낸사람, 받는사람, 참조,-- 보낸사람, 받는사람, 참조,
        -- listagg 사용했을 때 깨지는 경우 해결방법 !!
        -- CAST ( 컬럼 AS VARCHAR(50) ) AS 컬럼명
        
/*-- 보낸사람_str --*/           
select listagg( CAST(sendEmp AS VARCHAR(100)) , ', ') WITHIN GROUP (ORDER BY sendEmp) AS sendEmp_str
from
(
    select ( E.empName || ' ' || E.email ) as sendEmp
    from
    (
        select fk_empId as empId from tbl_sendMail where fk_mailId = 230
    ) O
    join tbl_employee E
    on O.empId = E.empId
)

/*-- 받는사람_str --*/        
select listagg( CAST(incomeEmp AS VARCHAR(100)) , ', ') WITHIN GROUP (ORDER BY incomeEmp) AS incomeEmp_str
from
(
    select ( E.empName || ' ' || E.email ) as incomeEmp
    from
    (
        select fk_empId as empId from tbl_incomeMail where fk_mailId = 230
    ) O
    join tbl_employee E
    on O.empId = E.empId
)

/*-- 참조_str (숨은참조 제외) --*/   
select listagg( CAST(referenceEmp AS VARCHAR(100)) , ', ') WITHIN GROUP (ORDER BY referenceEmp) AS referenceEmp_str
from
(
    select ( E.empName || ' ' || E.email ) as referenceEmp
    from
    (
        select fk_empId as empId from tbl_referenceMail where isHiddenReference = 0 and fk_mailId = 230
    ) O
    join tbl_employee E
    on O.empId = E.empId
)

-- ############### 하나의 메일 정보 가져오기 끝 ############### --






-- ########## 메모 모달 관련 시작 ########## -- 
insert into tbl_mailMemo(memoId, fk_mailId, fk_empId, memoContent)
values(9499, 220, 9999, 'memo테스트');

select memoContent
from tbl_mailmemo
where fk_mailId = 230 and fk_empId = 9999 and mailType = 2;

update tbl_mailmemo set memoContent = '1afsdfsdfsfsfsdf'
where fk_mailId = 233 and fk_empId = 9999;

commit;

-- ########## 메모 모달 관련 끝 ########## -- 


-- === 답장메일을 쓰기 위해 필요한 원메일 정보 가져오기 ===
-- 원메일id, 발신자, 제목, 내용
select mailId, subject, mailContent, empName as sendEmpName, email
from tbl_mail M
join tbl_sendMail S
on M.mailId = S.fk_mailId
join tbl_employee E
on S.fk_empId = E.empId
where mailId = 239;



update tbl_personalMailClass set fk_personalMailboxTypeId = 1002
where fk_mailId = #{mailId} and fromMailbox = #{mailType}




select fromMailbox
from tbl_personalMailClass
where fk_mailId = 257 and fk_empId = 9999 and fromMailbox = 1;


-- 임시저장 메일 가져오기 : 받는사람, 참조, 제목, 메일본문
SELECT mailId, subject, mailContent,
       incomeEmpMail, 
       ( select listagg( CAST(incomeEmpMail AS VARCHAR(100)) , ', ') WITHIN GROUP (ORDER BY incomeEmpMail) AS incomeEmp_str ) as A
        ,
       refEmpMail
FROM
(
    select mailId, subject, mailContent, 
           (select email from tbl_employee where empId = incomeEmpId) as incomeEmpMail,
           (select email from tbl_employee where empId = refEmpId) as refEmpMail
    from
    (
        select mailId, subject, mailContent, I.fk_empId as incomeEmpId, R.fk_empId as refEmpId
        from tbl_tempMail T
        join tbl_mail M
        on T.fk_mailId = M.mailId
        join tbl_incomeMail I
        on M.mailId = I.fk_mailId
        left join tbl_referenceMail R
        on M.mailId = R.fk_mailId
        where mailId = 298
    )
);






select mailId, subject, mailContent
from tbl_tempMail T
join tbl_mail M
on T.fk_mailId = M.mailId









select listagg( CAST(incomeEmp AS VARCHAR(100)) , ', ') WITHIN GROUP (ORDER BY incomeEmp) AS incomeEmp_str
from
(
    select E.email as incomeEmp
    from
    (
        select fk_empId as empId from tbl_incomeMail where fk_mailId = 298
    ) O
    join tbl_employee E
    on O.empId = E.empId
)

/*-- 받는사람_str --*/        
select listagg( CAST(incomeEmp AS VARCHAR(100)) , ', ') WITHIN GROUP (ORDER BY incomeEmp) AS incomeEmp_str
from
(
    select ( E.empName || ' ' || E.email ) as incomeEmp
    from
    (
        select fk_empId as empId from tbl_incomeMail where fk_mailId = 298
    ) O
    join tbl_employee E
    on O.empId = E.empId
)

/*-- 참조_str (숨은참조 제외) --*/   
select listagg( CAST(referenceEmp AS VARCHAR(100)) , ', ') WITHIN GROUP (ORDER BY referenceEmp) AS referenceEmp_str
from
(
    select ( E.empName || ' ' || E.email ) as referenceEmp
    from
    (
        select fk_empId as empId from tbl_referenceMail where isHiddenReference = 1 and fk_mailId = 302
    ) O
    join tbl_employee E
    on O.empId = E.empId
)





----------------------------------------------
-- ================== 편지함 비우기 ================== --

-- 받은메일함
DELETE 
-- select *
FROM tbl_incomeMail
WHERE incomeMailId IN (select I.incomeMailId as incomeMailId
                        from tbl_incomeMail I
                        join tbl_sendMail S
                        on I.fk_mailId = S.fk_mailId
                        where I.fk_empId = 9999 and I.isDelete = 0     
                              and ( I.isRead = 1
                                    or (I.isRead = 0 and S.isCancel = 0 ) ));

-- 보낸메일함 
delete from tbl_sendMail
where fk_empId = 9999 and isDelete = 1;

-- 보낼편지함
delete from tbl_reservationmail
where fk_empId = #{loginEmpId} and isDelete = 0

-- 임시보관함인 경우
delete from tbl_tempMail
where fk_empId = #{loginEmpId} and isDelete = 0
		    
-- 휴지통인 경우
DELETE 테이블별칭1, 테이블별칭2, ...
FROM 테이블1 테이블별칭1, 테이블2 테이블별칭2, ...
WHERE 조건;
 
 DELETE 
-- select *
FROM tbl_incomeMail
WHERE incomeMailId IN (s
 
 
 delete a.*, b.* from customer a, member b where a.f_id=11 and b.id=11;

이런식으로 delete 다음에 a 테이블에 모든거, b 테이블에 모든 거라고 명시해줘야 합니다. 그리고 from 다음에 테이블 alias는 이렇게 하시고요.
 
{
    call
        declare
    begin
        -- 받은메일함
        DELETE FROM tbl_incomeMail 
        WHERE incomeMailId IN (select I.incomeMailId as incomeMailId
                               from tbl_incomeMail I
                               join tbl_sendMail S
                               on I.fk_mailId = S.fk_mailId
                               where I.fk_empId = 9999 and I.isDelete = 1     
                                     and ( I.isRead = 1
                                           or (I.isRead = 0 and S.isCancel = 0 ) ));
        -- 보낸메일함 
        DELETE FROM tbl_sendMail
        WHERE fk_empId = 9999 and isDelete = 1;
        
        -- 보낼편지함
        DELETE FROM tbl_reservationmail
        WHERE fk_empId = #{loginEmpId} and isDelete = 1;
        
        -- 임시보관함인 경우
        DELETE FROM tbl_tempMail
        WHERE fk_empId = #{loginEmpId} and isDelete = 1;
        
        -- 개인매일함인 경우
        delete from tbl_personalMailClass 
        where fk_empId = 9999 and fk_personalMailboxTypeId = 1001 and isDelete = 1; 		
        
    end
}
 
 
-- 개인매일함인 경우 -->
delete from tbl_personalMailClass 
where fk_empId = 9999 and fk_personalMailboxTypeId = 1001 and isDelete = 0 		
		  