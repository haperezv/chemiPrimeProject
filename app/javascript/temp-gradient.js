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

  const agregarFila = document.getElementById('agregarFila');
  agregarFila.addEventListener('click', agregar);

  function agregar(){
    document.getElementById('tableinformation').insertRow(-1).innerHTML = 
    '<tr class="text-gray-700 dark:text-gray-400"> <td class="px-4 py-3"> <div class="flex items-center text-sm"> <input id="density" placeholder="0.0" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-black-300 dark:focus:shadow-outline-gray form-input" type="text" name="request[density]"></div></td><td class="px-4 py-3"><div class="flex items-center text-sm"><input id="concentration" placeholder="0.0" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-black-300 dark:focus:shadow-outline-gray form-input" type="text" name="request[concentration]"></div></td><td class="px-4 py-3"><div class="flex items-center text-sm"><select class="start_time bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:focus:ring-blue-500 dark:focus:border-blue-500" name="request[extent_id]" id="request_extent_id"><option value="" label=" "></option><option value="2">ppg</option><option value="3">ft3/Sx</option><option value="4">gal/Sx</option><option value="5">ppm</option>    <option value="11">lbm/gal</option></select></div> </td><td class="px-4 py-3"><div class="flex items-center text-sm"><select class="start_time bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:focus:ring-blue-500 dark:focus:border-blue-500" name="request[aditivo_id]" id="request_aditivo_id"><option value="" label=" "></option><option value="3">Ilig sc</option><option value="4">Ilig HT</option><option value="5">IRF-105</option><option value="6">IFL-15</option><option value="7">Expand</option><option value="8">Bentonita</option><option value="9">MicroCemento</option><option value="10">Hematita</option><option value="11">Alivianante</option><option value="12">Esfera</option><option value="13">Argos Class G</option><option value="14">Dyckerhoff Class G</option><option value="15">Water</option><option value="16">Well Water</option><option value="17">Antiespumante</option> <option value="18">ID-100</option> <option value="19">Retardador EV HT</option></select></div><td class="px-4 py-3"><div class="flex items-center text-sm"><input id="lote" placeholder="0.0" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-black-300 dark:focus:shadow-outline-gray form-input" type="text" name="request[lote]"></div> </tr>'

  }

  const eliminarFila = document.getElementById('eliminarFila');
  eliminarFila.addEventListener('click', eliminar);

  function eliminar(){
    const table = document.getElementById('tableinformation');
    const rowCount = table.rows.length

    if (rowCount <= 1)
    alert('No se puede eliminar el encabezado')
    else
    table.deleteRow(rowCount -1)
  }



});

