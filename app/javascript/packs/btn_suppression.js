function deleteExerciceCard() {
  const btns = document.querySelectorAll('.text-muted a');
  btns.forEach(function(btn) {
    btn.addEventListener("click", (event) => {
      if (confirm('Etes-vous sur(e) de vouloir supprimer cet exercice ?')) {
        btn.parentNode.parentNode.parentNode.remove();
      }
    });
  })
}
deleteExerciceCard()
