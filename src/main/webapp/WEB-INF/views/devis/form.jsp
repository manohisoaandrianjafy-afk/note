<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Creation Devis</h2>
<form id="demandeForm">

    Ref Demande (ID) :
    <input type="number" id="demandeId" onblur="fetchDemande()" />
    <br><br>

    <div id="resultat" style="display:none;">
        <p><strong>Client :</strong> <span id="client"></span>,
        <strong>Date :</strong> <span id="dateDemande"></span>,
        <strong>Lieu :</strong> <span id="lieu"></span>,
        <strong>District :</strong> <span id="district"></span></p>
    </div>

    <br><br>

    Type de devis :
        <select name="typeDevis.id">
            <c:forEach items="${typesDevis}" var="t">
            <option value="${t.id}">${t.libelle}</option>
            </c:forEach>
        </select>

    <h3>Détails du devis</h3>
   
    <div id="details-container">
          <button type="button" onclick="ajouterLigne()">Ajouter details devis</button>
    <br><br>
    <div class="detail-row">
        Libellé :
        <input type="text" name="details[0].libelle" />
        Prix :
        <input type="number" name="details[0].prix" class="prix" />
        Quantité :
        <input type="number" name="details[0].quantite" class="quantite" />
        Montant :
        <input type="number" name="details[0].montant" class="montant" readonly />
        <button type="button" onclick="supprimerLigne(this)">Effacer details</button>
    </div>
    </div>
 <br>
    <button type="button" onclick="validerDevis()">Valider</button>

</form>

<script>
function fetchDemande() {
    let id = document.getElementById("demandeId").value;
    if (!id) return;

    fetch("http://localhost:8080/demandeClient/get/" + id)
        .then(response => {
            if (!response.ok) throw new Error("Demande introuvable");
            return response.json();
        })
        .then(data => {
            document.getElementById("resultat").style.display = "block";
            document.getElementById("client").innerText = data.client.nom;
            document.getElementById("dateDemande").innerText = data.dateDemande;
            document.getElementById("lieu").innerText = data.lieu;
            document.getElementById("district").innerText = data.district;
        })
        .catch(err => {
            alert(err.message);
            document.getElementById("resultat").style.display = "none";
        });
}
</script>

<script>
let index = 1;
function ajouterLigne() {
    let container = document.getElementById("details-container");
    let div = document.createElement("div");
    div.classList.add("detail-row");
    div.innerHTML = `
        <br>
        Libellé :
        <input type="text" name="details[${index}].libelle" />

        Prix :
        <input type="number" name="details[${index}].prix" class="prix" />

        Quantité :
        <input type="number" name="details[${index}].quantite" class="quantite" />

        Montant :
        <input type="number" name="details[${index}].montant" class="montant" readonly />

        <button type="button" onclick="supprimerLigne(this)">Effacer details</button>
    `;
    container.appendChild(div);
    index++;
}
</script>

<script>
document.addEventListener("input", function(e) {
    if (e.target.classList.contains("prix") || e.target.classList.contains("quantite")) {
        let row = e.target.parentElement;
        let prix = row.querySelector(".prix").value;
        let quantite = row.querySelector(".quantite").value;
        let montant = row.querySelector(".montant");

        montant.value = (prix * quantite) || 0;
    }
});
</script>
<script>
function supprimerLigne(button) {
    let row = button.parentElement;
    row.remove();
}
</script>

<!-- <script>
function submitForm() {
    const form = document.getElementById("demandeForm");
    let details = [];
    document.querySelectorAll(".detail-row").forEach((row) => {
        details.push({
            libelle: row.querySelector("input[name*='libelle']").value,
            prix: parseFloat(row.querySelector(".prix").value) || 0,
            quantite: parseFloat(row.querySelector(".quantite").value) || 0
        });
    });

    const dto = {
        demandeId: parseInt(document.getElementById("demandeId").value),
        typeDevisId: parseInt(form.querySelector("select[name='typeDevis.id']").value),
        details: details
    };

    fetch("http://localhost:8080/devis/create", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(dto)
    })
    .then(res => res.json())
    .then(data => alert("Devis créé avec succès !"))
    .catch(err => alert("Erreur : " + err));
}
</script> -->
<script>
function validerDevis() {
    let demandeId = document.getElementById("demandeId").value;
    let typeDevisId = document.querySelector("select[name='typeDevis.id']").value;

    let details = [];
    document.querySelectorAll(".detail-row").forEach((row) => {
        details.push({
            libelle: row.querySelector("input[name*='libelle']").value,
            prix: parseFloat(row.querySelector(".prix").value) || 0,
            quantite: parseFloat(row.querySelector(".quantite").value) || 0
        });
    });

    fetch("http://localhost:8080/devis/create", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            demandeId: parseInt(demandeId),
            typeDevisId: parseInt(typeDevisId),
            details: details
        })
    })
    .then(res => res.json())
    .then(data => alert("Devis créé avec succès !"))
    .catch(err => alert("Erreur : " + err));
}
</script>