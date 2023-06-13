const gradient = document.getElementById('temp-gradient');

gradient.addEventListener('focus', myFunction);

function myFunction() {
    const bhst = document.getElementById('result').value;
    const tvd = document.getElementById('tvd').value;

    let result = ((bhst - 80) /tvd) * 100;
    document.getElementById("temp-gradient").value = result.toFixed(2);

}