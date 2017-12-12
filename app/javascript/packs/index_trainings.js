// Definition des conditions primaires-------------------------------------------------

const right_section = document.querySelector('.right_section');
const trainings = document.querySelectorAll('.card_training');
const series_training = gon.series_training;
const exercices = gon.exercices
let x = 0

/// Definition des fonctions -------------------------------------------------------------

const createTitle = (text) => {
  right_section.innerHTML = title_training(text);
};

const title_training = (text) => {
  return `<h1 id='title_training' class="text-center">${text}</h1>`
};

const card_progress = (name_exercice, progress) => {
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

const card_completion = (name_exercice, goal, completion) => {
  return `<div class="card m-b-20 card-body text-xs-center">
    <h5 class="card-title serie_name">${name_exercice}</h5>
    <p class="card-text">
    Objectif de : ${goal}
    </p>
    ${completion}
  </div>`
};

const find_exercice_name = (exercice_id) => {
  exercices.forEach(function(exercice) {
    if (exercice['id'] == exercice_id) {
      return name = exercice['name']
    };
  })
  return name
};

// JS et Event sur page ----------------------------------------------------------------------------


createTitle("Sélectionnez un programme");

trainings.forEach(function(training) {
  training.addEventListener('click', (event) => {

    const id = training.attributes["data-id"].value;
    const prog = document.querySelector(`[data-id="${id}"]`);
    const name = prog.attributes["data-name"].value
    createTitle(name);
    right_section.insertAdjacentHTML('beforeEnd', form_begin(id));
    series_training[id].forEach(function(serie) {
      form = document.getElementById('form-completion')
      if (serie['done'] != null) {
        form.insertAdjacentHTML('beforeEnd', card_progress(find_exercice_name(serie['exercice_id']), progress(serie['goal'], serie['done'])));
      } else {
        form.insertAdjacentHTML('beforeEnd', card_completion(find_exercice_name(serie['exercice_id']), serie['goal'], completion(serie['id'], serie['goal'])));
        increment_on_plus();
        increment_on_moins();
        x += 1;
      };
    });
    if (training.attributes['data-completion'].value == 0) {
      form.insertAdjacentHTML('beforeEnd', form_end());
    };
  });
});

//// /////////////////////////// ----------------------------------------------------------------------
const completion = (id, goal) => {
  return `<div class="cards_modif">
    <input type="hidden" value="${id}" name="serie${x}[id]">
    <div class="form-group card_series">
      <div class="input-group bootstrap-touchspin ">
        <span class="input-group-btn">
          <button class="btn btn-primary bootstrap-touchspin-down card-moins" type="button">-</button></span>
          <span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>
            <input id="input"
              type="text"
              value="${goal}"
              name="serie${x}[done]"
              data-bts-min="0"
              data-bts-max="100"
              min="0"
              data-bts-step="1"
              data-bts-decimal="0"
              data-bts-step-interval="100"
              data-bts-force-step-divisibility="round"
              data-bts-step-interval-delay="500"
              data-bts-booster="true"
              data-bts-boostat="${goal}"
              data-bts-min-boostat="0"
              data-bts-max-boosted-step="false"
              data-bts-mousewheel="true"
              data-bts-button-down-class="btn btn-default"
              data-bts-button-up-class="btn btn-default"
              class="form-control"
              style="display: block;">
          <span class="input-group-btn">
          <button class="btn btn-primary bootstrap-touchspin-up card-plus "
              type="button">+</button>
        </span>
      </div>
    </div>
  </div>
`}
// document.querySelector('.card-plus').parentNode.parentNode.querySelector('input').value

// for each parse selectioner le dernier


const form_begin = (training_id) => {
 return `<form action="/trainings/${training_id}" method="post" id="form-completion">
          <input type="hidden" name="_method" value="patch">
          <input type="hidden" name="authenticity_token" value=${gon.token}>
        </form>`
};

const form_end = () => {
  return `<input type="submit" class="btn btn-primary"></input>`
};



function increment_on_plus() {
    const cardChoixReps = document.querySelectorAll('.card-plus');
    const cardChoixRep = cardChoixReps[cardChoixReps.length - 1];
    cardChoixRep.addEventListener("click", (event) => {
        reps = parseInt(cardChoixRep.parentNode.parentNode.querySelector('input').value, 10);
        reps = reps + 1;
        assignement = cardChoixRep.parentNode.parentNode.querySelector('input');
        assignement.value = reps;
    });
};

function increment_on_moins() {
    const cardChoixReps = document.querySelectorAll('.card-moins');
    const cardChoixRep = cardChoixReps[cardChoixReps.length - 1];
    cardChoixRep.addEventListener("click", (event) => {
        reps = parseInt(cardChoixRep.parentNode.parentNode.querySelector('input').value, 10);
        reps = reps - 1;
        if (reps < 0) {
            reps = 0;
        }
        assignement = cardChoixRep.parentNode.parentNode.querySelector('input');
        assignement.value = reps;
    });
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
