tag_choice = document.querySelectorAll(".tag-choice");
tag_choice.forEach((element) => {
  element.addEventListener("click",(event) => {
    element.classList.toggle("active");
  });
});
