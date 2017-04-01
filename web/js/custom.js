/*global $, jQuery, console, alert, prompt */

$(document).ready(function () {
    "use strict";
    $('.photo').height($(window).height());
    $('.slide1').height($(window).height() - 64);

    //  $('.slide1').carousel({fullWidth: true});

    // Main  in Home

    $(".dropdown-button").dropdown();

    //    
    $('html').niceScroll({
        cursorcolor: '#26a69a',
        cursorwidth: '10px'
    });
    //navbar on mobile
    $(".button-collapse").sideNav();



    var scrollButton = $("#scroll-top");
    // Caching The Scroll Top Element

    $(window).scroll(function () {

        if ($(this).scrollTop() >= 700) {

            scrollButton.show();

        } else {

            scrollButton.hide();
        }
    });

    // Click On Button To Scroll Top

    scrollButton.click(function () {

        $("html,body").animate({scrollTop: 0}, 600);

    });


// Scroll to team
    $('.team').click(function () {

        $('html, body').animate({
            scrollTop: $('.our-team').offset().top

        }, 1000);
    });



// Scroll to about
    $('.aboutt').click(function () {

        $('html, body').animate({
            scrollTop: $('.about').offset().top

        }, 1000);
    });

    // remove class hidden from input field in profile :D :D

    $('.one').click(function () {
        $('#hid1').toggleClass('hidden');
        $('#Changes').toggleClass('hidden');
    });



    $('.two').click(function () {
        $('#hid2').toggleClass('hidden');
        $('#Changes').toggleClass('hidden');

    });



    $('.three').click(function () {
        $('#hid3').toggleClass('hidden');
        $('#Changes').toggleClass('hidden');

    });



    $('.four').click(function () {
        $('#hid4').toggleClass('hidden');
        $('#Changes').toggleClass('hidden');

    });



    $('.five').click(function () {
        $('#hid5').toggleClass('hidden');
        $('#hid6').toggleClass('hidden');

        $('#hid7').toggleClass('hidden');
        $('#Changes').toggleClass('hidden');

    });
    $('#Changes').click(function () {
        //$(this).fadeOut(2000);
        //after save Chages
    });

    // for grades
    $('.grades').click(function () {
        $('#Grades').toggleClass('hidden');
    });

    // End class hidden from input field in profile :D :D


    // hiden in Exam
    $('.carousel').carousel();
//Exam
    $('select').material_select();
    $(".details_down").slideUp();
    $(".details_down3").slideUp();
    $(".examm").slideUp();
    $(".brande1").slideUp();
    $(".exam_btn").slideUp();
    $(".brande3").slideUp();
    $(".exam_btn").click(function () {

        $(".examm").slideToggle(1000);
    });

    $(".confirm_btn").click(function () {
        $(".exam_btn").slideDown(50);
        $(".details_down").slideDown(1000);
        $(".details_down2").slideUp(1000);
        $(".brande1").slideDown(1000);
        $(".brande2").slideUp(1000);
    });





// deep





    //validate login

    $('#check1').hide();
    $('#check2').hide();
    $('.test').submit(function () {
        return  check();
    });




    function check() {
        var email = document.getElementById("icon_prefix1").value;
        var pass = document.getElementById("password").value;
        var label = document.getElementById("check1");
        var labe2 = document.getElementById("check2");

        if (email == "") {
            $('#check1').html("field Required");
            label.style.color = "red";
            $('#check1').show();
            return false;
        } else if (pass == "") {

            $('#check2').html("field Required");
            labe2.style.color = "red";
            $('#check2').show();
            return false;

        } else {

            return true;
        }
    }


});













