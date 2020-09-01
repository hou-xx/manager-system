layui.use(['jquery', 'layer', 'table', 'laydate'], function () {
    var $ = layui.jquery;
    $("#aaa").html("111");
    $("#bbb").text= '123';
    $("#ccc").click(function () {
        jqueryPost($);
    });

    // jqueryPost($);
    // jqueryGet($);

});

function jqueryPost($) {
    $.post('/manager/test/post', {
        name: 'Bob',
        age: 12
    }).success(function (data) {
        console.log(data);
        console.log(data.name);
        $("#aaa").html(JSON.stringify(data));
    });
}

function jqueryGet($) {
    $.get('/manager/test/get?name=Tom&age=13').success(function (data) {
        console.log(data);
        console.log(data.name);
        $("#bbb").text = JSON.stringify(data);
    });
}