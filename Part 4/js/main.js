

function getPlanning(niveau, option) {
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

    xhttp.open("GET", "php/get_emploi.php?niveau=" + niveau + "&option=" + option, true);
    xhttp.send();
}

function handleResult(xml) {
    var i,
    xmlDoc = xml.responseXML,
    table = document.getElementById('tablePlanning'),
    tbody = document.getElementById('tableBody'),
    x = xmlDoc.getElementsByTagName('seance');
    tbody.innerHTML = '';

    for (i = 0; i < x.length; i++) {
        // Create Row of table and Column
        var tr = document.createElement('tr'),
            tdJour = document.createElement('td'),
            tdDebut = document.createElement('td'),
            tdFin = document.createElement('td'),
            tdProf = document.createElement('td'),
            tdModule = document.createElement('td'),
            tdSalle = document.createElement('td');
        
            // append returned data to created columns 
            tdJour.append(x[i].getAttribute('jour'));
            tdDebut.append(x[i].getAttribute('debut'));
            tdFin.append(x[i].getAttribute('fin'));
            tdProf.append(x[i].getAttribute('prof'));
            tdModule.append(x[i].getAttribute('module'));
            tdSalle.append(x[i].getAttribute('salle'));

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
        // append Tbody to the demo table
        table.appendChild(tbody);
}