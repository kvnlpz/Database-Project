<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Test PHP Connection Script</title>
</head>
<body>

<h3>RESULTS</h3>

<table>
    <tr>
        <td>
            <?php
            $dbname = 'cs332t18';
            $dbuser = 'cs332t18';
            $dbpass = 'eiQuu6ah';
            $dbhost = 'localhost';
            $connect = mysql_connect($dbhost, $dbuser, $dbpass) or die("Unable to connect to '$dbhost'");


            mysql_select_db($dbname) or die("Could not open the database '$dbname'");

            $result = mysql_query("SELECT * FROM student");
            while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
                printf("ID: %s  Name: %s <br>", $row[0], $row[1]);
            }
            ?>
        </td>
    </tr>
</table>
</body>
</html>