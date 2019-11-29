$(document).ready(function(){
	$("#j_form").validator({
		validate:function(v){
			var o=$(v.field);
			var tip=o.next("span[class='am-icon-times']");
			if(v.valid){
				if(tip.length>0){
					tip.remove();
				}
			}else{
				JAlert(o.attr("placeholder")||this.getValidationMessage(v));
				if(tip.length<1){
					o.after("<span class=\"am-icon-times\"></span>");
				}
			}
			if(o[0].tagName.toLowerCase()=="textarea"){
				var length=parseInt(o.attr("maxlength"));
				if(length&&(o.val().length>length||o.val().length==length&&o.val().indexOf("\n")!=-1)){
					JAlert(o.attr("placeholder"));
					if(tip.length<1){
						o.after("<span class=\"am-icon-times\"></span>");
					}
					v.valid=false;
				}
			}
			return v;
		}
	});
});