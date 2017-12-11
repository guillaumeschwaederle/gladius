const right_section = document.querySelector('.right_section');
const trainings = document.querySelectorAll('.card_training');
const series_training = gon.series_training;
const exercices = gon.exercices

const title_training = (text) => {
  return `<h1 id='title_training' class="text-center">${text}</h1>`
};

const card = (name_exercice, progress) => {
  return `<div class="card m-b-20 card-body text-xs-center">
    <h5 class="card-title serie_name">${name_exercice}</h5>
    <p class="card-text">
    ${progress}
    </p>
  </div>`
};

const progress = (goal, done) => {
  if (done > goal) {
    return `<div class="progress m-b-20">
      <div class="progress-bar bg-success" role="progressbar" style="width: ${(goal / done) * 100}%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="${done}"></div>
      <div class="progress-bar bg-info" role="progressbar" style="width: ${(done - goal)/ done * 100}%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="${done}"></div>
    </div>`
  } else if (done) {
    return `<div class="progress m-b-20">
      <div class="progress-bar bg-success" role="progressbar" style="width: ${done / goal * 100}%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
    </div>`
  } else {
    return `<div class="progress m-b-20">
      <div class="progress-bar bg-success" role="progressbar" style="width: 0%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
    </div>`
  }
};

const createTitle = (text) => {
  right_section.innerHTML = title_training(text);
};

createTitle("Sélectionnez un programme");

trainings.forEach(function(training) {

  training.addEventListener('click', (event) => {

    const id = training.attributes["data-id"].value;
    const prog = document.querySelector(`[data-id="${id}"]`);
    const name = prog.attributes["data-name"].value
    createTitle(name);
    // console.log(exercices)
    // console.log(series_training[id])
    series_training[id].forEach(function(serie) {
      right_section.insertAdjacentHTML('beforeEnd', card(find_exercice_name(serie['exercice_id']), progress(serie['goal'], serie['done'])));
    });
  });
});

// Problème avec le nom... Le return de la fonction find_exercice_name ne fonctionne pas... .??? mystère

const find_exercice_name = (exercice_id) => {
  exercices.forEach(function(exercice) {
    if (exercice['id'] == exercice_id) {
      return exercice['name']
    };
  })
};



// DELETE BUTTON START
const deleteButtons = document.querySelectorAll('.delete-program-from-index');

deleteButtons.forEach((deleteButton) => {
  deleteButton.addEventListener("click", (event) => {
    deleteprogramfromindex(event);
  });
});

function deleteprogramfromindex(event) {
  event.currentTarget.parentNode.parentNode.remove();
  // location.reload(); <== si on veux reorganiser les card apres un delete
}
// DELETE BUTTON END


// couleur des cards des programes en fonction de la completion

document.addEventListener("DOMContentLoaded", () => {
  const programmePasFaits = document.querySelectorAll('.programme-pas-fait');
  
  programmePasFaits.forEach((programmePasFait) => {
    const card = programmePasFait.parentNode.parentNode;
    card.classList.add("programme-pas-fait-card");
  });

  const programmeSousObj = document.querySelectorAll('.programme-sous-obj');

  programmeSousObj.forEach((programmePasFait) => {
    const card = programmePasFait.parentNode.parentNode;
    card.classList.add("programme-sous-obj-card");
  });

  const programmeFaits = document.querySelectorAll('.programme-fait');

  programmeFaits.forEach((programmePasFait) => {
    const card = programmePasFait.parentNode.parentNode;
    card.classList.add("programme-fait-card");
  });
});