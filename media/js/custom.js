var arr = []
// loop through each list item and get the metadata
    $('ul.sort li').each(function () {  
        var meta = $(this).metadata();
        meta.elem = $(this);
        arr.push(meta);
    });
 arr.sort(compare);

//Foreach item append it to the container. The first i arr will then end up in the top
$.each(arr, function(index, item){
    item.elem.appendTo(item.elem.parent());
});

function compare(a,b){
    return a.dataset['sort'] - b.dataset['sort'];
};

