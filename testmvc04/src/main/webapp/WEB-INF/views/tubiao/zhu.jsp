
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/ui/echarts/echarts-3.2.3/dist/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ui/jquery-1.7.2.min.js"></script>
</head>
<script type="text/javascript">
        $(function() {
            //var echarts = echarts.init($('#pid-div')[0]);
            var myChart = echarts.init($('#pid-div')[0]);
            var option = {
                title : {
                    text: '手机销量',
                    subtext: '纯属虚构',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: []
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '55%', // 饼状图的大小
                        center: ['50%', '60%'], // 饼状图的位置
                        data:[
                            /*{value:335, name:'直接访问'},
                            {value:310, name:'邮件营销'},
                            {value:234, name:'联盟广告'},
                            {value:135, name:'视频广告'},
                            {value:1548, name:'搜索引擎'}*/
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            myChart.setOption(option);
            myChart.showLoading(); // 显示动画
 
            $.ajax({
                url: '${pageContext.request.contextPath}/queryForList',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {
                        names.push(obj.goodsName);
                        nums.push({name:obj.goodsName, value:obj.goodsT});
                    })
 
                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        legend: {
                            data: names
                        },
                        series: [{
                            name: '销量',
                            type: 'pie', // 设置图表类型为柱状图
                            data:  nums // 设置纵坐标的刻度
                        }]
                    });
                }
            });
        });
    </script>
<body>
    <!-- 柱状图容器 -->
    <div id="main" style="width:600px; height:400px;"></div>
    <div id="pid-div" style="width:600px; height:400px;"></div>
    <script type="text/javascript">
        $(function() {
            // 初始化
            //var myChart = echarts.init(document.getElementById('main'));
			var myChart = echarts.init($('#main')[0]); // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；
            // 配置图标参数
            var options = {
                title: {
                    text: '手机销量',
                    show: true, // 是否显示标题
                    subtext: '测试数据',
                    textStyle: {
                        fontSize: 18 // 标题文字大小
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    data: ['销量']
                },
                // X轴
                xAxis: {
                    data: [] // 异步请求时,这里要置空
                },
                // Y轴
                yAxis: {},
                series: [{
                    name: '销量',
                    type: 'bar', // 设置图表类型为柱状图
                    data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
                }]
            };
            // 给图标设置配置的参数
            myChart.setOption(options);
            myChart.showLoading(); // 显示加载动画
			// 异步请求加载数据
            $.ajax({
                url: '${pageContext.request.contextPath}/queryForList',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {
                        names.push(obj.goodsName);
                        nums.push(obj.goodsT);
                    })
 
                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        legend: {
                            data: ['销量']
                        },
                        xAxis: {
                            data: names
                        },
                        series: [{
                            name: '销量',
                            type: 'bar', // 设置图表类型为柱状图
                            data: nums // 设置纵坐标的刻度
                        }]
                    });
                }
            });
        });
    </script>
</body>
</html>