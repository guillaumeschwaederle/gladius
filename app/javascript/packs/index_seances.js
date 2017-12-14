const DeleteIcons = document.querySelectorAll('.icon-delete-seance');

DeleteIcons.forEach((DeleteIcon) => {
    DeleteIcon.addEventListener("click", (event) => {
        parrent = DeleteIcon.parentNode.parentNode.parentNode.remove();
    });
});

const rows = document.querySelectorAll('.row-seance');

rows.forEach((row) => {
    row.addEventListener('click', (event) => {
        linkrow = event.currentTarget.querySelector('.icon-open-show-seance').parentNode.href;
        console.log(linkrow);
        parent = event.currentTarget.querySelector('.icon-open-show-seance').parentNode;
        window.location.href = linkrow;
    });
});

rows.forEach((row) => {
    row.addEventListener('mouseover', (event) => {  
        row.classList.add("row-mouse-hover-effet");
    });
});

rows.forEach((row) => {
    row.addEventListener('mouseout', (event) => {
        row.classList.remove("row-mouse-hover-effet");
    });
});

