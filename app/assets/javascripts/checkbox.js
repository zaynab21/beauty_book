tag_choice = document.querySelectorAll(".tag-choice");
tag_choice.forEach((element) => {
  element.addEventListener("click",(event) => {
    element.classList.toggle("active");
  });
});

sort_btn = document.querySelectorAll(".sort-btn");
sort_btn.forEach((element) => {
  element.addEventListener("click",(event) => {
    sort_btn.forEach((e) => e.classList.remove("active"));
    element.classList.add("active");
  });
});
