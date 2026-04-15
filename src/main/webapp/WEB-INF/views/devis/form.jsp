<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    /* Global */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        color: #333;
        padding: 20px;
    }

    h2, h3 {
        color: #222;
    }

    form { 
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        max-width: 1000px;
        margin: auto;
        box-sizing: border-box;
    }

    /* Inputs and selects */
    input[type="text"], input[type="number"], select {
        padding: 8px 12px;
        margin: 5px 0 15px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        width: calc(100% - 26px);
        box-sizing: border-box;
        font-size: 14px;
    }

    select {
        width: 100%;
    }

    /* Buttons */
    button {
        padding: 8px 16px;
        margin-top: 10px;
        border: none;
        border-radius: 6px;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
        font-size: 14px;
    }

    button:hover {
        background-color: #45a049;
    }

    .detail-row {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        align-items: center;
        margin-bottom: 10px;
        border-bottom: 1px solid #eee;
        padding-bottom: 10px;
    }

    .detail-row input {
        width: auto;
        flex: 1;
        min-width: 100px;
    }

    #totalGeneral {
        width: 200px;
        font-weight: bold;
        background-color: #eaeaea;
        border: 1px solid #ccc;
    }

    #resultat p {
        margin: 10px 0;
        font-size: 14px;
    }
</style>

<h2>Création Devis</h2>
<form id="demandeForm">

    Ref Demande (ID) :
    <input type="number" id="demandeId" onblur="fetchDemande()" />
    <br><br>

    <div id="resultat" style="display:none;">
        <p>
        <strong>Client :</strong> <span id="client"></span>,
        <strong>Date :</strong> <span id="dateDemande"></span>,
        <strong>Lieu :</strong> <span id="lieu"></span>,
        <strong>District :</strong> <span id="district"></span>
        </p>
    </div>

    Type de devis :
    <select name="typeDevis.id">
        <c:forEach items="${typesDevis}" var="t">
            <option value="${t.id}">${t.libelle}</option>
        </c:forEach>
    </select>

    <h3>Détails du devis</h3>

    <div id="details-container">
        <button type="button" onclick="ajouterLigne()">Ajouter détails devis</button>

        <div class="detail-row">
            Libellé :
            <input type="text" name="details[0].libelle" />

            Prix :
            <input type="number" name="details[0].prix" class="prix" />

            Quantité :
            <input type="number" name="details[0].quantite" class="quantite" />

            Montant :
            <input type="number" name="details[0].montant" class="montant" readonly />

            <button type="button" onclick="supprimerLigne(this)">Effacer</button>
        </div>
    </div>

    <h3>Total Général :</h3>
    <input type="number" id="totalGeneral" readonly />

    <br><br>

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

let index = 1;
function ajouterLigne() {
    let container = document.getElementById("details-container");
    let div = document.createElement("div");
    div.classList.add("detail-row");
    div.innerHTML = `
        Libellé :
        <input type="text" name="details[${index}].libelle" />

        Prix :
        <input type="number" name="details[${index}].prix" class="prix" />

        Quantité :
        <input type="number" name="details[${index}].quantite" class="quantite" />

        Montant :
        <input type="number" name="details[${index}].montant" class="montant" readonly />

        <button type="button" onclick="supprimerLigne(this)">Effacer</button>
    `;
    container.appendChild(div);
    index++;
    calculerTotalGeneral();
}

// document.addEventListener("input", function(e) {
//     if (e.target.classList.contains("prix") || e.target.classList.contains("quantite")) {
//         let row = e.target.parentElement;
//         let prix = row.querySelector(".prix").value;
//         if(prix >= 1000000){
//             prix = prix -((prix* 10)/100)
//         }
//         let quantite = row.querySelector(".quantite").value;
//         let montant = row.querySelector(".montant");

//         montant.value = (prix * quantite) || 0;
//         calculerTotalGeneral();
//     }
// });

document.addEventListener("input", function(e) {
    if (e.target.classList.contains("prix") || e.target.classList.contains("quantite")) {
        let row = e.target.parentElement;

        let prixInput = row.querySelector(".prix");
        let prix = parseFloat(prixInput.value) || 0;
        let quantite = parseFloat(row.querySelector(".quantite").value) || 0;

        if (prix >= 1000000) {
            prix = prix - ((prix * 10) / 100);
            prixInput.value = prix; 
        }

        let montant = row.querySelector(".montant");
        montant.value = prix * quantite;

        calculerTotalGeneral();
    }
});

function supprimerLigne(button) {
    let row = button.parentElement;
    row.remove();
    calculerTotalGeneral();
}

function calculerTotalGeneral() {
    let total = 0;
    document.querySelectorAll(".montant").forEach(input => {
        total += parseFloat(input.value) || 0;
    });
    document.getElementById("totalGeneral").value = total;
}

function validerDevis() {
    let demandeId = document.getElementById("demandeId").value;
    let typeDevisId = document.querySelector("select[name='typeDevis.id']").value;

    let details = [];
    document.querySelectorAll(".detail-row").forEach(row => {
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