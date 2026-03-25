<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Creation Devis</h2>
<form id="demandeForm">

    Ref Demande (ID) :
    <input type="number" id="demandeId" onblur="fetchDemande()" />
    <br><br>

    <div id="resultat" style="display:none;">

        <p><strong>Client :</strong> <span id="client"></span></p>

        <p><strong>Date :</strong> <span id="dateDemande"></span></p>

        <p><strong>Lieu :</strong> <span id="lieu"></span></p>

        <p><strong>District :</strong> <span id="district"></span></p>

    </div>

</form>

<script>
function fetchDemande() {
    let id = document.getElementById("demandeId").value;
    if (!id) return;

    let contextPath = window.location.pathname.split('/')[1];

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