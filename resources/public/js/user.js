
$(function() {
    validatorUser = $("form[name='user']").validate({
        rules: {
            username: {
                required: true
            },
            password: {
                required: true
            },
            name: {
                required: true
            },
            surname: {
                required: true
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            username: {
                required: "Please enter a username"
            },
            password: {
                required: "Please enter a password"
            },
            name: {
                required: "Please enter a first name"
            },
            surname: {
                required: "Please enter a last name"
            },
            email: {
                required: "Please enter an email"
            },

        },
        submitHandler: function(form) {
            form.submit();
        }
    });

});



