const right_section = document.querySelector('.right_section');
const trainings = document.querySelectorAll('.card_training');
const series = gon.series

const title_training = (text) => {
  return `<h1 id='title_training' class="text-center">${text}</h1>`
}

const container = `<div class: 'container right_container'></div>`
const card = `<div class="card m-b-20 card-body text-xs-center">
    <h5 class="card-title serie_name">Frites</h5>
    <p class="card-text">
    frites
    </p>
</div>`

function createTitle(text) {
  right_section.innerHTML = title_training(text);
}

createTitle("Cliquez sur un programme");

trainings.forEach(function(training) {

  training.addEventListener('click', (event) => {

    const id = training.attributes["data-id"].value;
    const prog = document.querySelector(`[data-id="${id}"]`);
    const name = prog.attributes["data-name"].value
    createTitle(name);

    const s = series.querySelectorAll(`[data-id="${id}"]`);
    right_section.insertAdjacentHTML('beforeEnd', card);
    // Insérer le title

      // insérer le nom du programme dans le title
    // Je veux sélectionner les séries du programme que j'ai sélectionné
    // Faire un each sur chaque
      // Ajouter la Card
        // avec les bonnes valeurs
        // et si possible


    // Recupérer les infos pour les crées


  });
});

console.log(gon.series);


