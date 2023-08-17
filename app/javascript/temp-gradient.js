window.addEventListener("turbo:load", function(){
  
const  option = document.getElementById('request_aporte_id');  

if(option.value == 1){
  document.getElementById('request_nivel_id').style.display = '';
}else{
  document.getElementById('request_nivel_id').style.display = 'none';
}

  
const calcular = document.getElementById('calcular');
if(calcular){
  calcular.addEventListener('click', tempGradient);

  function tempGradient() {
      const bhst = document.getElementById('result').value;
      const tvd = document.getElementById('tvd').value;

      // --1. calculo del Gradiente

      let result = ((bhst - 78) /tvd) * 100;
      let rounded = result.toFixed(2);

      if (rounded <= 0.9) {
        rounded = Math.ceil(rounded)  - 0.1;
      }else if (rounded >= 1.89) {
          rounded = 0 + 1.9;
      }else {
          rounded = rounded;
      }

      let parsedRounded = parseFloat(rounded);
      let result2 = parsedRounded.toFixed(2);

      document.getElementById("temp-gradient").value = parseFloat(result2);
  }


  calcular.addEventListener('click', bhcTemp);

  function bhcTemp() {

      const tvd = document.getElementById('tvd').value;
      const result2 = document.getElementById('temp-gradient').value;
      let bhst = document.getElementById('result').value;
      let density = document.getElementById('density').value;

      // --2 Calculo del BHCT
      // --Evalucación de criterios para establecer el valor de redondeo a la -3

      var x9, x10, x11,t8_roundup, t8_rounddown, t10, e13, e14, presion_inicial;


      if(tvd < 999){
          x10 = tvd  * 1000 / tvd;
      }else if(tvd > 9999){
          x10 = tvd;
      }else{
          x10 = tvd;
          console.log(x10);
      }

      if(x10 == 1000){
          x9 = x10 * 1000 / x10;
      } else {
          x9 = Math.ceil((tvd - 99) / 100) * 100;
          console.log(x9);
      }

      if(x10 == 1000){
          x11 = 1000;
      }else {
          x11 = tvd + 99 / 100 * 100;
      }

      // --Redondeos de t8
      t8_roundup = result2 * 10 / 10
      t8_roundup = parseFloat(t8_roundup.toFixed(1));
      console.log(t8_roundup);
      t8_rounddown = Math.floor(result2 * 10) / 10;

      fetch(`/requests/get_data?x9=${x9}&t8_roundup=${t8_roundup}&t8_rounddown=${t8_rounddown}&valorGradiente=${result2}&x11=${x11}&x10=${x10}`, {
          method: 'GET'
        })
          .then(response => {
            if (!response.ok) {
              throw new Error('Error de red');
            }
            return response.json();
          })
          .then(responseData => {
            // Realiza acciones con la respuesta recibida desde Ruby on Rails
            console.log(responseData);
            
            const t9 = responseData.t9;
            const t11 = responseData.t11;
            const b9 = responseData.b9;
          
            if(x10 = x9){
              t10 = t9;
            }else{
              t10 = ((x10 - x9) * (t11 - t9) / (x11 - x9)) + t9;
              t10.toFixed(1);

            }

            e13 = ((bhst - 80) / tvd * 100).toFixed(2);
            e14 = 80 + (((0.006061 * tvd * e13) - 10.0915) / ((1 - (0.1505 * 0.0001 * tvd))));

            if(x10 <= 9999){
              bhst = t10.toFixed(1);
            }else{
              bhst = e14.toFixed(1);
            }
            document.getElementById("bhct").value = parseFloat(bhst);
            
            //Buscamos el valor de la Presion Inicial
            if(b9 == 0 ){
              alert("El valor Depth TVD (ft) debe ser menor o igual a 22.000");
            }else{

              if(x10 <= 999){
                presion_inicial = 0
              }else{
                presion_inicial = b9
              }
  
              //--Buscamos el valor de la Presion Final
              
              presion_inicial = Math.ceil ((0.052 * density * tvd) + presion_inicial)
              document.getElementById("psi").value = parseFloat(presion_inicial);

            }

          })
          .catch(error => {
            // Manejo de errores
            console.error('Error:', error);
          });
  }

  const job_type = document.getElementById('request_job_id');
  job_type.addEventListener('click', job);

  function job() {

    let selected = job_type.options[job_type.selectedIndex].text;
    document.getElementById("job_type").textContent = selected;

  }

}

option.addEventListener('click', aport_gas);

function aport_gas(){

  if(option.value == 1){
    document.getElementById('request_nivel_id').style.display = '';
  }else{
    document.getElementById('request_nivel_id').style.display = 'none'; 
  }


}

const calcular_total = document.getElementById('calcular_total');

if(calcular_total){
  
  calcular_total.addEventListener('click', total_tiempo);
  function total_tiempo(){
    const time_mezcla = document.getElementById('time_mezcla').value;
    const time_mezclatime_mezcla = document.getElementById('time_mezclatime_mezcla').value;
    const time_pumpability = document.getElementById('time_pumpability').value;
    const time_operation = document.getElementById('time_operation').value;

    document.getElementById("total_time").value = parseInt(time_mezcla) + parseInt(time_mezclatime_mezcla) + parseInt(time_pumpability) + parseInt(time_operation)

  }
}


  const eliminarFila = document.getElementById('eliminarFila');
  eliminarFila.addEventListener('click', eliminar);

  function eliminar(){
    const table = document.getElementById('tableinformation');
    const rowCount = table.rows.length

    if (rowCount <= 2)
    alert('No se puede eliminar la primera')
    else
    table.deleteRow(rowCount -1)
  }



});

