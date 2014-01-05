

var map = L.map('map').setView([20, 0], 2);


//add a tile layer to add to our map, in this case it's the 'standard' OpenStreetMap.org tile server
var baseMap = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© <a href="http://openstreetmap.org">OpenStreetMap</a> contributors',
    maxZoom: 18
});

var sMap = L.tileLayer('http://{s}.tile.stamen.com/watercolor/{z}/{x}/{y}.jpg', {
    attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, ' +
                                        '<a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; ' +
                                        'Map data {attribution.OpenStreetMap}',
    maxZoom: 16, minZoom: 2
});



sMap.addTo(map);

var RedIcon = L.Icon.Default.extend({
    options: {iconUrl: "/media/img/marker-red.png"}
});
var BlueIcon = L.Icon.Default.extend({
    options: {iconUrl: "/media/img/marker-blue.png"}
});
var GreenIcon = L.Icon.Default.extend({
    options: {iconUrl: "/media/img/marker-green.png"}
});

var redIcon = new RedIcon();
var greenIcon = new GreenIcon();
var blueIcon = new BlueIcon();

var researchLayer = new L.geoJson(research, {
    pointToLayer: function (feature, latLng) {
        return new L.Marker(latLng, {
            icon: redIcon
	});
    },
    onEachFeature: function (feature, layer) {
        layer.bindPopup("Research: <a href='"+feature.properties.link+"'>" + feature.properties.title+"</a>");
    }
});

// researchLayer.addTo(map);

var teachingLayer = new L.geoJson(teaching, {
    pointToLayer: function (feature, latLng) {
        return new L.Marker(latLng, {
            icon: greenIcon
	});
    },

    onEachFeature: function (feature, layer) {
        layer.bindPopup("Teaching: <a href='"+feature.properties.link+"'>" + feature.properties.title+"</a>");
    }
});

var travelLayer = new L.geoJson(travel, {
    pointToLayer: function (feature, latLng) {
        return new L.Marker(latLng, {
            icon: blueIcon
	});
    },

    onEachFeature: function (feature, layer) {
	layer.bindPopup("Travels: <a href='"+feature.properties.link+"'>" + feature.properties.title+"</a>");        
    }
});

map.addLayer(researchLayer);
map.addLayer(teachingLayer);
map.addLayer(travelLayer);

var overlayMaps = {
    "Travel": travelLayer,
    "Research": researchLayer,
    "Teaching": teachingLayer
};

L.control.layers([], overlayMaps).addTo(map);

