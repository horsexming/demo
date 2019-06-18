<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
<header>
    <title>circle</title>
    <style type="text/css">
        div {
          box-sizing: border-box;
        }
        .downloading {
          width: 40px;
          height: 40px;
          background-color: gray;
          position: relative;
        }
        .loading-wrapper-left,
        .loading-wrapper-right {
          width: 50%;
          height: 100%;
          position: absolute;
          top: 0;
          overflow: hidden;
        }
        .loading-wrapper-left {
          left: 0;
        }
        .loading-wrapper-right {
          right: 0;
        }
        .loading-circle-left,
        .loading-circle-right {
          width: 100%;
          height: 100%;
          border: solid 2px white;
          position: absolute;
          top: 0;
        }
        .loading-circle-left {
          border-radius: 20px 0 0 20px;
          border-right: transparent;
          right: 100%;
          transform-origin: 100% 50%;
        }
        .loading-circle-right {
          border-radius: 0 20px 20px 0;
          border-left: transparent;
          left: 100%;
          transform-origin: 0% 50%;
        }
    </style>
</header>
<body>
    <div class="downloading">
        <div class="loading-wrapper-left">
            <div class="loading-circle-right"></div>
        </div>
        <div class="loading-wrapper-right">
            <div class="loading-circle-left"></div>
        </div>
    </div>
</body>
<script type="text/javascript">
    function updateProgress(progress){
        if (progress < 0 || progress > 100) {
            return;
        }
        var leftCircleRotateDegree = progress <= 50 ? progress / 100.0 * 360 : 180;
        var rightCircleRotateDegree = progress > 50 ? (progress - 50) / 100.0 * 360 : 0;
 
        var leftCircle = document.getElementsByClassName('loading-circle-left')[0];
        var rightCircle = document.getElementsByClassName('loading-circle-right')[0];
 
        leftCircle.style.transform = 'rotate('+leftCircleRotateDegree+'deg)';
        rightCircle.style.transform = 'rotate('+rightCircleRotateDegree+'deg)';
    }
 
    var progress = 0;
    setInterval(function(){
        if(progress >= 100){
            progress = 0;
        }else{
            progress ++;
        }
        updateProgress(progress);
    },500);
</script>
</html>