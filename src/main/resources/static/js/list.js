var itemIds = [];//记录添加元素的id 用于删除
layui.use(['jquery'], function () {
    var $ = layui.jquery;
    //一般请求后端接口拿到数据 这里只是演示
    var initData = [{"name": "张三", "msg": "今天心情很好"}, {"name": "李四", "msg": "不太开心"}];
    initData.forEach(function (value) {
            var id = createRandom();
            itemIds.push("#" + id);
            $("#container").append(buildItem(value.name, value.msg, id));
        }
    );

    //演示动态添加dom元素
    var nameList = ["王二", "麻子", "张雪", "赵四", "爱新觉罗", "溥仪"];
    var msgList = ["十年生死两茫茫", "不思量", "自难忘", "千里孤坟", "无处话凄凉", "天黑了"];
    //添加元素按钮 附加点击事件
    $("#add-btn").click(function () {
        var id = createRandom();
        itemIds.push("#" + id);
        $("#container").append(buildItem(
            nameList[parseInt(nameList.length * Math.random())],
            msgList[parseInt(msgList.length * Math.random())]
            , id
        ));
    });
    //删除元素按钮 附加点击事件
    $("#del-btn").click(function () {
        $(itemIds.pop()).remove();
    });
});

/**
 * 生成 dom 元素，仅演示用
 * @param name
 * @param msg
 * @returns {string}
 */
function buildItem(name, msg, id) {
    return "<div class='item-container' id='" + id + "'><div class='name'>" + name + "</div><div class='msg'>" + msg + "</div></div>";

}

/**
 * 生成一个随机数
 * @returns {number}
 */
function createRandom() {
    return parseInt(100000000 * Math.random());

}