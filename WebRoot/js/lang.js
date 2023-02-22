$(function(){
	$(document).on("click", ".language", function(){
		var lang = $(this).attr("name");
        $.ajax({
            url: "ajax/lang",
            dataType: "json",
            async: false,
            data: {
            	request_locale: lang
            },
            success: function() {
            	window.location.reload();
            }
        });
	});
});