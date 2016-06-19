<!DOCTYPE html >
<html lang="pl-PL">
  <head>
    <meta charset="UTF-8">
    <title>Projekt BD</title>
  </head>
  <body>
    <h3>System zarządzania danymi studentów</h3>

    <form method="post" action="first.php">
      Podaj imię studenta:
      <input type="text" name="studentsName">
      <input type="submit">
    </form>
    <br>
		
    <?php
      require_once 'login.php';
      $conn = new mysqli($hostname, $username, $pw, $DBname);
			
      if($conn->connect_error) die($conn->connect_error);
			
      if(isset($_POST['studentsName'])) $givenName = $_POST['studentsName'];
      else $givenName = "*";

      $sqlQuery = "select Imie, Nazwisko, Grupa, Status from student where Imie='$givenName'";
      $queryResult = $conn->query($sqlQuery);
			
      if(! $queryResult) die('Nie można pobrać danych.');
			
      $rowsNumber = $queryResult->num_rows;
			
      for($i=0 ; $i<$rowsNumber ; ++$i) {
        $queryResult->data_seek($i);
        $row = $queryResult->fetch_array(MYSQLI_ASSOC);
				
        echo 'STUDENT: '.$row['Imie'].' '.$row['Nazwisko'].' GRUPA: '.$row['Grupa'].' STATUS: '.$row['Status'].'<br>';		
      }
			
      $queryResult->close();
      $conn->close();
    ?>
  </body>
</html>
