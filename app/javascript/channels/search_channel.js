// app/javascript/channels/search_channel.js
import consumer from "./consumer";

consumer.subscriptions.create("SearchChannel", {
  connected() {
    // Ovaj kod se izvršava kada je uspostavljena veza
    console.log("Connected to SearchChannel");
  },
  
  disconnected() {
    // Ovaj kod se izvršava kada je veza prekinuta
    console.log("Disconnected from SearchChannel");
  },
  
  received(data) {
    console.log(data); // Prikazuje podatke u konzoli prilikom svakog primljenog događaja
    // Ovde možete prilagoditi kako želite prikazati rezultate pretrage

    const searchResultsContainer = document.getElementById("search-results");
    const resultItem = document.createElement("div");
    resultItem.textContent = data.query;

    searchResultsContainer.appendChild(resultItem);
  },
});

document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("search-input");

  searchInput.addEventListener("input", function () {
    const query = searchInput.value;

    // Emitujemo poruku na SearchChannel kada korisnik unese pretragu
    consumer.subscriptions.subscriptions[0].perform("receive", { query: query });
  });
});
