function info(){

    var infos = document.getElementsByClassName("info");
    var review = document.getElementById("review_con");

    for(let i=0; i<infos.length; i++){
        infos[i].style.display = "flex";
    }

        review.style.display = "none";

}

function review(){

    var infos = document.getElementsByClassName("info");
    var review = document.getElementById("review_con");

    for(let i=0; i<infos.length; i++){
        infos[i].style.display = "none";
    }
        review.style.display = "flex";
}



// Get the modal
var reservation_modal = document.getElementById('reservation_modal');
var bline_process_modal = document.getElementById('bline_process_modal');
//var bline_request_modal = document.getElementById('bline_request_modal');
var reservation_end_modal = document.getElementById('reservation_end_modal');

// Get the button that opens the modal
var reservation = document.getElementById("reservation");
var bline_process = document.getElementById("bline_process");
var bline_request = document.getElementById("bline_request");
var reservation_end = document.getElementById("reservation_end");


// Get the <span> element that closes the modal
var reservation_close = document.getElementsByClassName("close")[0];                                          
var bline_process_close = document.getElementsByClassName("close")[1];
var bline_request_close = document.getElementsByClassName("close")[2];
var reservation_end_close = document.getElementsByClassName("close")[3];

// When the user clicks on the button, open the modal 
reservation.onclick = function() {
    reservation_modal.style.display = "block";
    $('body').css("overflow", "hidden");
}
reservation_end.onclick = function() {
    reservation_end_modal.style.display = "block";
    $('body').css("overflow", "hidden");
    
}

bline_process.onclick = function() {
    bline_process_modal.style.display = "block";
    $('body').css("overflow", "hidden");
}

// When the user clicks on <span> (x), close the modal
reservation_close.onclick = function() {
    reservation_modal.style.display = "none";
    $('body').css("overflow", "scroll");
}

bline_process_close.onclick = function() {
    bline_process_modal.style.display = "none";
    $('body').css("overflow", "scroll");
}

bline_request_close.onclick = function() {
    bline_request_modal.style.display = "none";
    $('body').css("overflow", "scroll");
}

/*reservation_end_close.onclick = function() {
    reservation_end_modal.style.display = "none";
    $('body').css("overflow", "scroll");
    
    location.replace("")
    
}*/

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == reservation_modal) {
        reservation_modal.style.display = "none";
        $('body').css("overflow", "scroll");
    } else if (event.target == bline_process_modal) {
        bline_process_modal.style.display = "none";
        $('body').css("overflow", "scroll");
    } else if (event.target == bline_request_modal) {
        bline_request_modal.style.display = "none";
        $('body').css("overflow", "scroll");
    /*} 
    else if (event.target == reservation_end_modal) {
        reservation_end_modal.style.display = "none";
        $('body').css("overflow", "scroll");*/
    } else if (event.target == document.getElementsByClassName("close")[4]) { // main img modal / function 따로 만듦
        document.getElementById("img_modal").style.display = "none";
        $('body').css("overflow", "scroll");
    }
}

/*select_end.onclick = function(){
    var select_end1 = document.getElementById("section_end1");
    var select_end2 = document.getElementById("section_end2");

    if(select_end1.display != "none")
        select_end.style.display = "none";

    select_end2.style.display = "flex";
    reservation_modal.style.display = "none";
    $('body').css("overflow", "scroll");
    
    var payment_content = "날짜: ";
    
    payment +=  "???&nbsp;&nbsp;&nbsp;" + "소형견: " ;  
    
    
    

}*/

function resulvation_cancel(){

    var result = confirm("결제를 취소하시겠습니까?");

    if(result){
        reservation_end_modal.style.display = "none";
        $('body').css("overflow", "scroll");
        
        $('#section_end1').attr("style", "display:flex");
        $('#section_end2').attr("style", "display:none");
        
        
    }

}

var main_img = document.getElementById("modal_img");
var sub_img = document.getElementsByClassName("modal_sub_img");
var first_img_index;
var num;

function main_img_view(){
    var img_modal = document.getElementById("img_modal");
    
    
    document.getElementById("modal_img").src=event.target.src;
    img_modal.style.display = "block";
    $('body').css("overflow", "hidden");

    for(var i=0; i<sub_img.length; i++){
        if(sub_img[i].src==event.target.src){
            first_img_index = i;
            break;
        }
    }


    for(let j=i; i<j+4; i++){
        window["temp" + i] = document.getElementsByClassName("modal_sub_img_none");
        window["temp" + i][i].setAttribute("style", "display:block;height:100%");
    }
}

function front_img(){

    for(let i=0; i<sub_img.length; i++){
        window["temp"+i] = sub_img[i].src;
    }

    main_img.src=window["temp"+(sub_img.length-1)];

    sub_img[0].src = window["temp"+(sub_img.length-1)];
    for(let i=1; i<sub_img.length; i++){
        sub_img[i].src = window["temp"+(i-1)];
    }
    

    
}

function small_image(){
    var target_number = parseInt(event.target.dataset.index);

    main_img.src = sub_img[target_number].src;

    first_img_index = parseInt(sub_img[target_number].dataset.index);

    for(let i=0; i<sub_img.length; i++){
        window['temp'+i] = sub_img[i].src;
    }


    for(let i=0; i<sub_img.length; i++){

        if(target_number+i==sub_img.length)
            target_number=-i;

        sub_img[i].src = window['temp'+(target_number+i)];

    }

    

}

function end_img(){

    for(let i=0; i<sub_img.length; i++){
        window["temp"+i] = sub_img[i].src;
    }

    main_img.src=window["temp"+1];
    for(let i=0; i<sub_img.length-1; i++){
        sub_img[i].src = window["temp"+(i+1)];

    }
    sub_img[sub_img.length-1].src = window["temp"+0];
}



