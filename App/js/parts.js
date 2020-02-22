function loadXMLFile(fileLocation) {
    let xhttp;
    if (window.XMLHttpRequest) { // is modern browser?
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xhttp.open("GET", fileLocation, false);
    try {
        xhttp.responseType = "msxml-document";
    } catch (err) {
    } // Helping IE11

    xhttp.send("");

    return xhttp.responseXML;
}

function onQ2Clicked() {

}