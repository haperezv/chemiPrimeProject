import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
 
  }
  calculate(e){
    e.preventDefault();
    
    const gradiente = parseFloat(document.getElementById("gradiente").value);
    const superficie = parseFloat(document.getElementById("superficie").value);
    const profundidad = parseFloat(document.getElementById("profundidad").value);

    let result = ((gradiente *  profundidad) / 100) + superficie;
    document.getElementById("bhst").value =  result.toFixed(2);
    

  }
  btnEnviar(e){
    e.preventDefault();
    const modal = document.getElementById("modal");
    const bhst = document.getElementById("bhst").value;
    const result = document.getElementById("result");

    result.value = bhst;
    modal.innerHTML = "";
    
  }
  btnModalClose(e){
    e.preventDefault();
    const modal = document.getElementById("modal");
    modal.innerHTML = "";
  }

}