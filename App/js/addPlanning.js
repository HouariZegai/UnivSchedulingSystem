/* Load add planning data */

function getXmlHttpRequest() {
    let xhttp;
    if (window.XMLHttpRequest) { // is modern browser?
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xhttp;
}

function getProfs() {
    let xhttp = getXmlHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) { // display data when response is ready and the request finished
            // get profs

            var profs = JSON.parse(this.responseText),
                selectProf = document.getElementById("formSelectProf");

            for(i in profs) {
                var opt = document.createElement('option');
                opt.innerHTML = profs[i];
                selectProf.appendChild(opt);
            }
        }
    };

    xhttp.open("GET", "php/get_profs.php", true);
    xhttp.send();
}

function getModules() {
    let xhttp = getXmlHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) { // display data when response is ready and the request finished
            // get profs

            var profs = JSON.parse(this.responseText),
                selectProf = document.getElementById("formSelectModule");

            for(i in profs) {
                var opt = document.createElement('option');
                opt.innerHTML = profs[i];
                selectProf.appendChild(opt);
            }
        }
    };

    xhttp.open("GET", "php/get_modules.php", true);
    xhttp.send();
}

function getSalles() {
    let xhttp = getXmlHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) { // display data when response is ready and the request finished
            // get profs

            var profs = JSON.parse(this.responseText),
                selectProf = document.getElementById("formSelectSalle");

            for(i in profs) {
                var opt = document.createElement('option');
                opt.innerHTML = profs[i];
                selectProf.appendChild(opt);
            }
        }
    };

    xhttp.open("GET", "php/get_salles.php", true);
    xhttp.send();
}

getProfs();
getModules();
getSalles();

function addCourseToPlanning() {
    var selectJour = document.getElementById("formSelectJour"),
        selectDebut = document.getElementById("formSelectHeureDebut"),
        selectFin = document.getElementById("formSelectHeureFin"),
        selectProf = document.getElementById("formSelectProf"),
        selectModule = document.getElementById("formSelectModule"),
        selectSalle = document.getElementById("formSelectSalle");

    var tbody = document.getElementById("tbodyAddPlanning"),
        tr = document.createElement('tr'),
        tdJour = document.createElement('td'),
        tdDebut = document.createElement('td'),
        tdFin = document.createElement('td'),
        tdProf = document.createElement('td'),
        tdModule = document.createElement('td'),
        tdSalle = document.createElement('td');

    // append data to created columns
    tdJour.append(selectJour.options[selectJour.selectedIndex].value);
    tdDebut.append(selectDebut.options[selectDebut.selectedIndex].value);
    tdFin.append(selectFin.options[selectFin.selectedIndex].value);
    tdProf.append(selectProf.options[selectProf.selectedIndex].value);
    tdModule.append(selectModule.options[selectModule.selectedIndex].value);
    tdSalle.append(selectSalle.options[selectSalle.selectedIndex].value);

    // append columns to row
    tr.appendChild(tdJour);
    tr.appendChild(tdDebut);
    tr.appendChild(tdFin);
    tr.appendChild(tdProf);
    tr.appendChild(tdModule);
    tr.appendChild(tdSalle);

    // append row to Tbody
    tbody.appendChild(tr);
}

function addPlanning() {
    var rows = document.getElementById("tbodyAddPlanning").rows;

    var doc = document.implementation.createDocument("", "", null);
    var emploiElem = doc.createElement("emploi");
    emploiElem.setAttribute("promotion", document.getElementById("formInputPromotion").value);
    console.log("Promo: ", document.getElementById("formInputPromotion").value);

    for(var i = 0; i < rows.length; i++){
        var td = rows[i].getElementsByTagName("td"),
            seanceElem = doc.createElement("seance"),
            j = 0;

        seanceElem.setAttribute("jour", td[j++].innerText);
        seanceElem.setAttribute("debut", td[j++].innerText);
        seanceElem.setAttribute("fin", td[j++].innerText);
        seanceElem.setAttribute("prof", td[j++].innerText);
        seanceElem.setAttribute("module", td[j++].innerText);
        seanceElem.setAttribute("salle", td[j++].innerText);
        emploiElem.appendChild(seanceElem);
    }

    doc.appendChild(emploiElem);

    var blob = new Blob(["<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + new XMLSerializer().serializeToString(stringData)], { type: "text/xml;charset=utf-8" });
    saveAs(blob, "planning.xml");

    document.getElementById("tbodyAddPlanning").innerText = "";
}

function saveData(stringData){
}