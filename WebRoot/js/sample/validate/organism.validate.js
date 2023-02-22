(function($) {
    $.fn.bootstrapValidator.validators.organism = {
        /**
         * @param {BootstrapValidator} validator The validator plugin instance
         * @param {jQuery} $field The jQuery object represents the field element
         * @param {Object} options The validator options
         * @returns {boolean}
         */
        validate: function(validator, $field, options) {
            // You can get the field value
            // var value = $field.val();
            // Perform validating
            // return true if the field value is valid
            // otherwise return false
        	var taxonName = $field.val();    		
    		$.ajax({
	            url: "/project/ajax/getTaxonNameAndIdByName",
	            dataType: "json",
	            data:{taxonName:taxonName},
	            async:false,
	            success: function(data) {
	            	list = data.taxonNameAndId;
	            	if(list == ""){
	            		$("#taxon-id").val("");
	            	}else{
	            		$("#taxon-id").val(data.taxonNameAndId[0]["taxon_id"]);
	            	}
	            	return;
	            }
	        }); 
    		taxonId = $("#taxon-id").val();
    		if(taxonId.replace(/(^\s*)|(\s*$)/g, "") == ""){
    			return false;
    		}
    		return true;    		
    		
        }
    };
}(window.jQuery));
