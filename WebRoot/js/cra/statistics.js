$(function () {
    $.getJSON('json/statisticsJson.json', function (data) {

        $("#projectCount").html(data.projectCount);
        var releasedProjectCountHtml = '<a href="browse/?totalCount='+data.releasedProjectCount+'&titleValue='+data.releasedProjectCount+'">'+data.releasedProjectCount+'</a>';
        $("#releasedProjectCount").html(releasedProjectCountHtml);
        $("#privateProjectCount").html(data.privateProjectCount);
        $('#agency_table').DataTable( {
            data:data.agencyCountByAgency,
            "paging":false,
            "info":false,
            "searching": false,
            "order":[],
            "bLengthChange": false,
            "bAutoWidth": false,
            "iDisplayLength": 10,
            columns: [
                {
                    data: 'key'
                },{
                    data: 'value'
                }
            ]
        } );
    });
});