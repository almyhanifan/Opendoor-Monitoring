<?php
// Sesi koneksi

$servername = "localhost";
$username = "almy";
$password = "p4ssword";
$dbname = "opendoortry1";

//Buat koneksi
$koneksi = mysqli_connect($servername, $username, $password, $dbname);

// kalau koneksi mati
if (!$koneksi) {
    die("Koneksi gagal!". mysqli_connect_error());
}

$QuerySelect = "SELECT * FROM `pintu`";
$QueryAksi = mysqli_query($koneksi, $QuerySelect);
?>

<style>
    body {
        background-color:;
        color: ;
    }
    div#konten {
        background-color: ;
    }
</style>
<script src="jquery.js"></script>
<script>
    setInterval(function() {
          $("div#konten").load(" #konten"); 
        }, 1000);
</script>

<div id="main">
    <h1 align=center> Monitoring Pintu Rak Server </h1>
</div>
<br>
<br>
<div id="konten">
<table border="1px" cellspacing="0" cellpadding="10px" align="center">

    <th>Nama Pintu</th>
    <th>Status</th>
    <th>Waktu</th>
    <?php
        $i = 0;
        while($baris = mysqli_fetch_assoc($QueryAksi)) {
            $waktu[$i] = $baris["waktu"];
            echo "<tr>";
            
            echo "  <td>" .$baris["nama_pintu"]. "</td>";
            echo "  <td>" .$baris["status"]. "</td>";
            echo "  <td>" .$baris["waktu"]. "</td>";
            echo "</tr>";
            $i++;
        }
    
      //  echo $waktu[2];
        
    ?>
</table>
    <a href="log.php">Log Pintu</a>
</div>

<?php
    $id = isset($_GET["id"]) ? $_GET["id"]: "";
    $status = isset($_GET["status"]) ? $_GET["status"]: "";
    $randNum = isset($_GET["randNum"]) ? $_GET["randNum"]: "";

    echo $id;
    echo $status;
    
    $queryUpdate = "UPDATE `pintu` SET `status`='$status' WHERE `id`='$id'";
    $queryUpdateRandNum = "UPDATE `pintu` SET `randNum`='$randNum' WHERE `id`='$id'";
    mysqli_query($koneksi, $queryUpdate);
    //mysqli_query($koneksi, $queryUpdateRandNum);

    //$queryAmbilData = "SELECT * FROM `pintu` WHERE `id`='$id'";
    //$queryHasil = mysqli_query($koneksi, $queryAmbilData);
    
    $hasil = mysqli_query($koneksi, "SELECT * FROM `pintu` WHERE `id`='$id'");
    $baris = mysqli_fetch_assoc($hasil);
    
    // periksa baris akhir atau status akhir dari tabel `pintu`
    $query_status_akhir = mysqli_query($koneksi, "SELECT * FROM `log` ORDER BY `Log_Id` DESC LIMIT 1");
    $status_akhir = mysqli_fetch_assoc($query_status_akhir);
    //echo $status_akhir["randNum"];    

    if (!empty($id) && !empty($status)) {
        if ($status_akhir["status"] != $status) {
            $queryInsert = "INSERT INTO `log` (`nama_pintu`, `status`, `waktu`, `randNum`) VALUES
                ('".$baris["nama_pintu"]."', '".$baris["status"]."', '".$baris["waktu"]."', '".$baris["randNum"]."')
            ";
            mysqli_query($koneksi, $queryInsert); 
        }
    }
?>




