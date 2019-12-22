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
            if (data.color == null){
            print("color=null")
            print(data.color)
             window.location = "/result?style=" + data.id + "&price=" + data.price;
               print(data.color)
            }
            else {
                window.location = "/result?style=" + data.id + "&color=" + data.color + "&price=" + data.price;
                }
            } else {
                $("#question-text").text(data.text);
                question["text"] = data.text;
                question["price"] = data.price;
                question["style"] = data.style;
                question["color"] = data.color;
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
