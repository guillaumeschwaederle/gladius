const label = document.getElementById('label');
const img = document.getElementById('profile_photo');

img.addEventListener("change", (event) => {
  if (img.value != "") {
    label.innerText = "Photo sélectionnée"
  }
});
