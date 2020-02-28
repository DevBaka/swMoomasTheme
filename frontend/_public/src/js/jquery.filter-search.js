function filterFunction() {
    console.log("hello baka filter");
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    //div = document.getElementById("myDropdown");
    div = document.getElementsByClassName("filter-panel--option-list");
    a = div.getElementsByTagName("label");
    //a = div.getElementsByClassName("filter-panel--label");
    for (i = 0; i < a.length; i++) {
        txtValue = a[i].textContent || a[i].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}