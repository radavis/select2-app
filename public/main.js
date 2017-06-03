let fetchCities = () => {
  fetch('/cities')
  .then((response) => {
    if (response.ok) {
      return response.json()
    } else {
      console.log(response)
    }
  })
  .then((json) => {
    cities = json['cities'].map((city) => {
      city['text'] = city['name']
      return city
    })
    initializeSelectCities(cities)
  })
}

let initializeSelectCities = (cities) => {
  $('#select-cities').select2({
    placeholder: "Select a city",
    data: cities
  })
}

fetchCities()
