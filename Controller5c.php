<!DOCTYPE html>
<html>
   <head>
     <title>Controller5c.php</title>
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


<?php
                     
       //connecting to mysql 
       //echo "<h3>I am going to connect to mySql";

       //                                server      user  password  database     
       $connection = mysqli_connect("localhost:8889","root","root","mysql");
       if (mysqli_connect_errno())
       {
          echo "Failed to connect to MySQL: " . mysqli_connect_error();
       }
       else
       {  
          //echo "<br>I have connected to mySql<br>";            
             
          // Change database to another name if needed
             
          $dbName="mysql"; 
          $db_selected = mysqli_select_db( $connection, $dbName );
                      
          if (!$db_selected)
          {
             die( $dbName . ' does not exist, can\'t use it ' . mysqli_error());
          }
          else
          {
             //echo "I selected database : " . $db_selected . " " . $dbName . "<br></h3>" ;
                   
             //access to a table                    
             $tableName = "contacts";
                      
             $query = mysqli_query( $connection, "SELECT * FROM $tableName" );
                     
             //if table does not exist, create it 
             if(!$query)
             {
               // echo "The ".$tableName." does not exists<br>";
                        
               // echo "<br>Creating table : ".$tableName."<br>";
                       
                $sql = "CREATE TABLE ".$tableName."(
			customerid int (50) NOT NULL auto_increment primary key,
                        Telephone VARCHAR(20) NOT NULL,
                        FirstName VARCHAR(30),
                        LastName VARCHAR(30),
                        MainMessage VARCHAR(200)
                        )";
                                
                $result = mysqli_query( $connection, $sql );
                         
                //confirm table creation
                if ($result)
                {
                   echo "table ". $tableName." created<br>";
                }
                else
                {
                   die ("Can\'t create ". $tableName." ". mysqli_error() );
                }
                     
             }//if(!$query) if table does not exist, create it 
                        
          }//end if (!$db_selected) connecting to db
                
       }//end if (mysqli_connect_errno()) connecting to mysql

	
	//find save modify delete clear
        $customerid = $_POST[ 'customerid'];	
	$Telephone = $_POST[ 'Telephone' ];
	$FirstName = $_POST[ 'FirstName' ];
	$LastName = $_POST[ 'LastName' ];
	$MainMessage = $_POST[ 'MainMessage' ];

	$found = $_POST['found'];	

/*		
	echo "$Telephone <br>";
	echo "$FirstName<br>";
	echo "$LastName<br>";
	echo "$MainMessage<br>";
			
*/
	?>

	

<?php

        //extract variableto track array's location

        $location=$_POST['customerid'];

        $location=(int)$location;



        //connect to host

        $connection = mysqli_connect("localhost:8889","root","root","mysql");

        //extract button pressed, If no button is pressed execute First button code.

        if($_POST['Last'])

        {
                $sql="SELECT * FROM contacts order by customerid ASC";
                if ($results=mysqli_query($connection,$sql))
                {

                //find the total number of rows and set the location to the last row
                $rowcount=mysqli_num_rows($results);
                $location=$rowcount-1;

          //data_seek command moves the memory pointer in SQL table objects.

          //location must be INT or LONG.

          mysqli_data_seek($results, $location);

          $row=mysqli_fetch_assoc($results);

          $Telephone    = $row['Telephone'];
          $FirstName    = $row['FirstName'];
          $LastName     = $row['LastName'];
          $MainMessage  = $row['MainMessage'];

        }     //end if ($results=mysqli_query($connection,$sql)) 
	      include('leads.php');

      }       //end if($_POST['Last'])

      else if($_POST['Previous'])

      {
        $sql="SELECT * FROM contacts order by customerid ASC";

        if ($results=mysqli_query($connection,$sql))
        {
          //Decrement location only if it is above the lowest possible value.
          if ($location > 0)
          {
	   echo "location greater thann 0";
            $location=$location-1;

          }

 mysqli_data_seek($results, $location);

          $row         = mysqli_fetch_assoc($results);
          $Telephone   = $row['Telephone'];
          $FirstName   = $row['FirstName'];
          $LastName    = $row['LastName'];
          $MainMessage = $row['MainMessage'];
        }//end if ($results=mysqli_query($connection,$sql))
	 include('leads.php');

      }//end else if($_POST['Previous'])



      else if($_POST['Next'])

      {

        $sql="SELECT * FROM contacts order by customerid ASC";

        if ($results=mysqli_query($connection,$sql))

        {
          //total number of rows for the upper limit of the search function.

          $rowcount=mysqli_num_rows($results);

          //Increment location only if it is below the highest possible value.
          if ($location <$rowcount-1)
          {
            echo "location lower than the highest";
            $location=$location+1;

          }

          mysqli_data_seek($results, $location);

          $row=mysqli_fetch_assoc($results);
          $Telephone   = $row['Telephone'];
          $FirstName        = $row['FirstName'];
          $LastName       = $row['LastName'];
          $MainMessage = $row['MainMessage'];

        }//end if ($results=mysqli_query($connection,$sql))
        include('leads.php');

      }//end else if($_POST['Next'])
      
      else //get First record
      {
        //Resets location to position 0, and grab the first record in the table.
      echo "else statement went to first";
        $location=0;
        $sql="SELECT * FROM contacts order by customerid ASC limit 1";
        if ($result=mysqli_query($connection,$sql))

        {

          $row = mysqli_fetch_array( $result );
          $Telephone   = $row['Telephone'];
          $FirstName        = $row['FirstName'];
          $LastName       = $row['LastName'];
          $MainMessage = $row['MainMessage'];

        }//end if ($result=mysqli_query($connection,$sql))

	include('leads.php');

      }//end else
  mysqli_close($connection); //close sql connection
    ?>
 
		

        
</body>
</html>


