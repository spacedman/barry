

var map = L.map('map').setView([20, 0], 2);

L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
}).addTo(map);


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
        layer.bindPopup(feature.properties.title);
    }
}).addTo(map);

var teachingLayer = new L.geoJson(teaching, {
    pointToLayer: function (feature, latLng) {
        return new L.Marker(latLng, {
            icon: greenIcon
	});
    },

    onEachFeature: function (feature, layer) {
        layer.bindPopup(feature.properties.title);
    }
}).addTo(map);
