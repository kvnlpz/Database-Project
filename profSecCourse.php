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
            $CWID = $_POST["CWID"];
            $SSN = $_POST["SSN"];
            $SEC = $_POST["SECTION_NUMBER"];
            $course  = $_POST["COURSE_NUMBER"];
            mysql_select_db($dbname) or die("Could not open the database '$dbname'");
            //Given the campus wide ID of a student, list all courses the student took and the
            //grades.
                $result = mysql_query("
                SELECT grade, COUNT(*) as 'Count'
                FROM record, course, sections
                WHERE unique_number = course_num
                AND enroll_course = course_num
                AND enroll_sec = section_number
                AND section_number =$SEC
                AND unique_number = $course
                GROUP BY grade");
                printf("<tr><td>" . "Grade" ."</td><td>". "Number of Students". "</td></tr>");
                while ($row = mysql_fetch_array($result)) {
                    printf("<tr><td>" . $row['grade'] . "</td><td>" . $row['Count'] . "</td></tr>");
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
