7
function submitForm() {

	try{
		alert("Hello");
		var e = document.getElementById("roType");
		var strUser = e.options[e.selectedIndex].value;
		if(strUser==0)
		{
		alert("Please select a user1");
		}
		
		
	midcoQty = document.getElementById("midcoQty").value;
	if ( midcoQty== '' || isNaN(midcoQty)) {
		alert("please fill 'Midco unit ' . its only number ");
		return false;
	}
	midcoYr = document.getElementById("midcoYr").value;
	if ( midcoYr== '' || isNaN(midcoYr)) {
		alert("please fill 'Midco Year ' . its only number ");
		return false;
	}
	
	ltQty = document.getElementById("ltQty").value;
	if (ltQty == '' || isNaN(ltQty)) {
		alert("please fill 'L & T' unit. its only number ");
		return false;
	}
	ltYr = document.getElementById("ltYr").value;
	if ( ltYr== '' || isNaN(ltYr)) {
		alert("please fill 'L & T Year ' . its only number ");
		return false;
	}
	
	gilbergoQty = document.getElementById("gilbergoQty").value;
	if (gilbergoQty == '' || isNaN(gilbergoQty)) {
		alert("please fill 'Gilbergo' unit. its only number ");
		return false;
	}
	gilbergoYr = document.getElementById("gilbergoYr").value;
	if ( gilbergoYr== '' || isNaN(gilbergoYr)) {
		alert("please fill 'Gilbergo Year ' . its only number ");
		return false;
	}
	
	wayneQty = document.getElementById("wayneQty").value;
	if (wayneQty == '' ||isNaN(wayneQty) ) {
		alert("please fill 'Wayne' unit. its only number ");
		return false;
	}
	wayneYr = document.getElementById("wayneYr").value;
	if ( wayneYr== '' || isNaN(wayneYr)) {
		alert("please fill 'Wayne Year ' . its only number ");
		return false;
	}
	
	tokheimQty = document.getElementById("tokheimQty").value;
	if (tokheimQty == '' || isNaN(tokheimQty)) {
		alert("please fill 'Tokheim' unit,  its only number ");
		return false;
	}
	tokheimYr = document.getElementById("tokheimYr").value;
	if ( tokheimYr== '' || isNaN(tokheimYr)) {
		alert("please fill 'Tokheim Year ' . its only number ");
		return false;
	}
	
	/** Verfiy nozzle sales */
	msz = document.getElementById("msz").value;
	if (msz == '' || isNaN(msz)) {
		alert("please fill 'MS Nozzle ' number. its only number ");
		return false;
		}
 
		mszs = document.getElementById("mszs").value;
		if (mszs == '' || isNaN(mszs)) {
			alert("please fill 'MS average' sales. its only number ");
			return false;
		}
		speedz = document.getElementById("speedz").value;
		if (speedz == '' || isNaN(speedz)) {
			alert("please fill 'Speed nozzle'. its only number ");
			return false;
		}
		speedzs = document.getElementById("speedzs").value;
		if (speedzs == '' || isNaN(speedzs)) {
			alert("please fill 'Speed Average' sales. its only number ");
			return false;
		}	
		speed97z = document.getElementById("speed97z").value;
		if (speed97z == '' || isNaN(speed97z)) {
			alert("please fill 'Speed97 nozzle' sales. its only number ");	
			}
		speed97zs = document.getElementById("speed97zs").value;
			if (speed97zs == '' || isNaN(speed97zs)) {
				alert("please fill 'Speed97' sales. its only number ");
				return false;
			}
			hsdz = document.getElementById("hsdz").value;
			if (hsdz == '' || isNaN(hsdz)) {
				alert("please fill 'HSD nozzle' sales. its only number ");
				return false;
			}
			hsdzs = document.getElementById("hsdzs").value;
			if (hsdzs == '' || isNaN(hsdzs)) {
				alert("please fill 'HSD' sales. its only number ");
				return false;
			}
			hspeedz = document.getElementById("hspeedz").value;
			if (hspeedz == '' || isNaN(hspeedz)) {
				alert("please fill 'Hi Speed nozzle' sales. its only number ");
				return false;
			}
			hspeedzs = document.getElementById("hspeedzs").value;
			if (hspeedzs == '' || isNaN(hspeedzs)) {
				alert("please fill 'Hi Speed' sales. its only number ");
				return false;
			}
	}catch(err){
		alert("exception "+err.description);
	}
	return true;
}