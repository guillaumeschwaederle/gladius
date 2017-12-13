const cards = document.querySelectorAll('.card_compl');

cards.forEach((card) => {
  console.log(card);
  const boutonPlus = card.querySelector('.card-plus');
  const boutonMoins = card.querySelector('.card-moins');
  let reps = parseInt(card.querySelector('.input-rep').value, 10);
  const assignement = card.querySelector('.input-rep');
  boutonPlus.addEventListener("click", (event) => {
    reps = reps + 1;
    assignement.value = reps;
  });
  boutonMoins.addEventListener("click", (event) => {
    reps = reps - 1;
    if (reps < 0) {
            reps = 0;
        }
    assignement.value = reps;
  });
});


function increment_on_moins() {
    cardChoixRep.addEventListener("click", (event) => {
        reps = parseInt(cardChoixRep.parentNode.parentNode.querySelector('input').value, 10);
        reps = reps - 1;

        assignement = cardChoixRep.parentNode.parentNode.querySelector('input');
        assignement.value = reps;
    });
};
