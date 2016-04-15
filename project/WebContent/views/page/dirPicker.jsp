<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC0ZUC6ZgJPZgG6T1ANbx30aaap7F9W69c&sensor=false"></script>
    <script type="text/javascript">
    
    
    	var map;
		var geocoder;
		var directionsService, directionsDisplay;
		var marker1, marker2, markerE;
	    var posLaPlata = new google.maps.LatLng(-34.9205284, -57.9531702);
	    var mapZoom = 13;

		function initialize() {
		    
			var mapOptions = {
				zoom : mapZoom,
				center : posLaPlata,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
// 				draggable: false,
				disableDefaultUI: true
			};
			
			map = new google.maps.Map(document.getElementById('_map'), mapOptions);
			geocoder = new google.maps.Geocoder();
			directionsService = new google.maps.DirectionsService();
			directionsDisplay = new google.maps.DirectionsRenderer({
                suppressMarkers: false,
                markerOptions:{
                    clickable: false,
                }
            });
			directionsDisplay.setMap(map);
			
			/** Callback una vez que el mapa está cargado en el documento */
			mapLoaded();
            
		}
		
		/** Encuentra direccion a partir de una posicion */
		function lookupAddress(mark){
		    
		    latlng = mark.getPosition();
		    
		    geocoder.geocode({'latLng': latlng}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                         mark.setDire((results[0].formatted_address));
                    } else {
                    	console.log("No encontro resultados para la dire");
                    	mark.setDire("");
                    }
                } else {
                	console.log("No encontro respuesta");
                	mark.setDire("");
                }
            });
		    calcRoute();
		    
		}
		
		function setMarker(location) {

			if (marker1 == null){
				marker1 = new google.maps.Marker({
	                position: location,
	                map: map,
	                draggable: true,
	                animation: google.maps.Animation.DROP,
	                setDire: function(dire){
			            document.getElementById("dire_desde").value = dire;
			            document.getElementById("desdePosition").value = this.getPosition().toString();
	                }
	            });
				google.maps.event.addListener(marker1, "dragend", function(event){
					lookupAddress(marker1);
				});
	            lookupAddress(marker1);
	            
			}else{
				if (marker2 != null) marker2.setMap(null);
				marker2 = new google.maps.Marker({
	                position: location,
	                map: map,
	                draggable: true,
	                animation: google.maps.Animation.DROP,
	                setDire: function(dire){
			            document.getElementById("dire_hasta").value = dire;
			            document.getElementById("hastaPosition").value = this.getPosition().toString();
	                }
	            });
				google.maps.event.addListener(marker2, "dragend", function(event){
					lookupAddress(marker2);
				});
	            lookupAddress(marker2);
			}
            
        }
		
		function setMarkerEvento(location){
			if (marker1 != null) marker1.setMap(null);
				
			marker1 = new google.maps.Marker({
				icon: "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
                position: location,
                map: map,
                draggable: true,
                animation: google.maps.Animation.BOUNCE,
                setDire: function(dire){
		            document.getElementById("direccion").value = dire;
		            document.getElementById("mapPosition").value = this.getPosition().toString();
                }
            });
			google.maps.event.addListener(marker1, "dragend", function(event){
				lookupAddress(marker1);
			});
            lookupAddress(marker1);
	            
		}
		
		/**
	   	  * function loadMiniMap(button)
	   	  * @param {Jquery Button} button
	   	 */
		function loadMiniMap(button){
			
	   		if (marker1 !=null) marker1.setMap(null);
			if (marker2 !=null) marker2.setMap(null);
			if (markerE !=null) markerE.setMap(null);
			if (directionsDisplay != null) directionsDisplay.setMap(null);
	   		  
	   		  
	   		var desdePosition = button.attr("map-desde");
			var hastaPosition = button.attr("map-hasta");
			var eventoPosition = button.attr("map-evento");
			if (desdePosition.length + hastaPosition.length + eventoPosition.length < 3) return;
				
			desdePosition = parseLatLng(desdePosition);
			hastaPosition = parseLatLng(hastaPosition);
			eventoPosition = parseLatLng(eventoPosition);
			
			desdePosition = new google.maps.LatLng(desdePosition[0], desdePosition[1]);
			hastaPosition = new google.maps.LatLng(hastaPosition[0], hastaPosition[1]);
			eventoPosition = new google.maps.LatLng(eventoPosition[0], eventoPosition[1]);
			
			marker1 = new google.maps.Marker({ position: desdePosition, map: map });
			marker2 = new google.maps.Marker({ position: hastaPosition, map: map });
			markerE = new google.maps.Marker({
				icon: "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
                position: eventoPosition,
                map: map,
                animation: google.maps.Animation.BOUNCE
			});
			
			var request = {
   				origin : desdePosition,
   				destination : hastaPosition,
   				waypoints : [],
   				optimizeWaypoints : true,
   				travelMode : google.maps.TravelMode.DRIVING
   			};
   			directionsService.route(request, function(response, status) {
   				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setMap(map);
   					directionsDisplay.setDirections(response);
   				}
   			});
			
	   		map.setZoom(mapZoom);
   			map.setCenter(center);
		}

		function calcRoute() {
			if (marker1 == null || marker2 == null) return;
			
			var start = marker1.getPosition().toString();
			var end = marker2.getPosition().toString();
			var waypts = [];

			var request = {
				origin : start,
				destination : end,
				waypoints : waypts,
				optimizeWaypoints : true,
				travelMode : google.maps.TravelMode.DRIVING
			};
			directionsService.route(request, function(response, status) {
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(response);
					var route = response.routes[0];
				}
			});
		}
		
		/** Carga el mapa en el evento onLoad del documento */
		google.maps.event.addDomListener(window, 'load', initialize);
		
	</script>
    
    <script>
    
    	const MAP_MODE = {
   			RECORRIDO_ALTA : 0,
   			RECORRIDO_DETALLE: 1,
   			RECORRIDO_LISTADO: 2,
   			EVENTO_ALTA : 3,
   			EVENTO_DETALLE : 4
    	};
    	
    	function startMap(mode){
    		if (typeof mode === 'undefined') return;
    		
		    if (mode == MAP_MODE.RECORRIDO_ALTA){
		    	// si es recorrido para evento, cargar el primer marcador
		    	var eventoPosition = $("#eventoPosition").val();
		    	if (eventoPosition != ""){
		    		var pos = parseLatLng(eventoPosition);
		    		var marker0 = new google.maps.Marker({
		    			icon: "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
		                position: new google.maps.LatLng(pos[0], pos[1]),
		                map: map,
		                draggable: false,
		                animation: google.maps.Animation.BOUNCE,
		            });
		    		
		    		google.maps.event.addListener(marker0, 'click', function(){
		    			setMarker(marker0.getPosition());
		    		});
		    		
		    	}
		    	
		    	
		    	// habilitar los marcadores sobre el mapa
	    		google.maps.event.addListener(map, 'click', function(event) {
			        setMarker(event.latLng);
			    });
		    }else if (mode == MAP_MODE.RECORRIDO_DETALLE){
		    	
		    	// cargar el recorrido del mapa
		    	var desde = $("#desdePosition").val();
		    	var hasta = $("#hastaPosition").val();
		    	
		    	if (desde != "" && hasta != ""){
		    		
		    		var request = {
	    				origin : desde,
	    				destination : hasta,
	    				waypoints : [],
	    				optimizeWaypoints : true,
	    				travelMode : google.maps.TravelMode.DRIVING
	    			};
	    			directionsService.route(request, function(response, status) {
	    				if (status == google.maps.DirectionsStatus.OK) {
	    					directionsDisplay.setDirections(response);
	    				}
	    			});
	    			
		    	}else{
		    		console.log("No se encontraron las posiciones #desdePosition y #hastaPosition para cargarlas en el mapa");
		    	}
		    	
		    	var eventoPosition = $("#eventoPosition").val();
		    	if (eventoPosition != ""){
		    		var pos = parseLatLng(eventoPosition);
		    		marker0 = new google.maps.Marker({
		    			icon: "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
		                position: new google.maps.LatLng(pos[0], pos[1]),
		                map: map,
		                draggable: false,
		                animation: google.maps.Animation.BOUNCE
		            });
		    	}
		    }else if (mode == MAP_MODE.EVENTO_ALTA){
		    	google.maps.event.addListener(map, 'click', function(event) {
			        setMarkerEvento(event.latLng);
			    });
		    }else if (mode == MAP_MODE.EVENTO_DETALLE){
		    	
		    	var mapPosition = $("#mapPosition").val();
		    	
		    	if (mapPosition != ""){
		    		
		    		var pos = parseLatLng(mapPosition);
		    		marker1 = new google.maps.Marker({
		    			icon: "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
		                position: new google.maps.LatLng(pos[0], pos[1]),
		                map: map,
		                animation: google.maps.Animation.BOUNCE,
		            });
	    			
		    	}else console.log("No se encontró la posición #mapPosition para cargar en el mapa");
		    	
		    }
    	}
    	
    	/**
    	  * function parseLatLng(s)
    	  * @param {String} s
    	  * @param {Number} radix
    	  * @type Array
    	  * @returns {Array}
    	 */
    	function parseLatLng(s){
    		var positions = s.substring(1, s.length - 1).split(",");
    		return [parseFloat(positions[0]), parseFloat(positions[1])];
    	}
    	
    </script>
    
    <style>
    
		#_map {

			height: 100%;
			margin: 0px;
			padding: 0px;
			max-width: none;
		}

        form label{
            display: block;
            padding-bottom: 14px;
        }

    </style>