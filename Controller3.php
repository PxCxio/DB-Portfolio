<!DOCTYPE html>
<html>
   <head>
     <title>Controller3.php</title>
   </head>

   <body>
	<style>
 a:link { color:red;
          text-decoration:none;
        }

 a:visited {
            color:green;
           }
h2 {
   font-family:"Courier";
   text-align:center;

   }


h3 {
    font-family : "Times New's Roman";
    text-align : center;
   }

p {
   font-family:"Verdana";
   color:purple;
   line-height:150%;
   text-indent:20px;
  }

head {
      background : #101010;
     }

body {
      background : #C88898;
      margin : 0;
      padding : 0;
      font-family : "Helvetica","Arial";
     }
 #wrapper {
     width : 960px;
     height : auto;
     background : #DAD5C1;
     border-left : 5px solid #A09885;
     border-right : 5px solid #A09885;
     overflow : auto;
     margin : 0;
     padding : 10px;
}
#header {
        width : 100%;
        height : 100px;
        background : #101010
        border-bottom : 3px solid #7c7063;

       }

 nav ul ul
        {
            display: none;
            /*if changed to yes it will display all ul ul menues */
        }


        nav ul li:hover > ul
        {
            display: block;
        }


        nav ul
        {
            /* this section does not seem to have any effect */
            background: purple; /* #efefef; */
            background: linear-gradient(top, #101010 0%, #2f1a1a 100%);
            background: -moz-linear-gradient(top, #101010 0%, #2f1a1a 100%);
            background: -webkit-linear-gradient(top, #101010 0%,#2f1a1a 100%);
            box-shadow: 0px 0px 9px rgba(0,0,0,0.15);
            padding: 0 5px;
            border-radius: 10px;
            list-style: none;
            position: relative;
            display: inline-table;
        }

 nav ul:after
        {
            content: ""; clear: both; display: block;
        }


        nav ul li
        {
            /*left will display the menu in current order
              right will display menu from the right (backwards) */
            float: left;
        }


        nav ul li:hover
        {
            background: #E0E0E0; /* #E0E0E0; #4b545f; = Very dark grayish blue./*
            background: linear-gradient(top, #4f5964 0%, #5f6975 40%);
            background: -moz-linear-gradient(top, #4f5964 0%, #5f6975 40%);
            background: -webkit-linear-gradient(top, #4f5964 0%,#5f6975 40%);
        }


        nav ul li:hover a
        {
            /* this section does not seem to have any effect */
            color: cyan; /* #ffffff; =white#ff00ff; /*#fff; */ /*menu name color */
        }


        nav ul li a
        {
            display: block; padding: 10px 20px; /* menu height by width */
            color: red; /* main menu name #757575;*/ text-decoration: unset;

                /*
                text-decoration: none;
                text-decoration: underline red;
                text-decoration: underline wavy red;

                text-decoration: inherit;
                text-decoration: initial;
                text-decoration: unset;
                */
        }

	
	nav ul ul
        {
                /* sub menues colors #bfc1c6;= light gray #EFEFEF;=darker lightslategray */
                background: #f2f2f2;  border-radius: 0px; padding: 0;
                position: absolute; top: 100%;
        }


        nav ul ul li
        {
                /*lines color top and bottom on submenues selections */
                float: none; /*yes will display menues sideways, not top down */
                border-top: 1px solid black; /*#6b727c; */ /*border top */
                border-bottom: 1px solid black; /*border down */
                position: relative;
        }


        nav ul ul li a
        {
                /* selection name color at ul ul li */
                padding: 10px 40px;
                color: blue; /* #fff; */
        }


        nav ul ul li a:hover
        {
                /* hovering submenu background color selections #4b545f; submenu */
                background: yellow;
        }


        nav ul ul ul
        {
                position: absolute; left: 100%; top:0;
        }

</style>

	<table style="background:black;">
<tr>
<td style="width:20%;">

<tr style="color:black;">
<h2 style="background-color:black;color:blue; width:%100">
    <a name="0xStudios"></a>
    0xStudios 
 </h2>
  <style type="text/css"> </style>
</tr>

</table>

<nav align="center" style="background:#101010;">
<ul>
        <li><a href="../index.html">Pgm1</a>
           <ul>
             <li><a href="../index.html">Home</a>/<li>
             <li><a href="../musicPage.html">Music</a></li>
             <li><a href="../videoPage.html">Videos</a></li>
             <li><a href="../mProduction.html">Music Productions</a></li>
             <li><a href="../hotKeys.html">Life Saving Hot Keys</a></li>
           </ul>
        </li>
     <li><a href="../Pgm2.php">Pgm2</a></li>
     <li><a href="Pgm3.php">Pgm3</a></li>
     <li><a href="../index.html">Home</a></li>

 </ul>
</nav>
</tr>

      


	<?php
	//find save modify delete clear
	
	$Telephone = $_POST[ 'Telephone' ];
	$FirstName = $_POST[ 'FirstName' ];
	$LastName = $_POST[ 'LastName' ];
	$Email = $_POST[ 'Email' ];
	$Interest = $_POST[ 'Interest' ];
	$Cellular = $_POST[ 'Cellular' ];
	$Text = $_POST[ 'Text' ];
	$Emailp = $_POST[ 'Emailp' ];
	$RequestType = $_POST[ 'RequestType' ];
	$MainMessage = $_POST[ 'MainMessage' ];

	/*
	echo "$Telephone <br>";
	echo "$FirstName<br>";
	echo "$LastName<br>";
	echo "$Email<br>";
        echo "$Interest<br>";
        echo "$Cellular<br>";
	echo "$Text<br>";
        echo "$Emailp<br>";
        echo "$RequestType<br>";
	echo "$MainMessage<br>";
	*/	

	?>

	<br>
	<div>
	   <form method="post" action="ControllerPgm3.php">
	   <br>
	  <table style="width: 50%; margin: 0px auto; padding-right: 10%;">

	<tr>
               <td style="width: 5%; text-align: left;">Telephone &nbsp; </td>
               <td style="width: 20%;">
                  <input type="text" name="Telephone" value="<?php echo $Telephone ?>" style="width: 100%;">
               </td>
            </tr>
	
	<tr>
               <td style="width: 5%; text-align: left;">First Name &nbsp; </td>
               <td style="width: 20%;">
                  <input type="text" name="FirstName" value="<?Php echo $FirstName ?>" style="width: 100%;">
               </td>
            </tr>

            <tr>
               <td style="width: 5%; text-align: left;">Last Name &nbsp; </td>
               <td style="width: 20%;">
                  <input type="text" name="LastName" value="<?Php echo $LastName  ?>" style="width: 100%;">
               </td>
            </tr>

            <tr>
               <td style="width: 5%; text-align: left;">Email &nbsp; </td>
               <td style="width: 20%;">
                  <input id="Email" type="text" name="Email" value="<?Php echo $Email ?>" style="width: 100%;">
               </td>
            </tr>

            <tr><td> &nbsp; </td> </tr>


            <tr><td> &nbsp; </td> </tr>

	<!-- Radio buttons-->

            <tr>
               <td style="width: 5%; text-align: left;">Interest &nbsp; </td>
               <td style="width: 20%; text-align: left;">
                  <table style="margin: 0px auto;">
		<tr>
		<?php if($Interest == "Commercial")
		      echo "Commercial";
		elseif ($Interest == "Personal")
			echo "Personal";
		elseif ($Interest == "Other")
			echo "Other";
		else echo "No Preference"
		?>
			
<!--
                        <td text-align: left>
			 <input type="radio" <?php if ($Interest == "Commercial") echo "checked"; ?>
 	     name="Interest" value="Commercial" checked> Commercial &nbsp; &nbsp;
                        <input type="radio" <?php if ($Interest == "Personal") echo "checked";?> 
 	     name="Interest" value="Personal" checked> Personal &nbsp; &nbsp;
                         <input type="radio" <?php if ($Interest == "Other") echo "checked";?> 							 name="Interest" value="Other" checked> Other &nbsp; &nbsp;
                 	</td> -->   
		</tr>
                  </table>
               </td>
            </tr>

            <tr><td> &nbsp; </td> </tr>
	
	<!--Check Boxes -->

            <tr>
               <td style="width: 5%; text-align: left">Contact Preferences &nbsp; </td>
               <td style="width: 20%;">
                  <table>
                     <tr>
                        <td "text-align: left"> <input type="checkbox" name="Cellular"   
			<?php if($Cellular == "Cellular") echo checked; ?>   value="Cellular"> Cell &nbsp;  </td>
                        <td> <input type="checkbox" name="Text" 
			<?php if($Text == "Text") echo checked; ?>  value="Text"> Text   &nbsp;  </td>
                        <td> <input type="checkbox" name="EmailP"
			 <?php if($Emailp == "Emailp") echo checked; ?>  value="Email">Email &nbsp; &nbsp; </td>
                     </tr>
                  </table>
               </td>
            </tr>

	

	     <tr>
               <td style="width: 5%; text-align: left;">Type of Request &nbsp; </td>
               <td style="width: 20%; text-align: left;">
                   <select name="RequestType" style="width: 100%;">
                      <option value="Song Production"<?php if ($RequestType == "Song Production") echo selected;?> >Song Production   </option>
                      <option value="Song Mixing" <?php if ($RequestType == "Song Mixing") echo selected;?>  > Song Mixing </option>
                      <option value="Intellectual Property Request for use" <?php if ($RequestType == "Intellectual Property Request for use") echo selected; ?>  > Intellectual Property Use Request </option>
                      <option value="Online one on one lessons"<?php if ($RequestType == "Online one on one lesson") echo selected; ?> > Online one on one lesson </option>
                      <option value="Midi Drum Library substitution" <?php if($RequestType ==  "Midi Drum Library substitution") echo selected; ?> > Midi Drum Library substituion </option>
                      <option value="Special Request" <?php if($RequestType == "Special Request") echo selected;  ?>> Special Request </option>
                   </select>
               </td>
            </tr>

            <tr><td> &nbsp; </td> </tr>

            <tr>
               <td style="width: 5%; text-align: left;">Main Message &nbsp; </td>
               <td style="width: 20%;">
                  <div>
                     <textarea name="MainMessage" style="width: 100%; height: 50px;"> <?php echo $MainMessage; ?> </textarea>
                  </div>
               </td>
            </tr>

            <tr><td> &nbsp; </td> </tr>

            <tr>
               <td style="width: 15%;"> </td>
               <td style="width: 20%;" align=center>
               <?php echo $comments ?>
               </td>
            </tr>

            <tr><td> &nbsp; </td> </tr>

	    <tr>
		
		<td style="width:20%;">
		</td>
		
		<td>
		 <?php
        //find save modify delete clear


        if ( $_POST['Submit'] )
        {
           echo "This is the Controller3 page, the submit button has been pressed. ";
        }
        else if ( $_POST[ 'Save' ] )

        {
        echo "This is the Controller3 page, the Save button has been pressed";
        }

        else if ( $_POST[ 'Modify' ] )
        {
        echo "This is the Controller3 page, the modify button has just been pressed.";
        }

        else if ( $_POST[ 'Delete' ] )
        {
        echo "This is the Controller3 page, the delete button has just been pressed.";
        }

        else
        {
           echo "This is the Controller3 page, an unknown button was pressed";
        }


      ?>
		

		</td>
		<td style="width:20%;">
		</td>
            </tr>

         </table>
      </form>
</div>

<nav align="center" style="background:#101010">
<ul>
        <li><a href="../index.html">Pgm1</a>
           <ul>
            <li><a href="../index.html">Home</a></li>
             <li><a href="../musicPage.html">Music</a></li>
             <li><a href="../videoPage.html">Videos</a></li>
             <li><a href="../mProduction.html">Music Productions</a></li>
             <li><a href="../hotKeys.html">Life Saving Hot Keys</a></li>
             <li><a href="../Pgm2.php">Pgm2</a></li>i
           </ul>
           </li>
              <li><a href="../Pgm2.php">Pgm2</a></li>
              <li><a href="Pgm3.php">Pgm3</a></li>
              <li><a href="../index.html">Home</a></li>

</ul>
</nav>
</body>
</html>


<!--	
<?php
	
	if ( $_POST['submit'] )
	{
	 // include('submit.php');
	  
	  
	  echo "The submit button has been pressed. ";
	}
	else if ( $_POST[ 'save' ] )

	{
	//include('save.php');
	echo "You just the save submit button, in good time!";
	}	

	else if ( $_POST[ 'modify' ] )
	{
	//include('modify.php');
	echo "The modify button has just been pressed.";
	}	

	else if ( $_POST[ 'delete' ] )
	{
	//include('delete.php');
	echo "The delete button has just been pressed.";
	}

	else
	{
	   
	   echo " unknown button was pressed";
	}

		
      ?>
-->

