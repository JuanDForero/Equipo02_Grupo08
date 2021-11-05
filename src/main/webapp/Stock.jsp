<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!--  <link rel="stylesheet" href="CSS/Reporte.css">-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.js"></script>
  
</head>

<body>
	<canvas id="Migrafica" width="8" height="0.4"></canvas> 
    <script >
    
        var c = document.getElementById("Migrafica");
        var cxn = c.getContext("2d");
       // let micanvas= document.getElementById("MiGrafica").getContext("2d");
    
        var Chart = new Chart(cxn,{
    
        type:"bar",
        data:{
    
            labels:["MSI_B250_GAMING_PRO","MSI_B250M_BAZOOKA","MSI_H310I_PRO","MSI_B450_GAMING_PRO_WIFI","MSI_GT_710_1GB_DDR3","MSI_GTX_1050_2GB_GDDR5",
            	"MSI_GTX_1060_3GB_GDDR5",
            	"MSI_GTX_1070_TI_8GB_GDDR5",
            	"MSI_RTX_2080_TI_11GB_GAMING",
            	"8GB_DDR4_2666_8X1_XPG_CORSAIR",
            	"8GB_DDR4_2666_LED_CORSAIR",
            	"16GB_DDR4_3000_16X1_CORSAIR",
            	"16GB_DDR4_3200_2X8RGB_CORSAIR",
            	"RYZEN_R7_5700G/8_NUCLEOS_16_HILOS_A_4 6GHZ",
            	"RYZEN_R5_5600G/6_NUCLEOS_12_HILOS_A_4 4GHZ",
            	"ATHLON_3000G/5_NUCLEOS(2_CPU+3_GPU)",
            	"RYZEN_R9_5950X/16_NUCLEOS_32_HILOS_A_4 9GHZ",
            	"RYZEN_R9_5900X/12_NUCLEOS_24_HILOS_A_4 8GHZ",
            	"RYZEN_7_3700X/8_NUCLEOS-16_HILOS_A_4 4GHZ",
            	"SSD_SATA_1TB_CRUCIAL_BX500"],
            
            datasets: [
            
    
            {
    
                label:"Stock",
                data:["15","7","8","9","11","10","5","3","2","6","8","5","6","3","6","15","7","9","7","8"],
             //   strokecolor: "rgba(54, 139, 191)",
               backgroundColor: "rgb(54, 139, 191 )",
               
                borderColor:"rgb(0,40,0)",
                

    
            }
            ]
        }
    
        })
    
    
    </script>
</body>
</html>