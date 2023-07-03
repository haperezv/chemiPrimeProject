const gradient = document.getElementById('temp-gradient');

gradient.addEventListener('focus', myFunction);

function myFunction() {
    const bhst = document.getElementById('result').value;
    const tvd = document.getElementById('tvd').value;

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