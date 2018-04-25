//= require rails-ujs
//= require_tree

const fat = document.querySelector(".fat");
const filter = document.querySelector(".container-filters");

fat.addEventListener("click",(event) => {
  if (filter.style.display == "block"){
    filter.style.display = "none";
  } else {
    filter.style.display = "block";
  }
})


