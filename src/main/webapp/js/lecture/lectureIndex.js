//輪播區
let slideNum=0;
let slideCount=$(".slides li").length;
let lastIndex=slideCount-1;

    
$(".dot li").eq(0).css("background-color","darkgreen");
$(".dot li").mouseenter(function(){
    slideNum=$(".dot li").index($(this));
    show();
})

function show(){
    $(".dot li").eq(slideNum).css("background-color","darkgreen")
    .siblings().css("background-color","transparent");

    let slidemove=0-800*slideNum;
    $("ul.slides").css("left",slidemove);
}

$("#prevSlide").click(function(){
    slideNum--;
    if(slideNum<0)slideNum=lastIndex;
    show();
})

$("#nextSlide").click(function(){
    slideNum++;
    if(slideNum>lastIndex)slideNum=0;
    show();
})

let s = setInterval(function () {
    if (slideNum == slideCount)
        slideNum = 0;
    show();
    slideNum++;
}, 5000);      

$(".wrapper").mouseenter(function () {
    clearInterval(s);
    })

$(".wrapper").mouseleave(function () {
    s = setInterval(function () {
    if (slideNum == slideCount)
        slideNum = 0;
    show();
    slideNum++;
    }, 5000);    
   })