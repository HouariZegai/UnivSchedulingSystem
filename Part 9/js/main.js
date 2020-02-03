

function getPromotion(niveau, option) {
    var xhttp;

    if (window.XMLHttpRequest) { // is modern browser?
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // display data when response is ready and the request finished
            handleResult(this);
        }
    };

    xhttp.open("GET", "php/get_promotion.php?niveau=" + niveau + "&option=" + option, true);
    xhttp.send();
}

function handleResult(xml) {
    // XML data
    var xmlDoc = xml.responseXML,
    etudiantsElement = xmlDoc.getElementsByTagName('etudiant'),
    modulesElement = xmlDoc.getElementsByTagName('module');

    var i,
    tableEtudiants = document.getElementById('tableEtudiants'),
    tbodyModules = document.getElementById('tableModules'),
    tbodyEtudiants = document.getElementById('tbodyEtudiants'),
    tbodyModules = document.getElementById('tbodyModules');
    
    tbodyEtudiants.innerHTML = '';
    tbodyModules.innerHTML = '';

    // append etudiants data to HTML table
    for (i = 0; i < etudiantsElement.length; i++) {
        // Create Row of table and Column
        var tr = document.createElement('tr'),
        tdNumInsc = document.createElement('td'),
        tdNom = document.createElement('td'),
        tdPrenom = document.createElement('td');
    
        // append returned data to created columns 
        tdNumInsc.append(etudiantsElement[i].getAttribute('numInscription'));
        tdNom.append(etudiantsElement[i].getAttribute('nom'));
        tdPrenom.append(etudiantsElement[i].getAttribute('prenom'));

        // append columns to row 
        tr.appendChild(tdNumInsc);
        tr.appendChild(tdNom);
        tr.appendChild(tdPrenom);

        // append row to Tbody
        tbodyEtudiants.appendChild(tr);
    }

    // append Tbody to the table
    tableEtudiants.appendChild(tbodyEtudiants);

    // append etudiants data to HTML table
    for (i = 0; i < modulesElement.length; i++) {
        // Create Row of table and Column
        var tr = document.createElement('tr'),
        tdIdModule = document.createElement('td'),
        tdNomModule = document.createElement('td');

        // append returned data to created columns 
        tdIdModule.append(modulesElement[i].getAttribute('idModule'));
        tdNomModule.append(modulesElement[i].getAttribute('nomModule'));

        // append columns to row 
        tr.appendChild(tdIdModule);
        tr.appendChild(tdNomModule);

        // append row to Tbody
        tbodyModules.appendChild(tr);
    }

    // append Tbody to the table
    tableModules.appendChild(tbodyModules);
}