window.addEventListener('load', () => {
  

// 金額を入力した数値をpriceInputという変数に格納する
const inputPrice = document.getElementById("item-price");
const content = document.getElementById("add-tax-price")
const profit = document.getElementById("profit")
  
  inputPrice.addEventListener('input', function(){
    const price = document.getElementById("item-price").value;
    tax_price = Math.floor(price/10);
    content.innerHTML = tax_price
    
    Net_income = Math.floor(price - tax_price);
    profit.innerHTML = Net_income
    
  })
})