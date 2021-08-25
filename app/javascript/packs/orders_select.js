const toggleItemsInOrders = () => {


  const hide = (event, classToAdd) => {
    let elements = document.querySelectorAll(classToAdd);
    elements.forEach((element) => {
      element.classList.toggle('d-none')
    });
  };

  //ORDERS


  const request_toggle = document.querySelector('#request-btn')
  const confirm_toggle = document.querySelector('#confirm-btn')
  const cancel_toggle = document.querySelector('#cancel-btn')

  request_toggle.addEventListener('click', (event) => {
    hide(event,'.Requested');
  })

  confirm_toggle.addEventListener('click', (event) => {
    hide(event, '.Confirmed');
  })

  cancel_toggle.addEventListener('click', (event) => {
    hide(event, '.Cancelled');
  })

  // BASKETS

  const reserved_toggle = document.querySelector('#reserved-btn')
  const available_toggle = document.querySelector('#available-btn')

  reserved_toggle.addEventListener('click', (event) => {
    hide(event, '.Reserved');
  })

  available_toggle.addEventListener('click', (event) => {
    hide(event, '.Available');
  })

  const basketToggles = document.querySelectorAll('.show-orders-button')

  basketToggles.forEach(element => {
    element.addEventListener('click', (event) => {
    hide(event, `.basket-${element.dataset.basketid}`);
  });



});


}

export { toggleItemsInOrders };
