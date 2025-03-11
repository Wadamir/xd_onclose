<!-- xd onclose module start -->
<?php if ($status) { ?>
    <div id="xd_onclose_success" class="modal fade <?= $modal_style ?>">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
                        </svg>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center"><?php echo $success_field; ?></div>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    <div id="xd_onclose_modal" class="modal fade <?= $modal_style ?>">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="xd_onclose-form" action="index.php?route=module/xd_onclose/send" role="form">
                    <fieldset>
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
                                </svg>
                            </button>
                            <h2 id="xd_onclose_modal_title" class="modal-title"><?php echo $desktop_header; ?></h2>
                        </div>
                        <div class="modal-body">
                            <div class="col-xl-12">
                                <div id="source" class="hide" style="display:none">
                                    <input id="xd_onclose_sb_first_typ" class="hidden" type="text" name="xd_onclose_sb_first_typ" value="">
                                    <input id="xd_onclose_sb_first_src" class="hidden" type="text" name="xd_onclose_sb_first_src" value="">
                                    <input id="xd_onclose_sb_first_mdm" class="hidden" type="text" name="xd_onclose_sb_first_mdm" value="">
                                    <input id="xd_onclose_sb_first_cmp" class="hidden" type="text" name="xd_onclose_sb_first_cmp" value="">
                                    <input id="xd_onclose_sb_first_cnt" class="hidden" type="text" name="xd_onclose_sb_first_cnt" value="">
                                    <input id="xd_onclose_sb_first_trm" class="hidden" type="text" name="xd_onclose_sb_first_trm" value="">

                                    <input id="xd_onclose_sb_current_typ" class="hidden" type="text" name="xd_onclose_sb_current_typ" value="">
                                    <input id="xd_onclose_sb_current_src" class="hidden" type="text" name="xd_onclose_sb_current_src" value="">
                                    <input id="xd_onclose_sb_current_mdm" class="hidden" type="text" name="xd_onclose_sb_current_mdm" value="">
                                    <input id="xd_onclose_sb_current_cmp" class="hidden" type="text" name="xd_onclose_sb_current_cmp" value="">
                                    <input id="xd_onclose_sb_current_cnt" class="hidden" type="text" name="xd_onclose_sb_current_cnt" value="">
                                    <input id="xd_onclose_sb_current_trm" class="hidden" type="text" name="xd_onclose_sb_current_trm" value="">

                                    <input id="xd_onclose_sb_first_add_fd" class="hidden" type="text" name="xd_onclose_sb_first_add_fd" value="">
                                    <input id="xd_onclose_sb_first_add_ep" class="hidden" type="text" name="xd_onclose_sb_first_add_ep" value="">
                                    <input id="xd_onclose_sb_first_add_rf" class="hidden" type="text" name="xd_onclose_sb_first_add_rf" value="">

                                    <input id="xd_onclose_sb_current_add_fd" class="hidden" type="text" name="xd_onclose_sb_current_add_fd" value="">
                                    <input id="xd_onclose_sb_current_add_ep" class="hidden" type="text" name="xd_onclose_sb_current_add_ep" value="">
                                    <input id="xd_onclose_sb_current_add_rf" class="hidden" type="text" name="xd_onclose_sb_current_add_rf" value="">

                                    <input id="xd_onclose_sb_session_pgs" class="hidden" type="text" name="xd_onclose_sb_session_pgs" value="">
                                    <input id="xd_onclose_sb_session_cpg" class="hidden" type="text" name="xd_onclose_sb_session_cpg" value="">

                                    <input id="xd_onclose_sb_udata_vst" class="hidden" type="text" name="xd_onclose_sb_udata_vst" value="">
                                    <input id="xd_onclose_sb_udata_uip" class="hidden" type="text" name="xd_onclose_sb_udata_uip" value="">
                                    <input id="xd_onclose_sb_udata_uag" class="hidden" type="text" name="xd_onclose_sb_udata_uag" value="">
                                    <input id="xd_onclose_sb_promo_code" class="hidden" type="text" name="xd_onclose_sb_promo_code" value="">
                                </div>
                                <input id="xd_onclose_success_type" class="hidden" type="text" name="xd_onclose_success_type" value="<?= $success_type ?>">
                                <input id="xd_onclose_success_utm" class="hidden" type="text" name="xd_onclose_success_utm" value="<?= $success_utm ?>">
                                <div class="pb-1">
                                    <div id="desktop_text" class="text-description hidden"><?php echo $desktop_text; ?></div>
                                    <div id="mobile_text" class="text-description hidden"><?php echo $mobile_text; ?></div>
                                </div>
                                <?php if ($field1_status > 0) { ?>
                                    <div class="input-group<?= ($field1_status === 2) ? ' has-warning' : '' ?>">
                                        <span class="input-group-addon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z" />
                                            </svg>
                                        </span>
                                        <input id="xd_onclose_name" class="form-control xd_onclose-input<?= ($field1_status === 2) ? ' required' : '' ?>" type="text" name="xd_onclose_name" placeholder="<?php echo $field1_title; ?>">
                                    </div>
                                    <br />
                                <?php } ?>
                                <?php if ($spam_protection) { ?>
                                    <div class="input-group input-group-protected">
                                        <span class="input-group-addon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
                                                <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5M.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5m15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5" />
                                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                            </svg>
                                        </span>
                                        <input id="xd_onclose_surname" class="form-control xd_onclose-input" type="text" name="xd_onclose_surname" placeholder="Surname">
                                    </div>
                                <?php } ?>
                                <?php if ($field2_status > 0) { ?>
                                    <div class="input-group<?= ($field2_status === 2) ? ' has-warning' : '' ?>">
                                        <span class="input-group-addon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                                                <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
                                            </svg>
                                        </span>
                                        <input id="xd_onclose_phone" class="form-control xd_onclose-input<?= ($field2_status === 2) ? ' required' : '' ?>" type="tel" name="xd_onclose_phone" placeholder="<?php echo $field2_title; ?>">
                                    </div>
                                    <br />
                                <?php } ?>
                                <?php if ($spam_protection) { ?>
                                    <div class="input-group input-group-protected">
                                        <span class="input-group-addon">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                                <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z" />
                                            </svg>
                                        </span>
                                        <input id="xd_onclose_email" class="form-control xd_onclose-input" type="text" name="xd_onclose_email" placeholder="Email">
                                    </div>
                                <?php } ?>
                                <?php if ($field3_status > 0) { ?>
                                    <div class="form-group<?= ($field3_status === 2) ? ' has-warning' : '' ?>">
                                        <textarea id="xd_onclose_message" class="form-control xd_onclose-input<?= ($field3_status === 2) ? ' required' : '' ?>" name="xd_onclose_message" rows="3" placeholder="<?php echo $field3_title; ?>"></textarea>
                                    </div>
                                <?php } ?>
                                <?php if (boolval($captcha)) { ?>
                                    <div id="xd_onclose_captcha" class="captcha <?= $captcha_class ?>">
                                        <?php echo $captcha; ?>
                                    </div>
                                <?php } ?>
                            </div>
                            <div class="clearfix"></div>
                            <?php if ($agree_status !== 0) { ?>
                                <div class="col-xl-12">
                                    <p class="information"><?php echo $text_agree; ?></p>
                                </div>
                                <div class="clearfix"></div>
                            <?php } ?>
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div id="xd_onclose_error" class="pb-1 text-left text-danger hidden"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2 hidden-xs">
                                </div>
                                <div class="col-sm-8 col-xs-12">
                                    <button type="submit" class="btn btn-lg btn-block btn-default"><?php echo $submit_button; ?></button>
                                </div>
                                <div class="col-sm-2 hidden-xs">
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let isMobile = /Mobi|Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
            let cookie_onclose = getCookie('xd_onclose');
            console.log('Cookie on_close:', cookie_onclose);
            console.log('Mobile:', isMobile);

            if (!cookie_onclose) {
                if (isMobile) {
                    // Show on timeOut
                    setTimeout(function() {
                        showModalOnClose('<?php echo $mobile_header ?>', true);
                    }, <?= $mobile_seconds ?>);
                } else {
                    // Show on mouse leave
                    document.addEventListener('mouseleave', desktopMouseleave, false);
                    // Remove event listener on modal show
                    $('#xd_onclose_modal').on('show.bs.modal', function() {
                        console.log('Remove event listener');
                        document.removeEventListener('mouseleave', desktopMouseleave, false);
                    });
                }
            }

            setCookie("xd_onclose", Date.now(), <?= $cookie_days ?>);

            <?php if ($validation_type !== '0') { ?>
                $('#xd_onclose_phone').mask('<?= $validation_type ?>');
            <?php } ?>
            <?php if ($exan_status) { ?>
                console.log('Exan status:', <?= $exan_status ?>);
                sbjs.init({
                    lifetime: 3,
                    callback: onClosePlaceData,
                });
            <?php } ?>
        });

        function desktopMouseleave(event) {
            if (event.clientY <= 0) {
                showModalOnClose('<?php echo $desktop_header ?>', false);
            }
        }

        function showModalOnClose(title, isMobile = false) {
            let modal_title = document.getElementById('xd_onclose_modal_title');
            let desktop_text = document.getElementById('desktop_text');
            let mobile_text = document.getElementById('mobile_text');
            if (!modal_title) {
                return;
            }
            modal_title.innerHTML = title;
            if (desktop_text && mobile_text) {
                if (isMobile) {
                    desktop_text.classList.add('hidden');
                    mobile_text.classList.remove('hidden');
                } else {
                    desktop_text.classList.remove('hidden');
                    mobile_text.classList.add('hidden');
                }
            }
            $('#xd_onclose_modal').modal('show');
        }

        /* Cookie functions */
        function getCookie(name) {
            let matches = document.cookie.match(new RegExp(
                "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
            ));
            return matches ? decodeURIComponent(matches[1]) : null; // Return null if cookie not found
        }

        function setCookie(name, value, days) {
            let date = new Date();
            date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
            document.cookie = name + "=" + encodeURIComponent(value) + "; expires=" + date.toUTCString() + "; path=/";
        }



        <?php if ($exan_status) { ?>

            function onClosePlaceData(sb) {
                console.log(sb);
                document.getElementById('xd_onclose_sb_first_typ').value = sb.first.typ;
                document.getElementById('xd_onclose_sb_first_src').value = sb.first.src;
                document.getElementById('xd_onclose_sb_first_mdm').value = sb.first.mdm;
                document.getElementById('xd_onclose_sb_first_cmp').value = sb.first.cmp;
                document.getElementById('xd_onclose_sb_first_cnt').value = sb.first.cnt;
                document.getElementById('xd_onclose_sb_first_trm').value = sb.first.trm;

                document.getElementById('xd_onclose_sb_current_typ').value = sb.current.typ;
                document.getElementById('xd_onclose_sb_current_src').value = sb.current.src;
                document.getElementById('xd_onclose_sb_current_mdm').value = sb.current.mdm;
                document.getElementById('xd_onclose_sb_current_cmp').value = sb.current.cmp;
                document.getElementById('xd_onclose_sb_current_cnt').value = sb.current.cnt;
                document.getElementById('xd_onclose_sb_current_trm').value = sb.current.trm;

                document.getElementById('xd_onclose_sb_first_add_fd').value = sb.first_add.fd;
                document.getElementById('xd_onclose_sb_first_add_ep').value = sb.first_add.ep;
                document.getElementById('xd_onclose_sb_first_add_rf').value = sb.first_add.rf;

                document.getElementById('xd_onclose_sb_current_add_fd').value = sb.current_add.fd;
                document.getElementById('xd_onclose_sb_current_add_ep').value = sb.current_add.ep;
                document.getElementById('xd_onclose_sb_current_add_rf').value = sb.current_add.rf;

                document.getElementById('xd_onclose_sb_session_pgs').value = sb.session.pgs;
                document.getElementById('xd_onclose_sb_session_cpg').value = sb.session.cpg;

                document.getElementById('xd_onclose_sb_udata_vst').value = sb.udata.vst;
                document.getElementById('xd_onclose_sb_udata_uip').value = sb.udata.uip;
                document.getElementById('xd_onclose_sb_udata_uag').value = sb.udata.uag;

                document.getElementById('xd_onclose_sb_promo_code').value = sb.promo.code;
            }

        <?php } ?>
    </script>
<?php } ?>
<!-- xd onclose module end -->