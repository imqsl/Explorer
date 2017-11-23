function formatDuring(mss) {
    var days = parseInt(mss / (1000 * 60 * 60 * 24));
    var hours = parseInt((mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = parseInt((mss % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = (mss % (1000 * 60)) / 1000;
    if (days == 1) {
        return "一天以前";
    }
    if (days == 2) {
        return "两天前";
    }
    if (days > 2) {
        return "几天前";
    }
    if (days == 0) {
        if (hours == 2) {
            return "两小时以前";
        }
        if (hours == 1) {
            return "一小时以前";
        }
        if (hours > 2) {
            return "几小时以前";
        }
        if (hours == 0) {
            if (minutes == 2) {
                return "两分钟以前";
            }
            if (minutes == 1) {
                return "一分钟以前";
            }
            if (minutes > 2) {
                return "几分钟以前";
            }
            if (minutes == 0) {
                return "几秒前";
            }
        }
    }
}
Date.prototype.format = function(fmt) {
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt)) {
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
}