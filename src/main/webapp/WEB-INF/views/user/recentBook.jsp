<%@ page import="javax.naming.Context" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Aroma Shop - Category</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap&subset=korean');

        .card-product__title a {
            color: #222;
            font-size: initial;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .pixel-radio:checked::after {
            -webkit-animation: click-wave 0.65s;
            -moz-animation: click-wave 0.65s;
            animation: click-wave 0.65s;
            background: #384aeb;
            content: '';
            display: block;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            position: relative;
            z-index: 2;
            opacity: 0;
        }

        @import url("https://fonts.googleapis.com/css?family=Roboto:400,300");
        .pagination-container {
            color: #2c3e50;
            font-family: 'Roboto', sans-serif;
            font-weight: 400;
            margin: 15px auto;
            padding-right: 40px;
            text-align: center;

        }

        .pagination {
            position: relative;
        }

        .pagination a {
            position: relative;
            display: inline-block;
            color: #2c3e50;
            text-decoration: none;
            font-size: 1.2rem;
            padding: 8px 16px 10px;
        }

        .pagination a:before {
            z-index: -1;
            position: absolute;
            height: 100%;
            width: 100%;
            content: "";
            top: 0;
            left: 0;
            background-color: #2c3e50;
            border-radius: 24px;
            -webkit-transform: scale(0);
            transform: scale(0);
            transition: all 0.2s;
        }

        .pagination a:hover,
        .pagination a .pagination-active {
            color: #fff;
        }

        .pagination a:hover:before,
        .pagination a .pagination-active:before {
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .pagination .pagination-active {
            color: #fff;
        }

        .pagination .pagination-active:before {
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .pagination-newer {
            margin-right: 50px;
        }

        .pagination-older {
            margin-left: 50px;
        }
    </style>
    <script>
        $(function () {



            var CatgIdx = ${CatgIdx}+"";
            var startPage = ${startPage}+"";
            var maxPage = ${maxPage}+"";
            var curPage;
            var pageInfo;

            $("#category li input[id=${CatgIdx}]").prop('checked', true);
            // alert($('#sorting select option:selected').val());
            <%--alert($("#category li input[id=${CatgIdx}]").attr('id'));--%>

            //AJAX기능
            function bookAjax(CatgIdx, PageNum, Ordering, Word) {
                if (Ordering == undefined) Ordering = 1;
                if (Word == undefined) Word = "";

                $.ajax({
                    async: false,
                    url: "/catgCall", //서버요청주소
                    type: "get",//요청방식 (get,post,patch,delete,put)
                    dataType: "json",//서버가 보내온 데이터 타입 (text, html, xml, json)
                    data: "CatgIdx=" + CatgIdx + "&PageNum=" + PageNum + "&Ordering=" + Ordering + "&Word=" + Word,//서버에게 보내는 parameter정보
                    success: function (result) {
                        $("#bookCard").empty();
                        $.each(result[0], function (index, item) {

                            var Img = item.bookImg;
                            var Title = item.bookTitle;
                            var Price = item.bookPrice;
                            var CatgName = item.category.catgName;

                            var str = " <div class=\"col-md-6 col-lg-4\">\n" +
                                "                <div class=\"card text-center card-product\">\n" +
                                "                  <div class=\"card-product__img\">\n" +
                                "                    <img class=\"card-img\" src=\"" + Img + "\" alt=\"\">\n" +
                                "                    <ul class=\"card-product__imgOverlay\">\n" +
                                "                      <li><button><i class=\"ti-search\"></i></button></li>\n" +
                                "                      <li><button><i class=\"ti-shopping-cart\"></i></button></li>\n" +
                                "                      <li><button><i class=\"ti-heart\"></i></button></li>\n" +
                                "                    </ul>\n" +
                                "                  </div>\n" +
                                "                  <div class=\"card-body\">\n" +
                                "                    <p>" + CatgName + "</p>\n" +
                                "                    <h4 class=\"card-product__title\"><a href=\"#\">" + Title + "</a></h4>\n" +
                                "                    <p class=\"card-product__price\">" + Price + "</p>\n" +
                                "                  </div>\n" +
                                "                </div>\n" +
                                "              </div>";
                            $('#bookCard').append(str);

                        });

                        pageInfo = result[1];
                    }, //성공했을때
                    error: function (request) {
                        alert(request.responseText);
                    }// 실패했을때
                });
                startPage = pageInfo[0];
                maxPage = pageInfo[1];
                if (maxPage == 0) maxPage = 1;
                curPage = pageInfo[2];

            }

            //페이지 버튼
            $(document).on('click', '.pagination-inner a', function () {
                // $('.pagination-inner a').on('click', function() {
                $(this).siblings().removeClass('pagination-active');
                $(this).addClass('pagination-active');

                CatgIdx = $("#category li input:checked").attr('id');
                var PageNum = $(".pagination-active").text();
                var Ordering = $("#sorting div ul .option.selected").attr('data-value');
                bookAjax(CatgIdx, PageNum, Ordering);

            });

            //카테고리 버튼
            $("#category li input").on('click', function () {
                // $(".pagination-active").removeClass();
                // $(".pagination-inner a:first").addClass('pagination-active');

                CatgIdx = $(this).attr('id');
                // var PageNum = $(".pagination-active").text();
                var PageNum = 1;
                bookAjax(CatgIdx, PageNum, 1);

                $(".pagination-inner").empty();
                var doneLoop = false;
                for (var i = startPage; i <= maxPage; i++) {
                    if (doneLoop == false) {
                        if (i == curPage) {
                            $(".pagination-inner").append("<a class='pagination-active' href='#ㅇㅅㅇ'>" + i + "</a>");
                        } else {
                            $(".pagination-inner").append("<a href=\"#ㅇㅅㅇ\">" + i + "</a>");
                        }
                        if (i == startPage + 9) {
                            doneLoop = true;
                        }
                    }
                }
                // $("#sorting select option:first").prop('selected', true);
                // $("#sorting select option:first").prop('selected', 'selected').change();

                //nice-select 작업
                $("#sorting span").text($("#sorting div ul li:first").text());
                $("#sorting div ul .option.selected").attr('class', 'option');
                $("#sorting div ul li:first").addClass('option selected');

                $("#SearchWord").val("");

                // alert($("#sorting select option:first").next().val());
            });

            // PREV, NEXT 버튼
            $(document).on('click', '.pagination-older,.pagination-newer', function () {
                var Ordering = $("#sorting div ul .option.selected").attr('data-value');
                var PageNum = $(".pagination-active").text();
                if ($(this).text() == 'PREV') {
                    PageNum = PageNum * 1 - 1;

                    if (PageNum < 1) {
                        alert("이전 페이지가 존재하지 않습니다.");
                        return 0;
                    }

                    // $('.pagination-active').prev().addClass('pagination-active');
                    // $('.pagination-active').next().removeClass('pagination-active');

                    bookAjax(CatgIdx, PageNum, Ordering);

                    $(".pagination-inner").empty();
                    var doneLoop = false;
                    for (var i = startPage; i <= maxPage; i++) {
                        if (doneLoop == false) {
                            if (i == PageNum) {
                                $(".pagination-inner").append("<a class='pagination-active' href='#ㅇㅅㅇ'>" + i + "</a>");
                            } else {
                                $(".pagination-inner").append("<a href=\"#ㅇㅅㅇ\">" + i + "</a>");
                            }
                            if (i == startPage + 9) {
                                doneLoop = true;
                            }
                        }
                    }


                } else if ($(this).text() == 'NEXT') {
                    PageNum = PageNum * 1 + 1;

                    if (PageNum > maxPage) {
                        alert("다음 페이지가 존재하지 않습니다.");
                        return 0;
                    }

                    bookAjax(CatgIdx, PageNum, Ordering);

                    $(".pagination-inner").empty();
                    var doneLoop = false;
                    for (var i = startPage; i <= maxPage; i++) {

                        if (doneLoop == false) {
                            if (i == PageNum) {
                                $(".pagination-inner").append("<a class='pagination-active' href='#ㅇㅅㅇ'>" + i + "</a>");
                            } else {
                                $(".pagination-inner").append("<a href=\"#ㅇㅅㅇ\">" + i + "</a>");
                            }
                            if (i == startPage + 9) {
                                doneLoop = true;
                            }
                        }
                    }
                }

                // bookAjax(CatgIdx,PageNum);


            });

            // Ordering 버튼
            $("#sorting select").on('change', function () {
                CatgIdx = $("#category li input:checked").attr('id');
                var PageNum = 1;
                var Ordering = this.value;
                bookAjax(CatgIdx, PageNum, Ordering);

                $(".pagination-inner").empty();
                var doneLoop = false;
                for (var i = startPage; i <= maxPage; i++) {
                    if (doneLoop == false) {
                        if (i == curPage) {
                            $(".pagination-inner").append("<a class='pagination-active' href='#ㅇㅅㅇ'>" + i + "</a>");
                        } else {
                            $(".pagination-inner").append("<a href=\"#ㅇㅅㅇ\">" + i + "</a>");
                        }
                        if (i == startPage + 9) {
                            doneLoop = true;
                        }
                    }
                }
                $("#SearchWord").val("");
            });

            //searching 버튼
            function Search() {
                var SearchType = $(".searching .nice-select .list .option.selected").attr('data-value');
                var Word = $("#SearchWord").val();
                CatgIdx = $("#category li input:checked").attr('id');
                var PageNum = 1;
                bookAjax(CatgIdx, PageNum, SearchType, Word);


                $(".pagination-inner").empty();

                var doneLoop = false;
                for (var i = startPage; i <= maxPage; i++) {
                    if (doneLoop == false) {
                        if (i == PageNum) {
                            $(".pagination-inner").append("<a class='pagination-active' href='#ㅇㅅㅇ'>" + i + "</a>");
                        } else {
                            $(".pagination-inner").append("<a href=\"#ㅇㅅㅇ\">" + i + "</a>");
                        }
                        if (i == startPage + 9) {
                            doneLoop = true;
                        }
                    }
                }

                //nice-select 작업
                $("#sorting span").text($("#sorting div ul li:first").text());
                $("#sorting div ul .option.selected").attr('class', 'option');
                $("#sorting div ul li:first").addClass('option selected');

            }

            $("#SearchWord").keydown(function (key) {
                if (key.keyCode == 13) {
                    Search();
                }
            });


            $("#SearchBtn").click(function () {
                Search();
            });

        });
    </script>
</head>
<body>

<!-- ================ start banner area ================= -->
<section class="blog-banner-area" id="category2">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Recent BookList</h1>
                <nav aria-label="breadcrumb" class="banner-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Recent BookList</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- ================ end banner area ================= -->


<!-- ================ category section start ================= -->
<section class="section-margin--small mb-5">
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-5">
                <div class="sidebar-categories">
                    <div class="head">My Page</div>
                    <ul class="main-categories">
                        <li class="common-filter">
                            <form action="#">
                                <ul id="category">
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="0" name="catg"
                                                                   checked><label for="0">최근 본 책</label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="1"
                                                                   name="catg"><label for="1">결제 내역</label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="2"
                                                                   name="catg"><label for="2">내 리뷰 관리</label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="3"
                                                                   name="catg"><label for="3">내 정보 수정</label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="4"
                                                                   name="catg"><label for="4">장바구니</label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="5"
                                                                   name="catg"><label for="5">기타</label></li>
                                </ul>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xl-9 col-lg-8 col-md-7">
                <!-- Start Filter Bar -->
                <%--          <div class="filter-bar d-flex flex-wrap align-items-center">--%>
                <%--            <div class="sorting mr-auto"  id="sorting">--%>
                <%--              <select>--%>
                <%--                <option value="1">가나다 순</option>--%>
                <%--                <option value="2">가나다 역순</option>--%>
                <%--                <option value="3">낮은가격 순</option>--%>
                <%--                <option value="4">높은가격 순</option>--%>
                <%--                <option value="5">출간일 순</option>--%>
                <%--              </select>--%>
                <%--            </div>--%>
                <%--            <div class="searching" style="margin-right: 5px;--%>
                <%--            height: 35px;margin-top: 7px;">--%>
                <%--              <select>--%>
                <%--                <option value="6">제목별</option>--%>
                <%--                <option value="7">저자별</option>--%>
                <%--                <option value="8">출판사별</option>--%>
                <%--              </select>--%>
                <%--            </div>--%>
                <%--            <div>--%>
                <%--              <div class="input-group filter-bar-search">--%>
                <%--                <input type="text" id="SearchWord" placeholder="Search">--%>
                <%--                <div class="input-group-append">--%>
                <%--                  <button type="button" id="SearchBtn"><i class="ti-search"></i></button>--%>
                <%--                </div>--%>
                <%--              </div>--%>
                <%--            </div>--%>
                <%--          </div>--%>
                <!-- End Filter Bar -->
                <!-- Start Best Seller -->
                <section class="lattest-product-area pb-40 category-list">

                    <!-- ================ top product area start ================= -->
                    <div class="container">
                        <%--              <div class="section-intro pb-60px">--%>
                        <%--                <p>Popular Item in the market</p>--%>
                        <%--                <h2>Top <span class="section-intro__style">Product</span></h2>--%>
                        <%--              </div>--%>

                        <%--
                                  <section class="related-product-area">
                                    <div class="container">
                                      <div class="row mt-30">
                                        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                                          <div class="single-search-product-wrapper">
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-1.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-2.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-3.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>

                                        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                                          <div class="single-search-product-wrapper">
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-4.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-5.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-6.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>

                                        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
                                          <div class="single-search-product-wrapper">
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-7.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-8.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                            <div class="single-search-product d-flex">
                                              <a href="#"><img src="/img/product/product-sm-9.png" alt=""></a>
                                              <div class="desc">
                                                <a href="#" class="title">Gray Coffee Cup</a>
                                                <div class="price">$170.00</div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </section> --%>
                        <!-- ================ top product area end ================= -->

                        <div class="row" id="bookCard">
                            <c:forEach var="item" items="${booklist}" varStatus="status">
                                <%--            <c:forEach var="i" begin="0" end="8">--%>
                                <div class="col-md-6 col-lg-4">
                                    <div class="card text-center card-product">
                                        <div class="card-product__img">
                                            <img class="card-img" src="${item.bookImg}" alt="">
                                            <ul class="card-product__imgOverlay">
                                                <li>
                                                    <button><i class="ti-search"></i></button>
                                                </li>
                                                <li>
                                                    <button><i class="ti-shopping-cart"></i></button>
                                                </li>
                                                <li>
                                                    <button><i class="ti-heart"></i></button>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <p>${item.category.catgName}</p>
                                            <h4 class="card-product__title"><a href="#">${item.bookTitle}</a></h4>
                                            <p class="card-product__price">${item.bookPrice}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <nav class="pagination-container">
                            <div class="pagination">
                                <a class="pagination-newer" href="#ㅇㅅㅇ">PREV</a>
                                <span class="pagination-inner">
                    <c:set var="doneLoop" value="false"/>
                    <c:forEach var="i" begin="${startPage}" end="${maxPage}" varStatus="status">
                        <c:if test="${not doneLoop}">

                            <c:choose>
                                <c:when test="${i eq curPage}">
                                    <a class="pagination-active" href="#ㅇㅅㅇ"><c:out value="${i}"/></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="#ㅇㅅㅇ"><c:out value="${i}"/></a>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${status.count eq 10}">
                                <c:set var="doneLoop" value="true"/>
                            </c:if>
                        </c:if>

                    </c:forEach>
				</span>
                                <a class="pagination-older" href="#ㅇㅅㅇ">NEXT</a>
                            </div>
                        </nav>
                </section>
                <!-- End Best Seller -->
            </div>
        </div>
    </div>

</section>
<!-- ================ category section end ================= -->


<!-- ================ Subscribe section start ================= -->
<section class="subscribe-position">
    <div class="container">
        <div class="subscribe text-center">
            <h3 class="subscribe__title">Get Update From Anywhere</h3>
            <p>Bearing Void gathering light light his eavening unto dont afraid</p>
            <div id="mc_embed_signup">
                <form target="_blank"
                      action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                      method="get" class="subscribe-form form-inline mt-5 pt-1">
                    <div class="form-group ml-sm-auto">
                        <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email"
                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '">
                        <div class="info"></div>
                    </div>
                    <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
                    <div style="position: absolute; left: -5000px;">
                        <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                    </div>

                </form>
            </div>

        </div>
    </div>
</section>
<!-- ================ Subscribe section end ================= -->


</body>
</html>