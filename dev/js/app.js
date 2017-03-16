console.log('JS working');

function initMap() {
  var uluru = {lat: -25.363, lng: 131.044};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}

var createShopForm = document.querySelector('.dashboard__add-cafe');
var addShopBtn = document.querySelector('.add-cafe-btn');

addShopBtn.addEventListener('click', function(e){
  e.preventDefault();
  console.log('Clicked');
  createShopForm.classList.toggle('show-form');
});
