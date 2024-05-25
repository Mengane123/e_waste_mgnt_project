let map;
let userLocationMarker;
let searchedLocationMarker;
let directionsService;
let directionsRenderer;
let searchBox;
let userLocation;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 0, lng: 0 },
        zoom: 12,
        mapTypeControl: false, 

    });
    map.setOptions({
        streetViewControl: true,
        streetViewControlOptions: {
            position: google.maps.ControlPosition.CENTER_RIGHT
        }
    });

    const locateControl = document.getElementById('locate-control');
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(locateControl);

    directionsService = new google.maps.DirectionsService();
    directionsRenderer = new google.maps.DirectionsRenderer();
    directionsRenderer.setMap(map);

    const input = document.getElementById('location-search');
    searchBox = new google.maps.places.SearchBox(input);

    map.addListener('bounds_changed', function () {
        searchBox.setBounds(map.getBounds());
    });

    getUserLocation();
}

function searchedLocation() {
    const searchInput = document.getElementById('location-search').value;

    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ address: searchInput }, function (results, status) {
        if (status === 'OK' && results[0]) {
            const searchLocat= results[0].geometry.location;

            if (searchedLocationMarker) {
                searchedLocationMarker.setMap(null);
            }

            const markerIcon = {
                url: 'ewhome/img/map/searchedloc.png',
                scaledSize: new google.maps.Size(65, 65), 
                anchor: new google.maps.Point(16, 16) 
            };

            searchedLocationMarker = new google.maps.Marker({
                position: searchLocat,
                map: map,
                title: 'Searched Location',
                icon: markerIcon 
            });

            map.setCenter(searchLocat);
            map.setZoom(11);

            findNearbyEwasteCenters(searchLocat);
        } else {
            alert('Location not found');
        }
    });
}

function getUserLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
          userLocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            if (userLocationMarker) {
                userLocationMarker.setMap(null);
            }

            const markerIcon = {
                url: 'ewhome/img/map/userLocation.png',
                scaledSize: new google.maps.Size(20, 20),
                anchor: new google.maps.Point(16, 16) 
            };

            userLocationMarker = new google.maps.Marker({
                position: userLocation,
                map: map,
                title: 'Your Location',
                icon: markerIcon 
            });

            map.setCenter(userLocation);
            map.setZoom(12);
            findNearbyEwasteCenters(userLocation);
        });
    } else {
        alert('Geolocation is not supported by your browser.');
    }
}

const directionsRenderers = [];
function findNearbyEwasteCenters(userLocation) {
    fetch('ewaste_centers.json')
        .then(response => response.json())
        .then(data => {
            data.forEach(center => {
                const centerLocation = center.location;

                if (!isValidLatLng(userLocation) || !isValidLatLng(centerLocation)) {
                    console.error('Invalid coordinates for user location or e-waste center.');
                    return;
                }

                const distance = google.maps.geometry.spherical.computeDistanceBetween(
                    new google.maps.LatLng(userLocation.lat, userLocation.lng),
                    new google.maps.LatLng(centerLocation.lat, centerLocation.lng)
                );

                if (!isNaN(distance)) {
                    const distanceInKm = (distance / 1000).toFixed(2);

                    const contentString = `<div>
                        <strong>${center.name}</strong><br>
                        Distance: ${distanceInKm} km
                    </div>`;

                    const centerMarker = new google.maps.Marker({
                        position: centerLocation,
                        map: map,
                        title: center.name
                    });

                    const customDirectionsRenderer = new google.maps.DirectionsRenderer({ suppressMarkers: true });
                    directionsRenderers.push(customDirectionsRenderer);
                
                    const markerIcon = {
                        url: 'ewhome/img/map/userLocation.png',
                        scaledSize: new google.maps.Size(20, 20),
                        anchor: new google.maps.Point(16, 16) 
                    };
        
                    userLocationMarker = new google.maps.Marker({
                        position: userLocation,
                        map: map,
                        title: 'Your Location',
                        icon: markerIcon 
                    });
                    centerMarker.addListener('click', function () {
                        calculateAndDisplayRoute(userLocation, centerLocation, customDirectionsRenderer);
                        openInfoWindow(contentString, centerMarker);

                    });
                } else {
                    console.error('Invalid distance for e-waste center.');
                }
            });
        })
        .catch(error => {
            console.error('Error fetching e-waste center data: ', error);
        });
}

function isValidLatLng(location) {
    return (
        location &&
        typeof location.lat === 'number' &&
        typeof location.lng === 'number' &&
        isFinite(location.lat) &&
        isFinite(location.lng)
    );
}

function calculateAndDisplayRoute(origin, destination, customDirectionsRenderer) {
    const request = {
        origin: origin,
        destination: destination,
        travelMode: 'DRIVING'
    };
    for (const renderer of directionsRenderers) {
        renderer.setMap(null);
    }
    customDirectionsRenderer.setMap(null);

    directionsService.route(request, function (result, status) {
        if (status === 'OK') {
            customDirectionsRenderer.setMap(map);
            customDirectionsRenderer.setDirections(result);
        }
    });
}

function searchOnEnter(event) {
    if (event.key === 'Enter') {
        searchedLocation();
    }
}

function displayEwasteCenters() {
    fetch('ewaste_centers.json')
        .then(response => response.json())
        .then(data => {
            const cardContainer = document.getElementById('card-container');
            const swiperWrapper = cardContainer.querySelector('.swiper-wrapper');

            data.forEach(entry => {
                const card = document.createElement('div');
                card.classList.add('card', 'swiper-slide');

                card.innerHTML = `
                    <div class="card__image">
                        <img src="ewhome/img/map/locationMarker.png" alt="card image">
                    </div>
                    <div class="card__content">
                        <span class="card__title">${entry.name}</span>
                        <p class="card__text">${entry.address}</p>
                        <button class="card__btn" data-lat="${entry.location.lat}" data-lng="${entry.location.lng}"  data-name="${entry.name}">Get Directions</button>
                    </div>
                `;

                swiperWrapper.appendChild(card);
            });

            var swiper = new Swiper(".mySwiper", {
                effect: "coverflow",
                grabCursor: true,
                centeredSlides: true,
                slidesPerView: "auto",
                coverflowEffect: {
                    rotate: 0,
                    stretch: 0,
                    depth: 300,
                    modifier: 1,
                    slideShadows: false,
                },
                pagination: {
                    el: ".swiper-pagination",
                },
            });

            const directionButtons = document.querySelectorAll('.card__btn');
            directionButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const lat = parseFloat(this.getAttribute('data-lat'));
                    const lng = parseFloat(this.getAttribute('data-lng'));
                    const destination = { lat, lng };
                    
                    const distance = google.maps.geometry.spherical.computeDistanceBetween(
                        userLocation,
                        new google.maps.LatLng(lat, lng)
                    );
            
                    const distanceInKm = (distance / 1000).toFixed(2);
            
                    const infoWindowContent = `
                    <div>
                        <strong>${this.getAttribute('data-name')}</strong><br>
                        Distance: ${distanceInKm} km
                    </div>
                `;

                    const destinationMarker = new google.maps.Marker({
                        position: destination,
                        map: map,
                        title: data.name
                    });

                    const customDirectionsRenderer = new google.maps.DirectionsRenderer({ suppressMarkers: true });
                    directionsRenderers.push(customDirectionsRenderer);
                    calculateAndDisplayRoute(userLocation, destination, customDirectionsRenderer);
        openInfoWindow(infoWindowContent, destinationMarker);

                });
            });
        })
        .catch(error => {
            console.error('Error fetching JSON data:', error);
        });
}

document.addEventListener("DOMContentLoaded", function () {
    displayEwasteCenters();
});


let currentInfoWindow = null;

function openInfoWindow(content, marker) {
    if (currentInfoWindow) {
        currentInfoWindow.close();
    }

    const infoWindow = new google.maps.InfoWindow({
        content: content,
    });

    infoWindow.open(map, marker);
    currentInfoWindow = infoWindow;
}

