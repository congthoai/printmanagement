/**
 * 
 */
$('.table-order td').css("vertical-align", "inherit");

$('#sidebar').addClass("menu-min");

$("#checkAll").change(function() {
	if($(this).is(":checked") == true) {
		$("td [type=checkbox]").prop('checked', true);
	} else {
		$("td [type=checkbox]").prop('checked', false);
	}
	
});

$(".btnQuickEdit").click(function(e) {
	e.preventDefault();
	let orderid = $(this).val();
	
	let data = getOrderRowData(orderid);
	updateNew(data);
});

$(".orderrow td input").on({
	mouseenter: function() {
		$(this).css("border", "1px solid lightskyblue");
    },
    mouseleave: function() {
    	$(this).css("border", "1px solid white");
	}
});

$('.modelquantity').change(function() {
	let element = $(this);
	calculateData(element);
});

$('.modelheight').change(function() {
	let element = $(this);
	calculateData(element);
});
  
 $('.modelwidth').change(function() {
	let element = $(this);
	calculateData(element);
 });

$('.modelpaid').change(function() {
	orderid = $(this).parent().parent().attr('data-orderid');
    let paid = parseInt(formatCurrencyToNumer($(this).val()));
    let total = parseInt(formatCurrencyToNumer($("#total" + orderid).text()));
    let unpaid = total - paid;
    unpaid >= 0 ? $("#debt" + orderid).text(formatNumber(unpaid+"₫") + " ₫") : $("#debt" + orderid).text("-"+formatNumber(unpaid+"₫") + " ₫");
    //$("#debt" + orderid).text(formatNumber(unpaid+"₫") + " ₫");
    $("#debt" + orderid).change();
  });

$('.modeldebt').change(function() {
	orderid = $(this).parent().attr('data-orderid');
	let total = parseInt(formatCurrencyToNumer($("#total" + orderid).text()));
    let debt = parseInt(formatCurrencyToNumer($(this).text()));
    if(debt <= "0") {
    	$("#status" + orderid).text("paid");
    	$("#status" + orderid).removeClass("label-info");
    	$("#status" + orderid).removeClass("label-warning");
    	$("#status" + orderid).addClass("label-success");
    }
    else {
      if(debt < total) {
    	  $("#status" + orderid).text("partpaid");
	      	$("#status" + orderid).removeClass("label-success");
	    	$("#status" + orderid).removeClass("label-warning");
	    	$("#status" + orderid).addClass("label-info");
	        return;
      }
      $("#status" + orderid).text("unpaid");
	  	$("#status" + orderid).removeClass("label-info");
		$("#status" + orderid).removeClass("label-success");
		$("#status" + orderid).addClass("label-warning");
    }
});

function formatCurrencyToNumer(variable) {
  // format number $1,234,567₫ vnđ  to 1234567
  console.log(variable);
  return variable.replace(/,/g, "").replace("$", "").replace("vnđ", "").replace("₫", "").replace(/ /g, "");
}
	
function getOrderRowData(orderid) {
    var data = {};
    data["id"] = orderid;
    data["code"] = $("#code" + orderid).text();
    data["width"] = $("#width" + orderid).val();
    data["height"] = $("#height" + orderid).val();
    data["quantity"] = $("#quantity" + orderid).val();
    data["itemid"] = $("#itemid" + orderid).val();
    data["customerid"] = $("#customerid" + orderid).val();
    data["paid"] = formatCurrencyToNumer($("#paid" + orderid).val());
    data["content"] = $("#content" + orderid).val();
    
    console.log(data);
    return data;
}

function formatNumber(n) {
  // format number 1000000 to 1,234,567
  return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}


function formatCurrency(input, blur) {
  // appends $ to value, validates decimal side
  // and puts cursor back in right position.
  
  // get input value
  var input_val = input.val();
  
  // don't validate empty input
  if (input_val === "") { return; }
  
  // original length
  var original_len = input_val.length;

  // initial caret position 
  var caret_pos = input.prop("selectionStart");
    
  // check for decimal
  if (input_val.indexOf(".") >= 0) {

    // get position of first decimal
    // this prevents multiple decimals from
    // being entered
    var decimal_pos = input_val.indexOf(".");

    // split number by decimal point
    var left_side = input_val.substring(0, decimal_pos);
    var right_side = input_val.substring(decimal_pos);

    // add commas to left side of number
    left_side = formatNumber(left_side);

    // validate right side
    right_side = formatNumber(right_side);
    
    // On blur make sure 2 numbers after decimal
    if (blur === "blur") {
      right_side += "00";
    }
    
    // Limit decimal to only 2 digits
    right_side = right_side.substring(0, 2);

    // join number by .
    input_val ="₫" + left_side + "." + right_side;

  } else {
    // no decimal entered
    // add commas to number
    // remove all non-digits
    input_val = formatNumber(input_val);
    input_val = "₫" + input_val;
    
    // final formatting
    if (blur === "blur") {
      input_val += ".00";
    }
  }
  
  // send updated string to input
  input.val(input_val);

  // put caret back in the right position
  var updated_len = input_val.length;
  caret_pos = updated_len - original_len + caret_pos;
  input[0].setSelectionRange(caret_pos, caret_pos);
}

/*var date = new Date("15-05-2018".replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"))*/

