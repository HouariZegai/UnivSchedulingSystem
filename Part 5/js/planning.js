function loadXSLDoc(filename) {
    let xhttp;
    if (window.XMLHttpRequest) { // is modern browser?
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xhttp.open("GET", filename, false);
    try {
        xhttp.responseType = "msxml-document";
    } catch (err) {
    } // Helping IE11

    xhttp.send("");

    return xhttp.responseXML;
}

function displayResult(xhttp, response, xslFileName) {
    let xsl = loadXSLDoc("xsl/" + xslFileName + ".xsl"),
        xml = new DOMParser().parseFromString(response.responseText, "text/xml"),
        htmlElement = document.getElementById("tables");

    if (response == null)
        console.log("response = null");

    // code for IE
    if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
        htmlElement.innerHTML = xml.transformNode(xsl);
    }
    // code for Chrome, Firefox, Opera, etc.
    else if (document.implementation && document.implementation.createDocument) {
        let xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);

        let resultDocument = xsltProcessor.transformToFragment(xml, document);

        htmlElement.appendChild(resultDocument);
    }
}

function getPlanning(niveau, option) {
    document.getElementById("promo").innerHTML = niveau + option;

    /* remove all children */
    var tables = document.getElementById("tables");
    var child = tables.lastElementChild;
    while (child) {
        tables.removeChild(child);
        child = tables.lastElementChild;
    }

    let xhttp;

    if (window.XMLHttpRequest) { // is modern browser?
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) { // display data when response is ready and the request finished
            displayResult(xhttp, this, "planning");
        }
    };

    xhttp.open("GET", "php/get_planning.php?niveau=" + niveau + "&option=" + option, true);
    xhttp.send();
}