import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="informations"
export default class extends Controller {
  connect() {
    this.index = parseInt(this.element.dataset.index);
  }

  add(){
    fetch("/slurries/new",{
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      },
    }).then(r => r.text()).then(
      text => { 
        
        text = text.replace("[0]", `[${this.index}]` );
        text = text.replace("[0]", `[${this.index}]` );
        text = text.replace("[0]", `[${this.index}]` );
        text = text.replace("[0]", `[${this.index}]` );
        text = text.replace("[0]", `[${this.index}]` );
        text = text.replace("[0]", `[${this.index}]` );

     //   console.log(text);
        Turbo.renderStreamMessage(text)
        this.index = this.index + 1;
      }
    );
  }

}
