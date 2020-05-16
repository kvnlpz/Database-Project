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

            mysql_select_db($dbname) or die("Could not open the database '$dbname'");

                $result = mysql_query("SELECT course_title, enroll_sec, enroll_course, grade
                  FROM course, record
                  WHERE enroll_course = unique_number
                  AND student_id = $CWID");
                printf("</tr><td>" . "Course Title" . "</td><td>" . "Course" . "</td><td>" . "Section" . "</td><td>" . "Grade" ."</td></tr>");
                while ($row = mysql_fetch_array($result)) {
                    printf("</tr><td>" . $row['course_title'] . "</td><td>" . $row['enroll_course'] . "</td><td>". $row['enroll_sec'] . "</td><td>"
                      .$row['grade']. "</td></tr>");
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


