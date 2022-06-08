let lastScrollY = window.scrollY;

function init() {

    jQuery(document).ready(function($) {
        $(document).ready(function() {
            $('.mi-selector').select2();
        });
    });

    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })

    // VARIABLES
    let dark = document.getElementById("darkMode");
    const btnTop = document.getElementById("btnTop");


    // EVENTOS
    dark.addEventListener("click", darkModeFunction)
    btnTop.addEventListener("click", goTop)
    document.addEventListener("scroll", hideArrow)
    window.addEventListener("scroll", navbarHide)

    load();
}

function navbarHide() {
    const nav = document.querySelector(".navbar");

    if (lastScrollY < window.scrollY) {
        nav.classList.add("navHidden")
    } else {
        nav.classList.remove("navHidden")
    }
    lastScrollY = window.scrollY

}

function goTop() {
    window.scrollTo(0, 0);
}

function hideArrow() {
    if (document.documentElement.scrollTop <= 50) {
        document.getElementById("btnTop").style.display = 'none'
    } else {
        document.getElementById("btnTop").style.display = 'block'

    }
}

function darkModeFunction() {
    document.body.classList.toggle('dark')
    if (document.body.classList.contains('dark')) {
        document.getElementById("darkMode").src = "/index/img/brightness-high-fill.svg";
    } else {
        document.getElementById("darkMode").src = "/index/img/moon-stars-fill.svg";
    }
    store(document.body.classList.contains('dark'))
}

function load() {
    const darkMode = localStorage.getItem("darkMode");
    if (!darkMode) {
        store(false)
    } else if (darkMode == 'true') {
        darkModeFunction();
    }

}

function store(value) {
    localStorage.setItem('darkMode', value)
}

$(document).ready(init);