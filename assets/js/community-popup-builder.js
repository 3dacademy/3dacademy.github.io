
$(document).ready(function() {

    var delay = 3000; // milliseconds, show popup after X milliseconds
    // TODO better test and set every 3 days
    var cookie_expire = 0; // days, show popup every 2 days?

    var cookie = localStorage.getItem("community-popup-builder");
    if(cookie == undefined || cookie == null) {
        console.log("Cookie zero value");
        cookie = 0;
    }

    if(((new Date()).getTime() - cookie) / (1000 * 60 * 60 * 24) > cookie_expire) {

        $("#community-popup-builder").delay(delay).fadeIn("fast", () => {
            $("#community-popup-box").fadeIn("fast", () => {});
        });

        $("#community-popup-form-subscribe").click(() => {
            console.log('Sending email...');

            var templateParams = {
                name: $("#community-popup-form input[type=text][name=name]").val(),
                surname: $("#community-popup-form input[type=text][name=surname]").val(),
                email: $("#community-popup-form input[type=text][name=email]").val()
            };

            console.log(templateParams);

            // TODO uncomment once ready with form inputs
            // emailjs.send('default_service', 'community_subscription_template', templateParams)
            //     .then(function(response) {
            //         console.log('SUCCESS ;)', response.status, response.text);
            //     }, function(error) {
            //         console.log('FAILED :(', error);
            //     });
        });

        $("#community-popup-close").click(() => {
            $("#community-popup-builder, #community-popup-box").fadeOut()
            localStorage.setItem("community-popup-builder", (new Date()).getTime());
        });
    }

});
