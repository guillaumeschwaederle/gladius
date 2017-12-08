

const newSerie = (text) => {
    return `<div class= "card-exercice-new-serie" data-name= "${text}">
        <div class="form-group">
            <label class="control-label">${text}</label>
            <div class="input-group bootstrap-touchspin">
                <span class="input-group-btn">
                    <button class="btn btn-primary bootstrap-touchspin-down card-moins" type="button">-</button></span>
                    <span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>
                    <input id="demo0"
                    type="text"
                    value="10"
                    name="demo0"
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
                            title="overall type: UNKNOWN_TYPE
                                server type: NO_SERVER_DATA
                                heuristic type: UNKNOWN_TYPE
                                label: 55
                                parseable name: demo0
                                field signature: 1118299366
                                form signature: 4665707751168479884"
                            autofill-prediction="UNKNOWN_TYPE">
                    <span class="input-group-addon bootstrap-touchspin-postfix"
                        style="display: none;"></span>
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

const cards = document.querySelectorAll('.card');

cards.forEach((card) => {
    card.addEventListener("click", (event) => {
        const dataNameCurrentCard = event.currentTarget.attributes["data-name"].value
        document.getElementById('newserie').insertAdjacentHTML('beforeend', newSerie(dataNameCurrentCard));
        increment_on_plus();
        increment_on_moins();
    });
});

function increment_on_plus() {
    const cardChoixReps = document.querySelectorAll('.card-plus');
    cardChoixReps.forEach((cardChoixRep) => {
        cardChoixRep.addEventListener("click", (event) => {
            reps = parseInt(cardChoixRep.parentNode.parentNode.querySelector('input').value, 10);
            reps = reps + 1;
            assignement = cardChoixRep.parentNode.parentNode.querySelector('input');
            assignement.value = reps;
            console.log("jai cliqué sur ce plus +");
        });
    });
}

function increment_on_moins() {
    const cardChoixReps = document.querySelectorAll('.card-moins');
    cardChoixReps.forEach((cardChoixRep) => {
        cardChoixRep.addEventListener("click", (event) => {
            reps = parseInt(cardChoixRep.parentNode.parentNode.querySelector('input').value, 10);
            reps = reps - 1;
            console.log(reps);
            console.log(reps);
            if (reps < 0) {
                reps = 0;
            } 
            assignement = cardChoixRep.parentNode.parentNode.querySelector('input');
            assignement.value = reps;
            console.log("jai cliqué sur ce moins +");
        });
    });
}




