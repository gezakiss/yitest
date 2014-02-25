
// EmailScrapper()
// Checkout form email scrapper script
function EmailScrapper(){
    this.debug = false
    $(function () {
        // adding event listeners - focusout
        // if user give a valid email address the input will probably lost focus before giving up filling the complete form
        // if user leave page while in input, than email will not saved
        // @FEATURE: Future versions could use input event with timeouts to grab email address
        //      PROS: leaving page while in input problem solved and it also grabs multiple emails, if user changes it after typing one.
        //      CONS: it will produce more false email addresses
        //          ESC: a background mx check might helps reduce it || sending probe
        //      CONS: more API calls
        //  CONCL: needs more data!
        $("#order_email").on("focusout",  function () {
            emailscrapper.debug ? console.log("event forcusout") : "";
            if ( emailscrapper.validEmail ( $(this).val() ) ){
                emailscrapper.debug ? console.log("\tvalid email address") : "";
                emailscrapper.sendEmail($(this).val())
            }
        });

    })

    // Saving email with API
    this.sendEmail = function (email) {
        // AJAX call save email
        this.debug ? console.log("\t\tcalling API") : "";
        $.post( "/api/v1/emails/", { "email" : email } );
    }
    // Email address validation
    this.validEmail = function (email){
        // if new input types available, than using its native validation
        if (Modernizr.inputtypes.email) {
            input = document.createElement("input")
            input.setAttribute ("type", "email")
            input.setAttribute ("value", email )
            if (input.checkValidity()) {
                return true;
            }else{
                return false;
            }
        }else {
            // fallback - there is no perfect way to check email address ... this one is quick
            if (email.indexof("@")) {
                return true;
            }else{
                return false;
            }
        }
    }
}