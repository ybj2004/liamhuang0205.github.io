$(function(){
	$.ajax({
		type     : "GET",
		timeout  : 1000,
		url      : 'http://lbservice.duapp.com/counter',
		dataType : "jsonp",
		jsonp    : "jsonpCallback",
		success  : function(data) {
					if( $("#counter").length > 0 ){
			            $("#counter").html(
			        	   	"本站总访问量&nbsp;<font style='color:white'>"+ data +"</font>&nbsp;次&nbsp;|&nbsp;"
			        	);
			        }
	               },
		error    : function() { 
					if( $("#counter").length > 0 ){
					    $("#counter").html("");
					} 
			       }
	});
});