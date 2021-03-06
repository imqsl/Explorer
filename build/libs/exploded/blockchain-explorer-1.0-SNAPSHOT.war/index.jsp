<%--
  Created by IntelliJ IDEA.
  User: imqsl
  Date: 2017-10-20
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags-->
    <meta name="description" content="以太坊区块链浏览器">
    <meta name="author" content="imqsl">
    <meta name="keywords"
          content="以太坊, 浏览器, 区块链, etherchain, 加密货币, 比特币">
    <meta name="theme-color" content="#18bc9c">
    <link rel="icon" href="//etherchain.org/images/glyphicons-51-link.png">
    <title>主页 - 以太坊区块链浏览器</title>
    <!-- Bootstrap core CSS-->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/r/bs/dt-1.10.9/datatables.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.1.0/styles/default.min.css">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }</style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/knockout/3.3.0/knockout-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bignumber.js/2.0.7/bignumber.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/1.4.5/numeral.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstimezonedetect/1.0.4/jstz.min.js"></script>

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                    aria-controls="navbar" class="navbar-toggle collapsed">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/" title="SCU嵌入式实验室" class="navbar-brand">
                <span class="glyphicon glyphicon-link"></span>川大嵌入式实验室</a></div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><span
                        class="glyphicon glyphicon-eye-open"></span> 区块链<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="blocks.jsp"><span class="glyphicon glyphicon-book"></span> 区块</a></li>
                        <li><a href="txs.jsp"><span class="glyphicon glyphicon-transfer"></span> 交易</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><span
                        class="glyphicon glyphicon-list-alt"></span> 账户<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="acounts.jsp">账户</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle">
                    <div class="span glyphicon glyphicon-wrench"></div>
                    工具<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="https://ens.etherchain.org/" target="_blank"><span
                                class="glyphicon glyphicon-globe"></span> Ethereum Name Service</a></li>
                        <li><a href="https://www.ethernodes.org/" target="_blank">Nodes Explorer</a></li>
                        <li><a href="https://github.com/gobitfly/etherchain-light" target="_blank">Etherchain Light</a>
                        </li>
                        <li><a href="https://github.com/gobitfly/erc20-explorer" target="_blank">ERC20 Token
                            explorer</a></li>
                        <li><a href="/documentation/api/">API</a></li>
                        <li><a href="/verify/signature">Verify Ethereum signatures</a></li>
                    </ul>
                </li>
            </ul>
            <form action="/search" method="POST" class="navbar-form navbar-right">
                <div class="form-group"><input type="text" placeholder="ENS, Tx Hash, Address or Block number"
                                               id="search" name="search" class="form-control input-sm"></div>
                <button type="submit" style="margin-left: 2px" class="btn btn-success">
                    <span class="glyphicon glyphicon-search"></span></button>
            </form>
        </div>
    </div>
</nav>
<div id="home" class="container">
    <div class="row">
        <div class="col-md-12"><h2 class="text-center">以太坊 网络 状态</h2></div>
    </div>
    <div class="row">
        <div class="col-md-3 text-center">
            <div data-toggle="tooltip" data-placement="top" title="Ethereum price in USD and BTC"
                 class="panel panel-primary">
                <div class="panel-heading"><h3 class="panel-title">价格</h3></div>
                <div class="panel-body" id="price"><h4 data-bind="text: price"></h4></div>
            </div>
        </div>
        <div class="col-md-3 text-center">
            <div data-toggle="tooltip" data-placement="top" title="Average difficulty over the last 24 hours"
                 class="panel panel-info">
                <div class="panel-heading"><h3 class="panel-title">困难度</h3></div>
                <div class="panel-body" id="difficulty"><h4 data-bind="text: difficulty"></h4></div>
            </div>
        </div>
        <div class="col-md-3 text-center">
            <div data-toggle="tooltip" data-placement="top" title="Average block time over the last 24 hours"
                 class="panel panel-success">
                <div class="panel-heading"><h3 class="panel-title">区块时间</h3></div>
                <div class="panel-body" id="blockTime"><h4 data-bind="text: blockTime"></h4></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4"><h2 class="text-center">最新区块</h2>
            <div class="table-responsive">
                <table class="table table-condensed table-striped table-hover border-right">
                    <thead>
                    <tr>
                        <th>Block</th>
                        <th>Miner</th>
                        <th>Age</th>
                    </tr>
                    </thead>
                    <tbody id="recentblocks">

                    </tbody>
                </table>
            </div>
            <a href="blocks.jsp" role="button" class="btn btn-default">查看更多区块</a></div>
        <div class="col-md-8"><h2 class="text-center">最新交易</h2>
            <div class="table-responsive">
                <table class="table table-striped table-hover table-condensed">
                    <thead>
                    <tr>
                        <th>Hash</th>
                        <th>Block</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Amount</th>
                        <th>Age</th>
                    </tr>
                    </thead>
                    <tbody id="recentTxs">

                    </tbody>
                </table>
            </div>
            <a href="txs.jsp" role="button" class="btn btn-default">查看更多交易</a></div>

    </div>
</div>
<script src="dateFormat.js"></script>
<hr>
<div class="container">
    <footer><p>© 四川大学嵌入式实验室 | 以太坊区块链浏览器 | 联系我们 | 数据来源：
        <a href="https://www.etherchain.org">www.etherchain.org</a> | Powered by Parity v1.7.8</p>
    </footer>
</div>
</body>
<script type="text/javascript">
    var priceurl = "https://etherchain.org/api/statistics/price";
    var baseurl = "https://etherchain.org/api/basic_stats";
    var txurl;
    $.ajaxSettings.async = false;//同步ajax请求
    $.getJSON(priceurl, function (result) {
        var result = eval(result);
        usd = result.data[result.data.length - 1].usd;
        $("#price").append("$" + usd);
    })

    $.getJSON(baseurl, function (result) {
        var result = eval(result);
        var difficulty = result.data.difficulty.difficulty;
        var blockTime = result.data.difficulty.blockTime;
        var number = result.data.difficulty.number;
        var name = result.data.difficulty.name;
        txurl = "https://etherchain.org/api/block/" + number + ":id/tx";
        $.getJSON(txurl, function (resultdata) {
            var resultdata = eval(resultdata);
            var length;
            if (resultdata.data.length >= 10) {
                length = 10;
            } else {
                length = resultdata.data.length;
            }
            for (i = 0; i < length; i++) {
                var hash = resultdata.data[i].hash.substring(0, 9) + "...";
                var block_id = resultdata.data[i].block_id;
                var sender = resultdata.data[i].sender.substring(0, 9) + "...";
                var recipient = resultdata.data[i].recipient.substring(0, 9) + "...";
                var amount = (resultdata.data[i].amount / 1000000000000000000).toFixed(3) + " Ether";
                var time = formatDuring(new Date().getTime() - new Date(resultdata.data[i].time).getTime());
                $("#recentTxs").append("<tr><td>" + hash + "</td><td><a href='block.jsp?number=" + block_id + "&name=" + name + "'>" +
                    block_id +
                    "</a></td>" +
                    "<td>" + sender + "</td><td>" + recipient + "</td><td>" + amount + "</td><td>" + time + "</td>" + "</tr>");
            }
            if (length < 10) {
                number = number - 1;
                console.log(number);
                txurl = "https://etherchain.org/api/block/" + number + ":id/tx";
                var coinbaseurl = "https://etherchain.org/api/block/" + number + ":id";
                var coinbase;
                $.getJSON(coinbaseurl, function (resultdata) {
                    coinbase = resultdata.data[0].coinbase;
                    var nameurl = "https://etherchain.org/api/account/multiple/" + coinbase + ":ids";
                    $.getJSON(coinbaseurl, function (resultdata) {
                        name = resultdata.data[0].name;
                        $.getJSON(txurl, function (resultdata) {
                            for (i = 0; i < 10 - length; i++) {
                                var hash = resultdata.data[i].hash.substring(0, 9) + "...";
                                var block_id = resultdata.data[i].block_id;
                                var sender = resultdata.data[i].sender.substring(0, 9) + "...";
                                var recipient = resultdata.data[i].recipient.substring(0, 9) + "...";
                                var amount = (resultdata.data[i].amount / 1000000000000000000).toFixed(3) + " Ether";
                                var time = formatDuring(new Date().getTime() - new Date(resultdata.data[i].time).getTime());
                                $("#recentTxs").append("<tr><td>" + hash + "</td><td><a href='block.jsp?number=" + block_id + "&name=" + name + "'>" +
                                    block_id +
                                    "</a></td>" +
                                    "<td>" + sender + "</td><td>" + recipient + "</td><td>" + amount + "</td><td>" + time + "</td>" + "</tr>");
                            }
                        })
                    })
                })


            }
        })

        $("#difficulty").append((difficulty / 1000000000000).toFixed(3) + " T");
        $("#blockTime").append(blockTime + "s");
        for (i = 0; i < 10; i++) {
            var number = result.data.blocks[i].number;
            var name = result.data.blocks[i].name;
            /*var time=new Date(result.data.blocks[i].time).getTime();*/
            var time = formatDuring(new Date().getTime() - new Date(result.data.blocks[i].time).getTime());
            /*var time=formatDuring(new Date().getUTCMilliseconds()-new Date(result.data.blocks[i].time).getUTCMilliseconds());*/
            var coinbase = result.data.blocks[i].coinbase;
            var subname;
            if (name.length > 10) {
                subname = name.substring(0, 10) + "...";
            } else {
                subname = name;
            }
            $("#recentblocks").append("<tr>" +
                "<td><a href='block.jsp?number=" + number + "&name=" + name + "'>" +
                number +
                "</a></td>" + "<td><a href='acount.jsp?name=" + name + "&coinbase=" + coinbase + "'>" +
                subname +
                "</td>" + "<td>" +
                time +
                "</td>" +
                "</tr>");
        }
    })
    $.getJSON(txurl, function (result) {
        var result = eval(result);
        lastnumber = result.data[result.data.length - 1].usd;
    })

</script>
</html>
