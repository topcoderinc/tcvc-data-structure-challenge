// The formula: c = (r * p)/(1 - (Math.pow((1 + r), (-n))))
// @param p float amount borrowed
// @param r interest as a percentage
// @param n term in years
function calculateMortgage(p, r, n){

  r = percentToDecimal(r);
  n = yearsToMonths(n);

  var pmt = (r * p)/(1 - (Math.pow((1 + r), (-n))));

  return parseFloat(pmt.toFixed(2));
}

function percentToDecimal(percent){
  return (percent/12)/100;
}

function yearsToMonths(year){
  return year * 12;
}

function postPayments(payment){
    var answer = document.getElementById("outMonthly");
    $("#house_payment").val(payment);
    console.log(answer);
    answer.innerText = "$" + payment;
}

$(document).ready(function() {
  console.log("hey")
  $("#btnCalculate").click(function(){
      console.log("hello");
      var cost = document.getElementById("house_cost").value;
      var interest = document.getElementById("house_interest").value;
      var term = document.getElementById("house_period").value;
      var downPayment = document.getElementById("house_down_payment").value;
      var amountBorrowed = cost - downPayment;

      var pmt = calculateMortgage(amountBorrowed, interest, term);

      postPayments(pmt);
  });

  function postTotalPayments(payment){
      var totalAnswer = document.getElementById("outTotal");
      $("#house_total").val(payment);
      totalAnswer.innerText = "$" + payment;
  }

  $(document).ready(function() {
    console.log("hey")
    $("#btnTotal").click(function(){
        console.log("hello");
        var cost = document.getElementById("house_cost").value;
        var interest = document.getElementById("house_interest").value;
        var term = document.getElementById("house_period").value;
        var downPayment = document.getElementById("house_down_payment").value;
        var amountBorrowed = cost - downPayment;
        var taxes = document.getElementById("house_taxes").value;
        var insurance = document.getElementById("house_insurance").value;

        var pmt = calculateMortgage(amountBorrowed, interest, term);
        var totalPmt = pmt + (taxes / 12) + (insurance / 12)

        postTotalPayments(totalPmt);
    });
  })
})
