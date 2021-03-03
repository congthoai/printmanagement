/**
 *  Thoại đại ca :D :D
 *  2021/01/05 
 */

var tableToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
        base64 = function (s) {
            return window.btoa(unescape(encodeURIComponent(s)))
        },
        format = function (s, c) {
            return s.replace(/{(\w+)}/g, function (m, p) {
                return c[p];
            })
        }
    return function (table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {
            worksheet: name || 'Worksheet',
            table: table.innerHTML
        }
        window.location.href = uri + base64(format(template, ctx))
    }
})()

function exportTableToExcel(tableID, filename = '') {
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

    // Specify file name
    filename = filename ? filename + '.xls' : 'excel_data.xls';

    // Create download link element
    downloadLink = document.createElement("a");

    document.body.appendChild(downloadLink);

    if (navigator.msSaveOrOpenBlob) {
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob(blob, filename);
    } else {
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
        // Setting the file name
        downloadLink.download = filename;

        //triggering the function
        downloadLink.click();
    }
}

function exportWord(tableId, fileName = '') {

   var html, link, blob, url, css;
   
   // EU A4 use: size: 841.95pt 595.35pt;
   // US Letter use: size:11.0in 8.5in;
   
   css = (
	   '<style>' +
	     '@page WordSection1{size: 841.95pt 595.35pt;mso-page-orientation: landscape;}' +
	     'div.WordSection1 {page: WordSection1;}' +
	     'table{border-collapse:collapse;}td{border:1px black solid;font-size:15px;font-family:"Arial"}'+
	     'th{border:1px black solid;font-size:15px;font-family:"Arial"}' +
	     'table.textright{margin-right:0px}' +
	     '</style>'
   );
   
   html = document.getElementById(tableId).innerHTML;

   blob = new Blob(['\ufeff', css + html], {
     type: 'application/msword'
   });
   url = URL.createObjectURL(blob);
   link = document.createElement('A');
   link.href = url;
   // Set default file name. 
   // Word will append file extension - do not add an extension here.
   link.download = fileName;   
   
   // Specify file name
   fileName = fileName ? fileName + '.doc' : 'PhattinReport.doc';
   
   document.body.appendChild(link);
   if (navigator.msSaveOrOpenBlob ) navigator.msSaveOrOpenBlob( blob, fileName); // IE10-11
   		else link.click();  // other browsers
   document.body.removeChild(link);
 };
 
 
/* Best choice*/
 function exportHtml2Word(htmlId, fileName = ''){
     var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' "+
          "xmlns:w='urn:schemas-microsoft-com:office:word' "+
          "xmlns='http://www.w3.org/TR/REC-html40'>"+
          "<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title>"  +
         '<style>' +
	     '@page WordSection1{size: 11.69in 8.27in;mso-page-orientation: landscape; margin: 1in 0.2in 1in 0.2in}' +
	     'div.WordSection1 {page: WordSection1;}' +
	     'table{border-collapse:collapse;}td{border:1px black solid;font-size:15px;font-family:"Arial"}'+
	     'th{border:1px black solid;font-size:15px;font-family:"Arial"}' +
	     'table.textright{margin-right:0px}' +
	     '</style>' +
     "</head><body>";
     var footer = "</body></html>";
     var sourceHTML = header+document.getElementById(htmlId).innerHTML+footer;
     
     var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(sourceHTML);
     var fileDownload = document.createElement("a");
     document.body.appendChild(fileDownload);
     fileDownload.href = source;
     
     fileName = fileName ? fileName + '.doc' : 'PhattinReport.doc';
     
     fileDownload.download = fileName;
     fileDownload.click();
     document.body.removeChild(fileDownload);
  }
 
