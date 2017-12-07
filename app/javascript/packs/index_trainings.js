const right_section = document.querySelector('.right_section');
const trainings = document.querySelectorAll('.card_training');

trainings.forEach(function(training) {

  training.addEventListener('click', (event) => {

    right_section.innerHTML = ''
    right_section.innerHTML = `<div>Nous n'avons rien pour le moment, mais ça va venir</div>`

  });
});
