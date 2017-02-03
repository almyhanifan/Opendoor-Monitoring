<?php
$servername = "localhost";
$username = "almy";
$password = "p4ssword";
$dbname = "opendoortry1";
$koneksi = mysqli_connect($servername, $username, $password, $dbname);
if (!$koneksi) {
    die("Koneksi gagal!". mysqli_connect_error());
}
$QueryLog = "SELECT * FROM `log` ORDER BY `Log_Id` DESC";
$QueryAksiLog = mysqli_query($koneksi, $QueryLog);
?>
<div id="konten">
<table border="1px" cellspacing="0" cellpadding="12px">
<h1>Log Pintu 1</h1>
    <th>no</th>
    <th>Status</th>
    <th>Waktu</th>
    <?php
        $no = 1;
        $i = 0;
        while($baris = mysqli_fetch_assoc($QueryAksiLog)) {
            $waktu[$i] = $baris["waktu"];
            echo "<tr>";
            //echo "  <td>" .$baris["Log_Id"]. "</td>";
            //echo "  <td>" .$baris["nama_pintu"]. "</td>";
            echo "<td> $no </td>";
            echo "  <td>" .$baris["status"]. "</td>";
            echo "  <td>" .$baris["waktu"]. "</td>";
            echo "</tr>";
            $i++;
            $no++;
        }
    ?>
</table>
</div>