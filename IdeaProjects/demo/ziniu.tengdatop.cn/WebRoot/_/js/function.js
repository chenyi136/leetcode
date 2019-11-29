App = {};

//App.dialogById('分享地址','shareInfo')
App.dialogById = function(title,idName){
    d = dialog({
        title: title,
        content: document.getElementById(idName),
    });
    d.showModal();
    return false;
}
