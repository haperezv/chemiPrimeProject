import { Controller } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";

export default class extends Controller {
    connect() {
        const dataIndex = this.element.dataset.index;
        this.index = isNaN(dataIndex) ? 1 : parseInt(dataIndex);
        console.log(this.index);
    }

    add() {
        console.log(this.index);
        fetch("/parameter_designs/new", {
            headers: {
                Accept: "text/vnd.turbo-stream.html",
            },
        }).then(r => r.text()).then(
            text => { 
                text = text.replace(/\[0\]/g, `[${this.index}]`);
                Turbo.renderStreamMessage(text);
                this.index = this.index + 1;
            }
        );  
    }
}