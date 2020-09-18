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
            $dbname = 'xxxxx';
            $dbuser = 'xxxxx';
            $dbpass = 'xxxxx';
            $dbhost = 'localhost';
            $connect = mysql_connect($dbhost, $dbuser, $dbpass) or die("Unable to connect to '$dbhost'");
            $CWID = $_POST["CWID"];
            $SSN = $_POST["SSN"];

            mysql_select_db($dbname) or die("Could not open the database '$dbname'");
            //Given the campus wide ID of a student, list all courses the student took and the
            //grades.
            if ($SSN != null) {
                  $result = mysql_query("SELECT social_security_number, course_title, class_room, meeting_days, beginning_time, ending_time
                FROM professor, sections, course
                WHERE social_security_number = $SSN
                AND sec_ssn = social_security_number
                AND course_num = unique_number");
                printf("</tr><td>" . "Title" . "</td><td>" . "Classroom" . "</td><td>" . "Days" . "</td><td>" . "start" . "</td><td>" .  "end" . "</td></tr>");
                while ($row = mysql_fetch_array($result)) {
                    printf("</tr><td>" . $row['course_title'] . "</td><td>" . $row['class_room'] . "</td><td>". $row['meeting_days'] . "</td><td>" .
                        $row[beginning_time] . "</td><td>" . $row[ending_time] . "</td></tr>");
                }
            }
            ?>
            <button onclick="goBack()">Go Back</button>
            <script>
            function goBack(){
              window.history.back();
            }
            </script>
        </td>
    </tr>
</table>
</body>
</html>
