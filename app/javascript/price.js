window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profitPrice = document.getElementById("profit")

  itemPrice.addEventListener("input", function(){
    const inputValue = itemPrice.value
    addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1))
    addTaxPriceValue = (Math.floor(inputValue * 0.1))
    profitPrice.innerHTML = (Math.floor(inputValue - addTaxPriceValue))
  })
})

