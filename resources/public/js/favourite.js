function favourite(id) {
    $.ajax({
        type: "POST",
        url: "/favourite",
        data: {
            cocktail: id
        },
        dataType: 'json',
        statusCode: {
                201: function(data) {
                                 $("#button-fav").html('<input type="button" value="Remove from favourites" onclick="removeFromFav(' + id + ')"/>');
                             }
            }
    });
}

function removeFromFav(id) {
    $.ajax({
        type: "DELETE",
        url: "/favourite",
        data: {
            cocktail: id
        },
        dataType: 'json',
        statusCode: {
            204: function(data) {
                 $("#button-fav").html('<input type="button" value="Favourites" onclick="favourite(' + id + ')"/>');
             }
        }
    });
}
