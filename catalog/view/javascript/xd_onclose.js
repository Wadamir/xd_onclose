document.addEventListener("DOMContentLoaded", function () {
    console.log('xd_onclose.js!');

    $('#xd_onclose-form input').focus(function () {
        $(this).parent().removeClass('has-error');
        if ($(this).attr('name') === 'captcha') {
            $(this).parent().parent().parent().removeClass('has-error');
        }
    });

    $('#xd_onclose-form').submit(function (event) {
        event.preventDefault ? event.preventDefault() : (event.returnValue = false);
        if (!formValidation(event.target)) { return false; }
        var sendingForm = $(this);
        var submit_btn = $(this).find('button[type=submit]');
        var value_text = $(submit_btn).text();
        var waiting_text = 'SENDING';
        $.ajax({
            url: 'index.php?route=module/xd_onclose/submit',
            type: 'post',
            data: $('#xd_onclose-form input[type=\'hidden\'], #xd_onclose-form input[type=\'text\'], #xd_onclose-form input[type=\'tel\'], #xd_onclose-form input[type=\'email\'], #xd_onclose-form textarea'),
            dataType: 'json',
            beforeSend: function () {
                $(submit_btn).prop('disabled', true);
                $(submit_btn).addClass('waiting').text(waiting_text);
            },
            complete: function () {
                $(submit_btn).button('reset');
            },
            success: function (json) {
                console.log(json);
                if (json['error']) {
                    if (json['error']['input'] === 'spam_protection') {
                        $(sendingForm).trigger('reset');
                        $(submit_btn).removeClass('waiting');
                        $(submit_btn).text(value_text);
                        $(submit_btn).prop('disabled', false);
                        $('#xd_onclose_success').find('.text-center').html(json['error']['message']);
                        $('#xd_onclose_modal').on('hidden.bs.modal', function (e) {
                            $('#xd_onclose_success').modal('show');
                            setTimeout(function () {
                                console.log('success sending!');
                                $('#xd_onclose_success').modal('hide');
                            }, 3000);
                        });
                        $('#xd_onclose_modal').modal('hide');
                    } else {
                        $(submit_btn).prop('disabled', false);
                        $(submit_btn).removeClass('waiting').text("ERROR");
                        setTimeout(function () {
                            $(submit_btn).delay(3000).text(value_text);
                        }, 3000);
                    }
                }

                if (json['success']) {
                    var success = true;
                    let successType = document.getElementById('xd_onclose_success_type').value;
                    console.log('successType - ', successType);
                    if (successType == '0') {
                        $(sendingForm).trigger('reset');
                        $(submit_btn).removeClass('waiting');
                        $(submit_btn).text(value_text);
                        $(submit_btn).prop('disabled', false);
                        $('#xd_onclose_modal').modal('hide');
                        $('#xd_onclose_modal').on('hidden.bs.modal', function (e) {
                            if (success) {
                                $('#xd_onclose_success').modal('show');
                                setTimeout(function () {
                                    console.log('success sending!');
                                    $('#xd_onclose_success').modal('hide');
                                }, 4000);
                                success = false;
                            }
                        });
                    } else {
                        let successUtm = '';
                        if (document.getElementById('xd_onclose_success_utm')) {
                            successUtm = document.getElementById('xd_onclose_success_utm').value;
                        }
                        successUtm = successUtm.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').trim();
                        console.log('successUtm - ', successUtm);
                        let successUrl = '/index.php?route=checkout/success';
                        if (successUtm !== '') {
                            successUrl = '/index.php?route=checkout/success&' + successUtm;
                        }
                        window.location.href = successUrl;
                    }
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                $(submit_btn).prop('disabled', false);
                $(submit_btn).removeClass('waiting').text("ERROR");
                setTimeout(function () {
                    $(submit_btn).delay(3000).text(value_text);
                }, 3000);
            }
        });
        event.preventDefault();
    });
});

function formValidation(formElem) {
    var elements = $(formElem).find('input.required');
    console.log('elements - ', elements);
    var telElements = $(formElem).find('input[type=tel]');
    console.log('telElements - ', telElements);
    var errorCounter = 0;

    $(elements).each(function (indx, elem) {
        if ($(elem).attr('type') === 'tel' || $(elem).attr('type') === 'hidden') {
            return;
        }
        var placeholder = $(elem).attr('placeholder');
        if ($.trim($(elem).val()) == '' || $(elem).val() == placeholder) {
            $(elem).parent().addClass('has-error');
            errorCounter++;
        } else {
            $(elem).parent().removeClass('has-error');
        }
    });

    $(telElements).each(function (indx, elem) {
        var pattern = new RegExp(/^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$/);
        if (!pattern.test($(elem).val()) || $.trim($(elem).val()) == '') {
            $(elem).parent().addClass('has-error');
            errorCounter++;
        } else {
            $(elem).parent().removeClass('has-error');
        }
    });

    console.log('validation error - ', errorCounter);

    if (errorCounter > 0) {
        return false;
    } else {
        return true;
    }
}

function openInfo(e, link) {
    e.preventDefault();
    e.stopPropagation();
    window.open(link, '_blank');
    return false;
}