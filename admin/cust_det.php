<?php
  session_start();
  include("../db.php");
  if(!isset($_SESSION["AID"])){
    header("location:../admin_login.php");
  }
?>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Details</title>
    <link rel="stylesheet" type="text/css" href="../css/cards.css">
    <link rel="stylesheet" type="text/css" href="../css/profile.css">
    <link rel="stylesheet" type="text/css" href="../css/font.scss">

    <style>
       .blackboard {
                position: relative;
                width: 640px;
                margin: 7% auto;
                border: tan solid 12px;
                border-top: #bda27e solid 12px;
                border-left: #b19876 solid 12px;
                border-bottom: #c9ad86 solid 12px;
                box-shadow: 0px 0px 6px 5px rgba(58, 18, 13, 0), 0px 0px 0px 2px #c2a782, 0px 0px 0px 4px #a58e6f, 3px 4px 8px 5px rgba(0, 0, 0, 0.5);
                background-image: radial-gradient( circle at left 30%, rgba(34, 34, 34, 0.3), rgba(34, 34, 34, 0.3) 80px, rgba(34, 34, 34, 0.5) 100px, rgba(51, 51, 51, 0.5) 160px, rgba(51, 51, 51, 0.5)), linear-gradient( 215deg, transparent, transparent 100px, #222 260px, #222 320px, transparent), radial-gradient( circle at right, #111, rgba(51, 51, 51, 1));
                background-color: #333;
        }

        .blackboard:before {
                box-sizing: border-box;
                display: block;
                position: absolute;
                width: 100%;
                height: 100%;
                background-image: linear-gradient( 175deg, transparent, transparent 40px, rgba(120, 120, 120, 0.1) 100px, rgba(120, 120, 120, 0.1) 110px, transparent 220px, transparent), linear-gradient( 200deg, transparent 80%, rgba(50, 50, 50, 0.3)), radial-gradient( ellipse at right bottom, transparent, transparent 200px, rgba(80, 80, 80, 0.1) 260px, rgba(80, 80, 80, 0.1) 320px, transparent 400px, transparent);
                border: #2c2c2c solid 2px;
                content: "Search Customer";
                font-family: 'Permanent Marker', cursive;
                font-size: 2.2em;
                color: rgba(238, 238, 238, 0.7);
                text-align: center;
                padding-top: 20px;
        }

        .form {
                padding: 70px 20px 20px;
        }

        p {
                position: relative;
                margin-bottom: 1em;
        }

        label {
                vertical-align: middle;
                font-family: 'Permanent Marker', cursive;
                font-size: 1.6em;
                color: rgba(238, 238, 238, 0.7);
        }

        p:nth-of-type(5) > label {
                vertical-align: top;
        }

        input,
        textarea {
                vertical-align: middle;
                padding-left: 10px;
                background: none;
                border: none;
                font-family: 'Permanent Marker', cursive;
                font-size: 1.6em;
                color: rgba(238, 238, 238, 0.8);
                line-height: .6em;
                outline: none;
        }


        select {
            vertical-align: middle;
                padding-left: 10px;
            background : transparent;
                border: none;
            width : 40%;
                font-family: 'Permanent Marker', cursive;
                font-size: 1.6em;
                color: rgba(238, 238, 238, 0.8);
                line-height: .6em;
                outline: none;
        }

        option {
            vertical-align: middle;
                padding-left: 10px;
            background : rgb(63, 62, 70);
                border: none;
                font-family: 'Permanent Marker', cursive;
                font-size: 1.0em;
                color: rgba(238, 238, 238, 0.8);
                line-height: .6em;
                outline: none;
        }

        textarea {
            margin-top: 1%;
                height: 120px;
                font-size: 1.4em;
                line-height: 1em;
                resize: none;
        }

        input[type="submit"] {
                cursor: pointer;
                color: rgba(238, 238, 238, 0.7);
                line-height: 1em;
                padding: 0;
        }

        input[type="submit"]:focus {
                background: rgba(238, 238, 238, 0.2);
                color: rgba(238, 238, 238, 0.2);
        }

        ::-moz-selection {
                background: rgba(238, 238, 238, 0.2);
                color: rgba(238, 238, 238, 0.2);
                text-shadow: none;
        }

        ::selection {
                background: rgba(238, 238, 238, 0.4);
                color: rgba(238, 238, 238, 0.3);
                text-shadow: none;
        }
    </style>

</head>
<body>

<?php 
    include("header.php");
?>
<div class="patterns" style="margin-right: 10%">
  <svg width="100%" height="50%">         
    <rect x="0" y="0" width="100%" height="100%" fill="url(#polka-dots)"> </rect>
 <text x="50%" y="60%"  text-anchor="middle"  >
   Customer Details
 </text>
 </svg>
</div>

<form action="<?php echo $_SERVER["PHP_SELF"];?>" method = "post">
<div style="margin-right:10%;">
  <div class="blackboard">
    <div class="form">
    <hr><br>
    <p>
    <label for="name"><b>Name&emsp;</b></label>
    <input type="text" placeholder="Name" name="name">
    <br></p><p><br>
    <p class="wipeout">
    <span style="float: left; margin-left: 10%">
      <input type="submit" name="search" value="Search:-"/>
      </span>
      <span style="float: right; margin-right: 10%">
      <input type="submit" value="Clear:-" />
      </span><br>
    </p></div>
  </div></div>
</form>
<div style="display: inline-flexbox;">
<?php
    if (!isset($_POST["search"])) {
        $sql = "SELECT * FROM customer ORDER BY cus_id DESC;";
    }
    else {
        $_POST['name'] = addslashes($_POST['name']);
        $sql = "SELECT * FROM customer WHERE cus_name LIKE '%{$_POST['name']}%'";
    }
    $res = $db->query($sql);
    if($res->num_rows>0)
    {
        echo "<div class='box' style='margin-left: 6%'>";
        $i = 0;
            while($rows=$res->fetch_assoc())
            {
              if (($i++)%3 == 0){
                echo "</div><div class='box'  style='margin-left: 6%'>";
              }
                echo "
                <div class='card' style='float:left;'>
                <div class='imgBx'>
                  <img src='../{$rows['cus_image']}' alt='profile' style='width:100%'></div>
                  <div class='details'><b>
                  <h2>{$rows['cus_name']}</h2>
                  <h2><span>{$rows['cus_mail']}<br><br>
                  <a href='cust_trans.php?id={$rows["cus_id"]}' class='rainbow rainbow-1' style='border-radius:30px;text-decoration:none'>View Transactions</a></span></h2>
                </div></div>
                    ";
            }
        echo "
        </div>
        ";
    }
    else
    {
        echo "<p style='color: red'>No Records found</p>";
    }

?>

    <style>
      #customers{
        background: #8ae600;
      }

      #customers:after{
        color: #8ae600;
      }
    </style>

    </div></div>
    </body>
    </html>