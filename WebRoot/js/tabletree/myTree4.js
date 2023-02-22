$(document).ready(function() {
//	var userId = $("#userId").val();
	//alert(userId);
    var GridColumnType = [
       {
        header: 'Project number',
        headerIndex: 'accession',
        width: '200px'
       },
       {
        header: 'Project name',
        headerIndex: 'nameEn',
        width: '300px',
    	columntype : {
			inputtype : 'html',
			htmlStr : '<a href="/browse/super/detil.action?supPrjId=%">$</a>',
			nameId : 'supPrjId'
		}
     
       },
   
       {
    	header: 'Organization',
    	headerIndex: 'organization',
    	width: '150px'
       },
       {
       	header: 'Principal',
       	headerIndex: 'principal',
       	width: '110px'
       },
       {
       	header: 'Sponsor',
       	headerIndex: 'sponsor',
       	width: '110px'
       }
       
       ];
    var content = {
        columnModel: GridColumnType,
        dataUrl: "/project/ajax/initSuperProject.action",
        lazyLoadUrl: "/project/ajax/superProject.action",
        idColumn: 'supPrjId',
        parentColumn: 'parentPrjId',
        pageSize: 5,
		height: '500px',
		width: '97%',
        pageBar: true,
        debug: true,
        analyzeAtServer: true,
        multiChooseMode: 4,
        tableId: 'testTable',
        checkOption: 'radio',
        
        rowCount: false,
        expandColumnNm: 'accession',
        checkColumnNm: 'accession',
        onLazyLoadSuccess: function(gt) {
        },
        onSuccess: function(gt) {
        },
        onPagingSuccess: function(gt) {
        },
        lazy: true,
        isFile: false,
        leafColumn: 'isLeaf' 
		
        //lazyPageSize: 5,
        //lazyMorePage: false,
        //lazyPage: false
       // idToOpen:ids
    };
    $('#super_table').gridTree(content);
});