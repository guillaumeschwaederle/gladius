const newSerie = (text, x) => {
    return `<div class= "card-exercice-new-serie" data-name= "${text}">
        <input type="hidden" value="${text}" name="serie${x}[exercice_name]">
        <div class="form-group">
            <label class="control-label">${text}</label>
            <div class="input-group bootstrap-touchspin ">
                <span class="input-group-btn">
                    <button class="btn btn-primary bootstrap-touchspin-down card-moins" type="button">-</button></span>
                    <span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>
                    <input id="demo0"
                    type="text"
                    value="10"
                    name="serie${x}[goal]"
                    data-bts-min="0"
                    data-bts-max="100"
                    min="0"
                    data-bts-init-val=""
                    data-bts-step="1"
                    data-bts-decimal="0"
                    data-bts-step-interval="100"
                    data-bts-force-step-divisibility="round"
                    data-bts-step-interval-delay="500"
                    data-bts-prefix=""
                    data-bts-postfix=""
                    data-bts-prefix-extra-class=""
                    data-bts-postfix-extra-class=""
                    data-bts-booster="true"
                    data-bts-boostat="10"
                    data-bts-min-boostat="0"
                    data-bts-max-boosted-step="false"
                    data-bts-mousewheel="true"
                    data-bts-button-down-class="btn btn-default"
                    data-bts-button-up-class="btn btn-default"
                            class="form-control"
                            style="display: block;"
                    <span class="input-group-addon bootstrap-touchspin-postfix"
                        style="display: none;"></span>
                    <span class="input-group-btn">
                    <button class="btn btn-primary bootstrap-touchspin-up card-plus "
                        type="button">+</button>
                </span>
            </div>
            <div>
            </br>
            <button class="btn btn-outline-warning btn-block delete-exercice-from-serie"
                        type="button">Supprimer</button>
            </div>
        </div>
    </div>
`}

const cards = document.querySelectorAll('.card');
let x = 0



cards.forEach((card) => {
    card.addEventListener("click", (event) => {
        const dataNameCurrentCard = event.currentTarget.attributes["data-name"].value
        document.getElementById('formul').insertAdjacentHTML('beforeend', newSerie(dataNameCurrentCard, x));
        increment_on_plus();
        increment_on_moins();
        delete_exercice_on_btn_click();
        x += 1;
    });
});

function increment_on_plus() {
    const cardChoixReps = document.querySelectorAll('.card-plus');
    const cardChoixRep = cardChoixReps[cardChoixReps.length - 1];
    cardChoixRep.addEventListener("click", (event) => {
        reps = parseInt(cardChoixRep.parentNode.parentNode.querySelector('input').value, 10);
        reps = reps + 1;
        assignement = cardChoixRep.parentNode.parentNode.querySelector('input');
        assignement.value = reps;
    });
}

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
}

function delete_exercice_on_btn_click() {
    const deleteButtons = document.querySelectorAll('.delete-exercice-from-serie');
    const deleteButton = deleteButtons[deleteButtons.length - 1];
    deleteButton.addEventListener("click", (event) => {
        parrent = deleteButton.parentNode.parentNode.parentNode.parentNode;
        cardCurrent = deleteButton.parentNode.parentNode.parentNode;
        console.log(cardCurrent);
        parrent.removeChild(cardCurrent);
    });
}
