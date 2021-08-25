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

  if (request_toggle){
  request_toggle.addEventListener('click', (event) => {
    hide(event,'.Requested');
  })
  }

  if (confirm_toggle){
  confirm_toggle.addEventListener('click', (event) => {
    hide(event, '.Confirmed');
  })
  }

  if (cancel_toggle){
  cancel_toggle.addEventListener('click', (event) => {
    hide(event, '.Cancelled');
  })
  }

  // BASKETS

  const reserved_toggle = document.querySelector('#reserved-btn')
  const available_toggle = document.querySelector('#available-btn')
  const basketToggles = document.querySelectorAll('.show-orders-button')

  if (reserved_toggle) {
  reserved_toggle.addEventListener('click', (event) => {
    hide(event, '.Reserved');
  })
  }

  if (available_toggle){
    available_toggle.addEventListener('click', (event) => {
      hide(event, '.Available');
    })
  }

  if (basketToggles)
  {
    basketToggles.forEach(element => {
      element.addEventListener('click', (event) => {
        hide(event, `.basket-${element.dataset.basketid}`);
      });
    });
  }
}

export { toggleItemsInOrders };
