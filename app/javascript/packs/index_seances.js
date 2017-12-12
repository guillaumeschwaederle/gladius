const DeleteIcons = document.querySelectorAll('.icon-delete-seance');

DeleteIcons.forEach((DeleteIcon) => {
    DeleteIcon.addEventListener("click", (event) => {
        parrent = DeleteIcon.parentNode.parentNode.parentNode.remove();
    });
});