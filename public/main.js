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
    cities = json.cities.map((city) => {
      city.text = city.name
      return city
    })
    initializeSelectCities(cities)
  })
}

let initializeSelectCities = (cities) => {
  $('#select-cities').select2({
    placeholder: 'Select a city',
    data: cities,
    tags: true  // allows for user input
  })
}

fetchCities()

// change name of select form field depending on its contents.
$('#select-cities').on('select2:close', (event) => {
  console.log('select2:close event fired.')
  let i = event.target.options.selectedIndex
  let selectedOption = event.target[i]
  if (!isNaN(selectedOption.value)) {  // is this string input a number?
    event.target.name = 'cityId'
  } else {
    event.target.name = 'cityName'
  }
})
