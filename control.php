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
            $CWID = $_POST["CWID"];
            $SSN = $_POST["SSN"];

            mysql_select_db($dbname) or die("Could not open the database '$dbname'");
            //Given the campus wide ID of a student, list all courses the student took and the
            //grades.
            if ($SSN != null) {
                $result = mysql_query("select * from course, sections, professor where social_security_number =  $SSN");
                printf("<tr><td>" . "Title" . "</td><td>" . "Classroom" . "</td><td>" . "Days" . "</td><td>" . "start" . "</td><td>" .  "end" . "</td></tr>");
                while ($row = mysql_fetch_array($result)) {
                    printf("<tr><td>" . $row['title'] . "</td><td>" . $row['class_room'] . "</td><td>". $row['meeting_days'] . "</td><td>" . $row[beginning_time] . "</td><td>" . $row[ending_time] . "</td></tr>");
                }
//                while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
//                    printf("1:%s,    2:%s,    3:%s,    4:%s,    5:%s,    6:%s,    7:%s,    8:%s,    9:%s,    10:%s, \n", $row[1] , $row[2] , $row[3] , $row[4] , $row[5] , $row[6] , $row[7] , $row[8] , $row[9] , $row[10]);
//                }

            } else {
                $result = mysql_query("SELECT * FROM student WHERE campus_wide_id = $CWID");
                while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
                    printf("ID: %s  Name: %s <br>", $row[0], $row[1]);
                }
            }

            ?>
        </td>
    </tr>
</table>
</body>
</html>