# spring-crud
개인 프로젝트 | 회원가입 및 로그인 기능이 있는 게시판

## 👩‍💻 기능

---
1. 비회원
    1. 로그인
    2. 회원가입
    3. 회원정보 찾기
2. 회원
    1. 일반 회원
        1. 수정
            1. 회원 정보(닉네임, 이메일, 비밀번호)
            2. 비밀번호
        2. 조회
            1. 게시글 작성내역
            2. 댓글 작성내역
        3. 회원 탈퇴
    2. 관리자 (나중에)
        1. 회원 관리(조회, 탈퇴)
        2. 게시판 관리(생성, 수정, 삭제)
        3. 게시글 관리(이동, 삭제)
        4. 댓글 관리(삭제)
3. 게시판
    1. 카테고리
    2. 게시글
        1. 조회
            1. 목록
            2. 상세보기
        2. 등록
            1. 새글
            2. 답글
        3. 수정
        4. 삭제
4. 댓글
    1. 조회
    2. 등록
        1. 새글
        2. 답글
    3. 수정
    4. 삭제

## 👩‍💻 정책

---
### 공통
* 인코딩(UTF-8)
* 권한 체크
    * 로그인 시에만 게시판에 접근가능
    * 게시글, 댓글은 자기자신만 수정/삭제 가능

### 회원가입
> * 아이디, 닉네임, 이메일은 **중복 불가**
> * 회원이 탈퇴 후 **일주일**이 지나면 회원의 **개인정보는 삭제**됨
    >   * '닉네임'은 **탈퇴 직후** 다른 사용자가 사용가능
>   * '이메일'은 **일주일 뒤**에 동일한 이메일로 **재가입** 가능
>   * '아이디'는 삭제 정보에서 제외되므로 **사용불가**

* **아이디** (5~20자)
    * 중복 불가
    * 소문자/숫자/특수기호(-)(_)
* 비밀번호 (8~16자)
    * 영문 대 소문자/숫자/특수문자
* 이름 (20자)
    * 중복 불가
* **닉네임** (20자)
* 생년월일 (8자)
    * 년
        * 올해 기준 100년 전까지
        * 만 14세 미만의 미성년자 가입 불가능
    * 월 : 1 ~ 12월
    * 일 : 28/29/30/31일
* 성별
    * 미선택, 남자, 여자
* **이메일**
    * 중복 불가
    * 앞자리 (20자)
    * 뒷자리 (20자) : "옵션 값 선택" 또는 "직접 입력"
* 가입일

### 게시판
>* 회원탈퇴 시 작성한 게시글 및 댓글은 삭제되지 않음
>* 회원이 닉네임을 수정해도 이전에 작성한 게시글의 닉네임은 변경 전 닉네임으로 표시

* 게시글
    * 제목 (100자)
    * 내용
        * 텍스트
        * 이미지
    * 작성자: 아이디, 닉네임
    * 추천
    * 조회수
    * 등록일
    * 정렬: 내림차순(desc)
        * 답글은 원본/상위 게시글의 하단에 위치, 오름차순(asc)
      ```
      | No | 제목          
      |----|----------------------
      | 9  | [원본 삭제] ᄂ게시글8의 답글 입니다.       
      | 3  | 게시글3 입니다.       
      | 2  | 게시글2 입니다.        
      | 1  | 게시글1 입니다.      
      | 4  |  ᄂ 게시글1의 답글 입니다.   
      | 6  |   ᄂ 게시글4의 답글 입니다.   
      | 5  |  ᄂ 게시글1의 답글 입니다.
      |----|----------------------       
      ```

#### 댓글
> 게시글 하단에 위치, 등록일(asc; 오름차순) 순   
> 답 댓글은 원본 댓글의 하단에 등록일(asc; 오름차순) 순으로 표시
* 작성자: 아이디, 닉네임
* 내용 (3000자)
* 정렬: 오름차순(asc)
* 답글은 원본 댓글의 하단에 위치, 오름차순(asc)
  ```
  |----|------|----------------------
  | 1  | 회원1 | 댓글1        
  | 2  | 회원2 | 댓글2        
  | 3  | 회원3 | 댓글3      
  | 4  | 회원4 | ᄂ@회원3 댓글4
  | 5  | 회원5 | ᄂ@회원4 댓글5
  | 6  | 회원6 | ᄂ@회원3 댓글6      
  |----|------|----------------------  
  ```
