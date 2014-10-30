var geocoder;
var map;
var layer;
var MY_MAPTYPE_ID = 'custom_style';
function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(30.000000, 25.000000);
    var mapOptions = {
        zoom: 2,
        minZoom: 2,
        maxZoom: 3,
        panControl: false,
        zoomControl: true,
        scaleControl: false,
        mapTypeControl: false,
        streetViewControl: false,
        center: latlng,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
        },
        mapTypeId: MY_MAPTYPE_ID
    }
    // custom map style
    var featureOpts = [
        {
            stylers: [
                { hue: '#e0e1e5' },
               // { visibility: 'simplified' },
                { gamma: 1.5 },
                { weight: 0.5 }
            ]
        },
        {
            elementType: 'labels',
            stylers: [
                { visibility: 'on' }
            ]
        },
        {
            featureType: 'water',
            stylers: [
                { color: '#ffffff' }
            ]
        },{
            featureType: 'administrative.locality',
            elementType: 'labels',
            stylers: [
                { hue: '#0022ff' },
                { saturation: 50 },
                { lightness: -10 },
                { gamma: 0.90 }
            ]
        }
    ];
    // custom map style
    // fusion table country style
    layer = new google.maps.FusionTablesLayer({
        suppressInfoWindows: true,
        query: {
            select: 'geometry',
            from: '1ySn7x9MmCbikjuRx_0albqI5Avap7GpafgJPw-zw'
        },
        styles: [{
           polygonOptions: {
               fillColor: "#e0e1e5",
               fillOpacity: 0.1
            }
        }, {
            // Ukraine
            where: 'Teleport = 1',
            polygonOptions: {
                fillColor: "#656565",
                fillOpacity: 0.4
            }
        }
        ]
    });
    // fusion table country style

    // for geocode
    //var map = new google.maps.Map(document.getElementById('map-canvas'),
    //    mapOptions);
    // without geocode
    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
    // fusion table country style
     layer.setMap(map);
    // fusion table country style
    // custom map style
    var styledMapOptions = {
        name: 'Custom Style'
    };
    // custom map style

    // custom map style
    var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

    map.mapTypes.set(MY_MAPTYPE_ID, customMapType);

    setMarkers(map, beaches);
}

/**
 * https://developers.google.com/maps/documentation/javascript/examples/icon-complex
 * http://www.latlong.net/convert-address-to-lat-long.html
 * https://developers.google.com/maps/documentation/javascript/examples/event-simple
 * https://developers.google.com/maps/documentation/javascript/examples/geocoding-simple
 * https://developers.google.com/maps/documentation/javascript/examples/layer-fusiontables-styling
 * https://www.google.com/fusiontables/DataSource?docid=1uL8KJV0bMb7A8-SkrIe0ko2DMtSypHX52DatEE4#rows:id=1
 * https://drive.google.com/#query?view=2&filter=tables
 *
 *
 * Data for the markers consisting of a name, a LatLng and a zIndex for
 * the order in which these markers should display on top of each
 * other.
 */
var beaches = [
    ['USA', 37.090240, -95.712891, 4],
    ['Auckland, New Zealand', -36.848460, 174.763332, 5],
    ['Australia', -25.274398, 133.775136, 3],
    ['Kiev, Ukraine', 48.379433 , 31.165580, 2],
    ['Minsk, Belarus', 53.709807, 27.953389, 1],
    ['Russia', 61.524010, 105.318756, 6]
];

function setMarkers(map, locations) {
    // Add markers to the map

    // Marker sizes are expressed as a Size of X,Y
    // where the origin of the image (0,0) is located
    // in the top left of the image.

    // Origins, anchor positions and coordinates of the marker
    // increase in the X direction to the right and in
    // the Y direction down.
    var image = {
        url: '/assets/marker_20_30.png',
        // This marker is 20 pixels wide by 32 pixels tall.
        size: new google.maps.Size(20, 32),
        // The origin for this image is 0,0.
        origin: new google.maps.Point(0,0),
        // The anchor for this image is the base of the flagpole at 0,32.
        anchor: new google.maps.Point(8, 30)
    };
    // Shapes define the clickable region of the icon.
    // The type defines an HTML &lt;area&gt; element 'poly' which
    // traces out a polygon as a series of X,Y points. The final
    // coordinate closes the poly by connecting to the first
    // coordinate.
    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18 , 1],
        type: 'poly'
    };
    // infowindow - for all marker
    var infowindow = new google.maps.InfoWindow();
    var marker, i;
    // infowindow - for all marker

    for (var i = 0; i < locations.length; i++) {
        var beach = locations[i];
        var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            icon: image,
            shape: shape,
            title: beach[0],
            zIndex: beach[3]
        });
        // center to marker if click
//        google.maps.event.addListener(marker, 'click', (function(marker, i) {
//            return function() {
//                map.setZoom(8);
//                map.setCenter(marker.getPosition());
//            }
//       })(marker, i));
        // center to marker if click
    }
}


function codeAddress(element_address) {
    var address = document.getElementById(element_address).value;
    var image = {
        url: '/assets/marker_20_30.png',
        // This marker is 20 pixels wide by 32 pixels tall.
        size: new google.maps.Size(20, 30),
        // The origin for this image is 0,0.
        origin: new google.maps.Point(0,0),
        // The anchor for this image is the base of the flagpole at 0,32.
        anchor: new google.maps.Point(0, 32)
    };
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            map.setZoom(14);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            //    icon: image
            });
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}

google.maps.event.addDomListener(window, 'load', initialize);


google.maps.event.addDomListener(window, 'load', initialize);


