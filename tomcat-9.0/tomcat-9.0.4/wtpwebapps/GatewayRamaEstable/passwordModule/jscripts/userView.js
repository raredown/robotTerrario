
	function call(){
//validation for casesensitive	 
if(document.editUserDetailsForm.cs.value=="Y")      	    
		document.getElementById("span1").innerHTML= "True";
   else document.getElementById("span1").innerHTML="False";
	
if(document.editUserDetailsForm.up.value=="Y")      	    
		document.getElementById("span2").innerHTML= "True";
   else document.getElementById("span2").innerHTML="False";

 if(document.getElementById("isblocked").value != 0)
 {
 document.getElementById("span3").innerHTML="<b>User is Blocked</b>&nbsp;&nbsp;&nbsp;&nbsp;";
 document.getElementById("unblock").style.visibility="visible";
}

	}

function modefun(){
document.editUserDetailsForm.mode.value="Unblock";
document.editUserDetailsForm.submit();
}
function backfunction(){
  
  document.editUserDetailsForm.action="backlist.do";
  document.editUserDetailsForm.submit();
}