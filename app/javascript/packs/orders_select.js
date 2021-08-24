const toggleItemsInOrders = () => {

  const request_toggle = document.querySelector('#request-btn')
  const confirm_toggle = document.querySelector('#confirm-btn')
  const cancel_toggle = document.querySelector('#cancel-btn')

  const hide = (event, classToAdd) => {
    let elements = document.querySelectorAll(classToAdd);
    elements.forEach((element) => {
      element.classList.toggle('d-none')
    });
  };

  request_toggle.addEventListener('click', (event) => {
    hide(event,'.Requested');
  })

  confirm_toggle.addEventListener('click', (event) => {
    hide(event, '.Confirmed');
  })

  cancel_toggle.addEventListener('click', (event) => {
    hide(event, '.Cancelled');
  })


  const basketToggles = document.querySelectorAll('.show-orders-button')

  basketToggles.forEach(element => {
    element.addEventListener('click', (event) => {
    hide(event, `.basket-${element.dataset.basketid}`);
  });
});


}

export { toggleItemsInOrders };
