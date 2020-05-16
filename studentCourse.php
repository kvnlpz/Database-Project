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
            $dbname = 'cs332t26';
            $dbuser = 'cs332t26';
            $dbpass = 'cho4Iich';
            $dbhost = 'localhost';
            $connect = mysql_connect($dbhost, $dbuser, $dbpass) or die("Unable to connect to '$dbhost'");
            $CRS = $_POST["COURSE"];

            mysql_select_db($dbname) or die("Could not open the database '$dbname'");

                $result = mysql_query("
                SELECT unique_number, course_title, section_number, class_room,
                         meeting_days, beginning_time, ending_time, (seats-COUNT(student_id)) as 'Seats'
                   FROM course, record, sections
                   WHERE enroll_sec = section_number
                   AND unique_number = course_num
                    AND enroll_course = $CRS
                    GROUP BY section_number");
                printf("</tr><td>" . "Course Title" . "</td><td>" . "Classroom" . "</td><td>" . "Meeting Days" .
                 "</td><td>" . "Start Time" . "</td><td>" .  "End Time" . "</td><td>" . "Seats". "</td></tr>");
                while ($row = mysql_fetch_array($result)) {
                 printf("</tr><td>" .$row ['course_title'] . "</td><td>" . $row['class_room'] . "</td><td>" .$row['meeting_days'] .
                         "</td><td>" .$row ['beginning_time'] . "</td><td>" .  $row['ending_time'] . "</td><td>" . $row['Seats']. "</td></tr>");
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
