<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
<style>
    <!-- 写点样式，让轮播好看点 -->
    ul, ol { padding: 0;}
    .banner { position: relative; overflow: auto; text-align: center;}
    .banner li { list-style: none; }
    .banner ul li { float: left; }
    #b04 { width: 100%;}
    #b04 .dots { position: absolute; left: 0; right: 0; bottom: 20px;}
    #b04 .dots li
    {
        display: inline-block;
        width: 10px;
        height: 10px;
        margin: 0 4px;
        text-indent: -999em;
        border: 2px solid #fff;
        border-radius: 6px;
        cursor: pointer;
        opacity: .4;
        -webkit-transition: background .5s, opacity .5s;
        -moz-transition: background .5s, opacity .5s;
        transition: background .5s, opacity .5s;
    }
    #b04 .dots li.active
    {
        background: #fff;
        opacity: 1;
    }
    #b04 .arrow { position: absolute; top: 200px;}
    #b04 #al { left: 15px;}
    #b04 #ar { right: 15px;}
</style>
<script src="${pageContext.request.contextPath}/js/unslider.min.js"></script>
    <script type="text/javascript">
        //最后用js控制
        $(document).ready(function(e) {
            var unslider04 = $('#b04').unslider({
                    dots: true
                }),
                data04 = unslider04.data('unslider');

            $('.unslider-arrow04').click(function() {
                var fn = this.className.split(' ')[1];
                data04[fn]();
            });
        });
    </script>
</head>
<body>
<!-- 把要轮播的地方写上来 -->
<div class="banner" id="b04">
    <ul>
        <li><img src="${pageContext.request.contextPath}/images/01.jpg" alt="" width="100%" height="380" ></li>
        <li><img src="${pageContext.request.contextPath}/images/02.jpg" alt="" width="100%" height="380" ></li>
        <li><img src="${pageContext.request.contextPath}/images/03.jpg" alt="" width="100%" height="380" ></li>
        <li><img src="${pageContext.request.contextPath}/images/04.jpg" alt="" width="100%" height="380" ></li>
    </ul>
    <a href="javascript:void(0);" class="unslider-arrow04 prev"><img class="arrow" id="al" src="${pageContext.request.contextPath}/images/arrowl.png" alt="prev" width="20" height="35"></a>
    <a href="javascript:void(0);" class="unslider-arrow04 next"><img class="arrow" id="ar" src="${pageContext.request.contextPath}/images/arrowr.png" alt="next" width="20" height="37"></a>
</div>
</body>
</html>
