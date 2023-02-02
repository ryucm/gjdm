
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>스마트관광 빅데이터 플랫폼</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="title" content="스마트관광 빅데이터 플랫폼" />
<meta name="Author" content="스마트관광 빅데이터 플랫폼" />
<meta name="description" content="스마트관광 빅데이터 플랫폼" />
<meta name="keywords" content="스마트관광 빅데이터 플랫폼" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<!-- layout css -->
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/select.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="resources/css/jquery.scrollbar.css" />
<!-- Main scripts -->
<script type="text/javascript" language="javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" language="javascript" src="resources/js/ui.js"></script>
<script src="resources/js/jquery.scrollbar.js"></script>
</head>

<body>
<!-- wrap start -->
  <nav class="sideBarWrap">
      <h1><a href="#" title="스마트관광 빅데이터 플랫폼">스마트관광 빅데이터 플랫폼</a></h1>
      <!-- user info -->
      <div class="userInfo">
        <img src="resources/images/ico_user.png" />
        <dl>
          <dt>홍길동</dt>
          <dd><a href="#" class="logout"><span>Transformation Group</span></a></dd>
        </dl>
        <a href="#"><div style="display:none;" class="logoutBox">LOGOUT</div></a>
      </div>
      <!-- user info -->
      <!-- side bar start -->
      <div class="wrapper scrollbar-dynamic">
            <!--<div class="page-content"-->
                  <div class="side-content">
                    <script type="text/javascript">
                          jQuery(document).ready(function(){
                              jQuery('.scrollbar-macosx').scrollbar();
                          });
                      </script>
                      <div class="scrollbarArea">
                          <div class="scrollbar-macosx" >
                            <div class="side-bar">
                              <h2>Admin System</h2>
                                <div class="menu">
                                  <div class="item">
                                    <a class="sub-btn"><span class="ico_api">Dashboard</span>Dashboard</a>
                                    <div class="sub-menu">
                                      <a href="#" class="sub-item">관광통계 분석</a>
                                      <a href="#" class="sub-item">관광객 분석</a>
                                      <a href="#" class="sub-item">관광소비 분석</a>
                                    </div>
                                  </div>
                                  <div class="item">
                                    <a class="sub-btn"><span class="ico_log">기준관리</span>기준관리</a>
                                    <div class="sub-menu">
                                      <a href="dimCalendarList.do" class="sub-item">달력</a>
                                      <a href="dimCodeList.do" class="sub-item">코드</a>
                                      <a href="dimNationList.do" class="sub-item">국가</a>
                                      <a href="dimDistrictList.do" class="sub-item">지역</a>
                                    </div>
                                  </div>
                                  <div class="item">
                                    <a class="sub-btn"><span class="ico_admin">시스템관리</span>시스템관리</a>
                                    <div class="sub-menu">
                                      <a href="etlBatchList.do" class="sub-item">ETL 배치관리</a>
                                      <a href="#" class="sub-item">사용자</a>
                                      <a href="#" class="sub-item">권한</a>
                                      <a href="#" class="sub-item">메뉴</a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                          </div>
                      </div>

                  </div>
          <!--</div>-->
      </div>
      <!-- side bar end -->
  </nav>