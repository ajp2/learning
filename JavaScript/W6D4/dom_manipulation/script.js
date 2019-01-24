document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const handleFormSubmit = e => {
    e.preventDefault();

    const inputField = document.querySelector(".favorite-input");
    const ulField = document.querySelector("#sf-places");

    const inputText = inputField.value;
    inputField.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = inputText;
    ulField.appendChild(newLi);
  }

  document.querySelector(".list-container form").addEventListener("submit", handleFormSubmit);



  // adding new photos

  const showForm = e => {
    const formDiv = document.querySelector(".photo-form-container");
    if (Array.from(formDiv.classList).includes("hidden")) {
      formDiv.classList.remove("hidden");
    } else {
      formDiv.classList.add("hidden");
    }
  };

  const photoSubmit = e => {
    e.preventDefault();
    const urlField = document.querySelector(".photo-url-input");
    const photoUrl = urlField.value;
    urlField.value = "";

    const newLi = document.createElement("li");
    const photoLink = document.createElement("img");
    photoLink.setAttribute("src", photoUrl);
    newLi.appendChild(photoLink);


    const photosUl = document.querySelector(".dog-photos");
    photosUl.appendChild(newLi);
  }

  document.querySelector(".photo-show-button").addEventListener("click", showForm);


  document.querySelector(".photo-form-container form").addEventListener("submit", photoSubmit);

});
