$(function () {

    'use strict';


    var $citypicker1 = $('#city-picker1');

    $citypicker1.citypicker();

    var $citypicker2 = $('#city-picker2');

    $citypicker2.citypicker({
        province: '����ʡ',
        city: '������',
        district: '������'
    });

    var $citypicker3 = $('#city-picker3');

    $('#reset').click(function () {
        $citypicker3.citypicker('reset');
    });

    $('#destroy').click(function () {
        $citypicker3.citypicker('destroy');
    });
    //
    //$('#distpicker1').distpicker();
    //
    //$('#distpicker2').distpicker({
    //  province: '---- ����ʡ ----',
    //  city: '---- ������ ----',
    //  district: '---- ������ ----'
    //});
    //
    //$('#distpicker3').distpicker({
    //  province: '�㽭ʡ',
    //  city: '������',
    //  district: '������'
    //});
    //
    //$('#distpicker4').distpicker({
    //  placeholder: false
    //});
    //
    //$('#distpicker5').distpicker({
    //  autoSelect: false
    //});

});
