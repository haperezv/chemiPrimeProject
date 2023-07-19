window.addEventListener("turbo:load", function(){
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
        rounded = rounded  - 0.1;
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

      // --2 Calculo del BHCT
      // --Evalucación de criterios para establecer el valor de redondeo a la -3

      var x9, x10, x11,t8_roundup, t8_rounddown, t10, e13, e14, bhst_l;


      if(tvd < 999){
          x10 = tvd  * 1000 / tvd;
      }else if(tvd > 9999){
          x10 = tvd;
      }else{
          x10 = tvd;
      }

      if(x10 == 1000){
          x9 = x10 * 1000 / x10;
      } else {
          x9 = ((tvd - 99) / 100) * 100;
      }

      if(x10 = 1000){0
          x11 = 1000;
      }else {
          x11 = tvd + 99 / 100 * 100;
      }

      // --Redondeos de t8
      t8_roundup = result2 * 10 / 10;
      t8_rounddown = result2 * 10 / 10;

      fetch(`/requests/get_data?x9=${x9}&t8_roundup=${t8_roundup}&t8_rounddown=${t8_rounddown}&tvd=${tvd}&x11=${x11}`, {
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

});

