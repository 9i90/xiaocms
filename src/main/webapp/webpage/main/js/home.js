  // Step:3 conifg ECharts's path, link to echarts.js from current page.
    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
 
 
var echart_ec ;
  require.config({
        paths: {
        	 echarts: 'plug-in/echarts'
        }
    });
    
    // Step:4 require echarts and use it in the callback.
    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/pie', 
            'echarts/chart/radar', 
            'echarts/chart/map'
        ],
        function (ec) {
        	echart_ec = ec;
        	var data=''
        	
        	
        	reportListsearchMy();
        }
    );
    
    
    
function reportListsearchMy() { 
	
	var data = new Object(); 
	var selectType = $("input[name='selectType']:checked").val();  
	data.selectType =  selectType ;  
	
	var url = "reportController.do?reportHome";
		$.ajax({
			type : 'POST',
			url : url,
			data : data,
			dataType  : 'json',
			success : function(data) {
//				alert('dd')
//				console.log(data); 
				barEchart(data.ssidJsonAr);
	        	lineEchart(data.apNameJsonAr);
	        	pieEchart(data.macJsonAr);
	        	radarEchart(data.radiJsonAr4);
				//var d = $.parseJSON(data);
				 
				//
			}
		});
		 

}
    
    
    function radarEchart(data){
    	
            //--- 折柱 ---
            var myChart = echart_ec.init(document.getElementById('echart_four'));
            var option = {
				    title : {
				        text: '金牛座'
//				        ,
//				        subtext: '纯属虚构'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'right',
				        y : 'bottom',
				        data:['金牛座' ]
				    }, 
				    polar : [
				       {
				           indicator : [
				               { text: '注册用户', max: data.total},
				               { text: '实名用户', max: data.total},
				               { text: '充值金额', max: data.sum_money},
				               { text: '提现金额', max: data.sum_money},
				               { text: '标的金额', max: data.sum_money},
				               { text: '标的成交金额', max: data.sum_money}
				            ]
				        }
				    ],
				    calculable : true,
				    series : [
				        {
				            name: '金牛座',
				            type: 'radar',
				            data : [
				                {
				                    value : [data.total, data.real_total, data.recharge, data.cash, data.sum_money, data.real_total],
				                    name : '金牛座'
				                } 
				            ]
				        }
				    ]
				};
				                    
                    
            myChart.setOption(option); 
    }
     
    
    function pieEchart(data){
		var legendData = [];
		
		legendData.push("好友借贷");
		legendData.push("财富大爆炸");
		legendData.push("火");
		legendData.push("水");
		legendData.push("土");
		legendData.push("风");
		
		var seriesData = [];
		
		// {value:310, name:'邮件营销'},
    	for(var i=0;i<data.length;i++){ 
    		if (typeof(data[i].product_type) == "undefined") { 
			    //legendData.push("好友借贷");
			    seriesData.push({value:data[i].sum_money, name:'好友借贷'})
			}else{
				if(data[i].product_type=='CFDBZ'){
					// legendData.push("财富大爆炸");
					 seriesData.push({value:data[i].sum_money, name:'财富大爆炸'})
				}
				if(data[i].product_type=='HUO'){
					 //legendData.push("火");
					 seriesData.push({value:data[i].sum_money, name:'火'})
				}
				if(data[i].product_type=='SHUI'){
					// legendData.push("水");
					 seriesData.push({value:data[i].sum_money, name:'水'})
				}
				if(data[i].product_type=='TU'){
					// legendData.push("土");
					 seriesData.push({value:data[i].sum_money, name:'土'})
				}
				if(data[i].product_type=='FENG'){
					// legendData.push("风");
					 seriesData.push({value:data[i].sum_money, name:'风'})
				}
			}
    	}
    	
        //--- 折柱 ---
        var myChart = echart_ec.init(document.getElementById('echart_three'));
        var option = {
		    title : {
		        text: '金牛座产品',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:legendData
		    }, 
		    calculable : true,
		    series : [
		        {
		            name:'总金额',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:seriesData
		        }
		    ]
		};
                
                
        myChart.setOption(option); 
    }
    
    function lineEchart(data){
    	var xAxisData = [];
    	var seriesData = [];
    	var seriesData2 = [];
    	for(var i=0;i<data.length;i++){
    		xAxisData.push(data[i].addtime);
    		seriesData.push(data[i].total);
    		seriesData2.push(data[i].real_total)
    	}
    	
            //--- 折柱 ---
        var myChart = echart_ec.init(document.getElementById('echart_two'));
        var option = {
		    
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['注册用户','实名用户']
		    }, 
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data :xAxisData,
					axisLabel : {
		                show:true,
		                interval: 'auto',    // {number}
		                rotate: 30,
		                margin: 8,
		                formatter: '{value}',
		                textStyle: {
		                    color: 'blue',
		                    fontFamily: 'sans-serif',
		                    fontSize: 15,
		                    fontStyle: 'italic',
		                    fontWeight: 'bold'
		                }
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
		                formatter: '{value}'
		            }
		        }
		    ],
		    series : [
		        {
		            name:'注册用户',
		            type:'line',
		            data:seriesData,
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            }
		        } , {
		            name:'实名用户',
		            type:'line',
		            data:seriesData2, 
		            markLine : {
		                data : [
		                    {type : 'average', name : '平均值'}
		                ]
		            }
		        }
		    ]
		};
                
        myChart.setOption(option); 
    }
    
    function barEchart(data){
    	console.log(data)
    	var xAxisData = [];
    	var seriesData = [];
    	for(var i=0;i<data.length;i++){
    		xAxisData.push(data[i].addtime);
    		seriesData.push(data[i].money);
    	}
	
        //--- 折柱 ---
        var myChart = echart_ec.init(document.getElementById('echart_one'));
        myChart.setOption({
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['充值金额']
            }, 
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data :xAxisData,
					axisLabel : {
		                show:true,
		                interval: 'auto',    // {number}
		                rotate: 30,
		                margin: 8,
		                formatter: '{value}',
		                textStyle: {
		                    color: 'blue',
		                    fontFamily: 'sans-serif',
		                    fontSize: 15,
		                    fontStyle: 'italic',
		                    fontWeight: 'bold'
		                }
		            }
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    splitArea : {show : true}
                }
            ],
            series : [
                {
                    name:'充值金额',
                    type:'bar',
                    data:seriesData
                } 
            ]
        }); 
    }