const switchLogic = () => {
  const switchButton = document.querySelector('.switch');
  const switchCheckBox = document.querySelector('.checkbox');
  if (switchButton) {
    switchButton.addEventListener('click', (event) => {
      window.location.replace(switchCheckBox.dataset.url);
    });
  };
};

export {switchLogic};
