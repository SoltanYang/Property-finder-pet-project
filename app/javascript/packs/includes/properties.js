$(function (){
    $("#show-tel").on("click", function(){
        var $this = $(this);
        $this.find("span").text( $this.data("telephone"))
    });

    $("#send-message-to-agent").on("click", function () {
        var agent_id = $("#agent_id").val(),
            first_name = $("#message-first-name").val(),
            last_name = $("#message-last-name").val(),
            email = $("#message-email").val(),
            message = $("#message-text").val();

        $.ajax({
            url: "/agent/message",
            method: "POST",
            datatype: "json",
            data: {
                agent_id: agent_id,
                first_name: first_name,
                last_name: last_name,
                email: email,
                message: message
            },
            success: function(data) {
                $("#sendEmailModal form").remove();
                $('#send-message-to-agent').remove();
                $("#sendEmailModal .modal-body").html("<p>Your message has been sent successfully!</p>");
            }
        })
    });

    $('#toggleDetails').on("click", function(){
        var details = $("#property-details");
        details.toggleClass("open");
        if(details.hasClass("open")){
            $(this).text("Show less");
        } else {
            $(this).text("Show more")
        }
    });
});