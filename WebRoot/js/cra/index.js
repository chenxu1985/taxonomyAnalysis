$(document).ready(function() {
    topList();
    //addTip();
})
function topList(){
    $.ajax({
        url: 'browse/ajax/listTopProjects',
        type: 'post',
        async: true,
        dataType: 'json',
        success: function(data){
            $.each(data.projects,function(i,item){
                var title = '';
                if(item.title.length>70)
                    title=item.title.substring(0,70)+"...";
                else
                    title=item.title;
                $("#top").append("<tr><td><a target='_blank' href='browse/"+item.accession+"'>"+item.accession+"</a><br/>("+item.releaseTime.substring(0,10)+")</td><td>"+ title +"</td></tr>")
            });
        },
        error:function(data){
            alert("Error: top BioProject");
        }
    });
}
$(function () {
    chartP = Highcharts.chart('chartP', {
        title: { text: 'BioSample Growth',style: { color: '#800040',  fontSize: '0px' }},
        xAxis: [{type: 'category',
            labels: {
                style: { fontFamily: 'Arial'}
            },
            crosshair: true
        }],
        yAxis: [{
            labels: { format: '{value}',style: { fontFamily: 'Arial'} },
            title: { text: '',	style: { color: '#000'}  },
            tickPositioner: function() {
                var positions = [];
                if(this.dataMax>0) {
                    var min = 0, max = 1,tick=0;
                    max = (Math.floor(this.dataMax/100) + 1)*100;
                    if (this.dataMax/100 >= 0.8) {
                        max = max + Math.ceil((Math.floor(this.dataMax/100)+1)/4)*100;
                    }
                    increment = max/5;
                    //alert(increment);
                    for (tick; tick <= max; tick += increment) {
                        positions.push(tick);
                    }
                }

                return positions;
            },
        }],

        tooltip: {
            shared: true, style:{fontFamily: 'Arial'}
        },
        legend: {
            align: 'left',
            x: 100,
            verticalAlign: 'top',
            y: 10,
            floating: true,
            itemStyle:{fontFamily: 'Arial'},
        },
        series: [{
            name: 'Total Projects',
            color:'#2081B6',
            //type:'column',
            /*type:'spline',
            dashStyle:'shortdot',*/
            tooltip: {
                valueSuffix: ' '
            }
        },{
            name: 'Released Projects',
            //type:'column',
            color:'#1E1E1E',
            tooltip: {
                valueSuffix: ' '
            }
        },
        ]
    });
    chaxun();
});
function chaxun(){
    $.ajax({
        type:'post',
        url:'browse/chart/ajax/listChartData',
        async : false,
        dataType : 'json',
        success: function(data){
            chartP.xAxis[0].setCategories(data.monthX);
            chartP.series[0].setData(data.proN);
            chartP.series[1].setData(data.proRelN);


        },
        error:function(e){alert("error: BioProject chart");}
    });
};
function addTip(){
    var topTip = "<div id='top-tip' style='position:absolute;top:0; z-index:100000000;background:#ffef9f; width:100%; min-height:100px;'> " +
        "<div style='max-width: 1200px; margin:0 auto; margin-top:10px'>" +
        "<span style='line-height:1.6;color:#8b1c45;'>" +
        " Due to system maintenance, the web service of BioProject (https://ngdc.cncb.ac.cn/bioproject) will not be available from 23:00 on October 14, 2022 to 07:00 on October 15, 2022. Sorry for any inconveniences this might cause and thank you for your understanding and patience.</br>" +
        " 由于系统维护，BioProject服务(https://ngdc.cncb.ac.cn/bioproject)将于2022年10月14日23:00至2022年10月15日07:00暂停工作，预计恢复时间是2022年10月15日07:00。给您造成的不便敬请谅解，谢谢您的关注！" +
        "</span>" +
        "&nbsp;&nbsp;&nbsp;<div style='width:60px;height:60px;position: absolute;background:grey;top:-30px;right:-30px;transform: rotate(45deg);'><span style='position: absolute;bottom:0;display: block;width:60px;text-align: center;transform: rotate(-45deg);font-size: 14px;' onclick='hiden()'>X</span></div>"
    "</div>" +
    "</div>"
    $("body").prepend(topTip);
    $("body").css("padding-top",'100px');
}
function hiden() {
    $("#top-tip").css("display","none");
    $("body").css("padding-top",'0');
}