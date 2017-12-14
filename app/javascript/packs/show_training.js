document.addEventListener("DOMContentLoaded", function (event) {
    const btnCreation = document.getElementById('creer-seance-btn');
    const inputDateValue = document.getElementById('seance_date').value;
    const inputDate = document.getElementById('seance_date');
    btnCreation.disabled = true
    btnCreation.classList.add("bouton-disabled");


    inputDate.addEventListener('change', (event) => {
        console.log("clement")
        btnCreation.disabled = false;
        btnCreation.classList.remove("bouton-disabled");
        // btnCreation.classList.remove("bouton-disabled");
        // btnCreation.classList.add("bouton-disabled");
    });
});


