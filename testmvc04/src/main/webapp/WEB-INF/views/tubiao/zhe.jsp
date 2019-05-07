
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/10 0010
  Time: 09:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>柱状图</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ui/echarts/echarts-3.2.3/dist/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ui/echarts/echarts-3.2.3/options/cfgopts2.js"></script>
    
</head>
<body>
   <!--定义页面图表容器-->
    <!-- 必须制定容器的大小（height、width） -->
    <div id="main"
        style="height: 400px; border: 1px solid #ccc; padding: 10px;"></div>

    <script type="text/javascript">
        $().ready(
                function() {
            var myChart = echarts.init(document.getElementById('main'));
            //图表显示提示信息
           myChart.showLoading();
            //定义图表options
            var options = {
                title: {
                    text: "手机销量",
                    subtext: "www.stepday.com",
                    sublink: "http://www.stepday.com/myblog/?Echarts"
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: []
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: false
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        data: []
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        splitArea: { show: true }
                    }
                ],
                series: []
                };

                    //通过Ajax获取数据
                    $.ajax({
                        type : "post",
                        async : false, //同步执行
                        url : "showEchartLine",
                        dataType : "json", //返回数据形式为json
                        success : function(result) {
                            if (result) {
                                //将返回的category和series对象赋值给options对象内的category和series
                                //因为xAxis是一个数组 这里需要是xAxis[i]的形式
                                    options.xAxis[0].data = result.category;
                                    options.series = result.series;
                                    options.legend.data = result.legend;
                                    myChart.hideLoading();
                                    myChart.setOption(options);
                            }
                        },
                        error : function(errorMsg) {
                            alert("图表请求数据失败啦!");
                        }
                    });

                });
    </script>
</body>
</html>