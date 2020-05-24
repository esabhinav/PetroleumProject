/*var slideInd = 0;
showSli();

function showSli() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideInd++;
    if (slideInd > slides.length) {slideInd = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideInd-1].style.display = "block";  
    dots[slideInd-1].className += " active";
    setTimeout(showSli, 3000); // Change image every 3 seconds
}*/