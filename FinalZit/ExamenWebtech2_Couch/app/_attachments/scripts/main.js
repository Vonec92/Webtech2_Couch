
function createDoc(){
	
	var naam = $("#naam").val();
	var nummer= $("#nummer").val();
	var hoeveelheid = $("#hoeveelheid").val();
	var opmerking= $("#opmerking").val();
	var datumuur = $("#datumUur").val();

	var doc = {};
	
	
	doc.naam = naam
	doc.nummer = nummer
	doc.hoeveelheid = hoeveelheid
	doc.opmerking = opmerking
	doc.datumuur = datumUur
	var json = JSON.stringify(doc);
	console.log(json);
	
	
	
	
	$.ajax({
		type:			'PUT',
		url:			'../../' + naam + nummer + hoeveelheid + opmerking + datumUur,
		data:			json,
		contentType: 	'application/json',
		async:			true,
		success:		function(data){
			console.log(data);
			buildOutput();
		},
		error:			function(XMLHttpRequest, textStatus, errorThrown){
			console.log(errorThrown); 
		}
	});
}

function buildOutput(){
	
	$.ajax({
		type:			'GET',
		url:			'../../_all_docs?include_docs=true',
        async:  		true,
        success:		function(data){
        	
        	var arr = JSON.parse(data).rows;
        	var htmlString = '<table>';
        	for(var i=0; i<arr.length; i++){
        		
        		if(arr[i].id.indexOf('_design') == -1){
        			var doc = arr[i].doc;
        			htmlString += '<tr><td>' + doc. + '</td><td>' + doc.naam + '</td><td>' + doc.nummer + '</td></tr>'  doc.hoeveelheid + '</td><td>' +
        			 doc.opmerking + '</td><td>'  +  doc.datumUur + '</td><td>';
        		}
        	}
        	htmlString += '</table>';
        	console.log(htmlString);
        	$('#output').html(htmlString);
        },
		error: 			function(XMLHttpRequest, textStatus, errorThrown){ 
			console.log(errorThrown); 
		}
	});
}