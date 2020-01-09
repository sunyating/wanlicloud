//上传货品=====================================================================
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var ue = UE.getEditor('editor',{
    //这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
    //toolbars:[['FullScreen','simpleupload','Source', 'Undo', 'Redo','Bold','test']],
    toolbars: [[
        'fullscreen', 'source', '|', 'undo', 'redo', '|',
        'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
        'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
        'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
        'directionalityltr', 'directionalityrtl', 'indent', '|',
        'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
        'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
        'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
        'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
        'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
        'print', 'preview', 'searchreplace', 'drafts', 'help'
    ]],
    //focus时自动清空初始化时的内容
    autoClearinitialContent:true,
    //关闭字数统计
    wordCount:false,
    //更多其他参数，请参考ueditor.config.js中的配置项
});

function getContent() {
    //var arr = [];
    /*arr.push("使用editor.getContent()方法可以获得编辑器的内容");
    arr.push("内容为：");
    arr.push(UE.getEditor('editor').getContent());
    arr.push(document.getElementById("sellPoint").value);*/
    //alert(arr.join("\n"));
    var name=document.getElementById("prodName").value;
    if(null==name || ""==name){
        toastr.error(document.getElementById("prodName").getAttribute("placeholder"));
        return;
    }
    var desc=UE.getEditor('editor').getContent();
    if(null==desc || ""==desc){
        toastr.error("请输入货品描述")

        return;
    }

    $.ajax({
        url:'/seller/uploadProduct',
        data:{name:name,desc:desc},
        success:function (data) {
            console.log(data);
            if(data.status==200){
                toastr.success("发布货品成功");
                UE.getEditor('editor').setContent("");
                $("#prodName").val("");
            }
        },
        error:function(){
            toastr.error("发布货品失败");
        }

    })





}
