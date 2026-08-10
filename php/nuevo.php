<?php
// Creamos variables vacías para guardar los datos al inicio
$resultado = "";

// ¿El usuario le dio clic al botón "Calcular"?
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Recogemos lo que el usuario escribió en las cajitas
    $num1 = $_POST['n1'];
    $num2 = $_POST['n2'];
    
    // Sumamos los dos números (convertidos a números reales)
    $resultado = floatval($num1) + floatval($num2);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Primera Calculadora</title>
</head>
<body>

    <h2>Calculadora de Sumas</h2>

    <!-- El formulario le envía los datos a este mismo archivo -->
    <form method="POST" action="">
        <label>Número 1:</label><br>
        <input type="number" name="n1" required><br><br>

        <label>Número 2:</label><br>
        <input type="number" name="n2" required><br><br>

        <button type="submit">Sumar</button>
    </form>

    <!-- Mostramos el resultado solo si ya se calculó algo -->
    <?php if ($resultado !== ""): ?>
        <h3>El resultado es: <?php echo $resultado; ?></h3>
    <?php endif; ?>

</body>
</html>