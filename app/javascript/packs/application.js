
import "bootstrap";

const fat = document.querySelector(".fat");
const filter = document.querySelector(".container-filters");

fat.addEventListener("click",function(event) {
  if (filter.style.display == "block"){
    filter.style.display = "none";
  } else {
    filter.style.display = "block";
  }
})

