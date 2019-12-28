var question = {};
$(document).ready(function() {
    send();
});

$(function() {
    var loading = $('#loadbar').hide();
    $(document)
        .ajaxStart(function() {
            loading.show();
        }).ajaxStop(function() {
            loading.hide();
        });
});

function sendAnswer(label) {
    var choice = $(label).find('input:radio').val();
    var text = question["text"] = $("#question-text").text();
    $('#loadbar').show();
    $('#quiz').fadeOut();
    setTimeout(function() {
        $('#quiz').show();
        $('#loadbar').fadeOut();
        question["answer"] = choice;
        send();
    }, 500);
}

function send() {
    $("#error").hide();
    $.ajax({
        type: "POST",
        url: "/questions",
        data: {
            question: question
        },
        dataType: 'json',
        success: function(data) {
            if (data.id != null && data.id != "") {
            var url = "/result?style=" + data.id + "&price=" + data.price + "&strength=" + data.strength;

            if (data.color != "") {
            url = url + "&color=" + data.color }
            else {}

             if (data.season != 5) {
              url = url + "&season=" + data.season; }
            else {}

             if (data.moment != 6) {
              url = url + "&moment=" + data.moment }
              else {}
             window.location = url
            } else {
                $("#question-text").text(data.text);
                question["text"] = data.text;
                question["price"] = data.price;
                question["style"] = data.style;
                question["color"] = data.color;
                question["strength"] = data.strength;
                question["season"] = data.season;
                question["moment"] = data.moment;
                var questions = '';
                for (var i = 0; i < data.suggestedAnswers.length; i++) {
                    questions += '<label id="label-quiz" class="element-animation' + (i + 1) + ' btn btn-lg btn-primary btn-block" onclick="sendAnswer(this)"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span><input type="radio" name="answer" value="' + data.suggestedAnswers[i] + '">' + data.suggestedAnswers[i] + '</label>';
                }
                $("#quiz").html(questions);
            }
        },
        error: function(xhr, status, error) {
            showErrorMessage(xhr.responseText);
        }
    });

}
