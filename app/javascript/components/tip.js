// import Rails from '@rails/ujs'; // Use to make an ajax post request to Rails

const tipBox = () => {
  const tipButtons = document.querySelector(".tip-buttons")

  if (tipButtons) {
    const restaurantUrl = window.location.href;
    const fields = restaurantUrl.split('/');
    const restaurantId = parseInt(fields.pop(), 10);
    const tipFive = document.querySelector("#tip-five");
    const tipTen = document.querySelector("#tip-ten");
    const totalAmount = parseInt(document.querySelector("#total-amount").innerHTML, 10);

    tipFive.addEventListener("click", (event) => {
      event.preventDefault();
      const updatedTotal = (Math.round((totalAmount * 1.05) * 100) / 100).toFixed(2);
      document.querySelector("#total-amount").innerHTML = updatedTotal

      // Rails.ajax({
      //   url: `/visits/${restaurantId}`,
      //   type: "put",
      //   // if we had data, we could add it like this
      //   data: updatedTotal,
      //   contentType: 'application/json',
      //   success: function(data) {
      //     // console.log(data)
      //   },
      //   error: function(data) { alert('something went wrong!') }
      // })
    });

    tipTen.addEventListener("click", (event) => {
      event.preventDefault();
      document.querySelector("#total-amount").innerHTML = (Math.round((totalAmount * 1.1) * 100) / 100).toFixed(2);
    });
  }
};


export { tipBox };
