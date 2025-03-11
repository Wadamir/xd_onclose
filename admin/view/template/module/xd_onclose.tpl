<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-xd_onclose" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1 style="display:block;font-size: 20px;"><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-xd_onclose">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <ul class="nav nav-tabs mb-0">
                <li class="active"><a href="#settings_main" data-toggle="tab"><?php echo $settings_main; ?></a></li>
                <li><a href="#settings_style" data-toggle="tab"><?php echo $settings_style; ?></a></li>
                <li class="hidden"><a href="#settings_sms" data-toggle="tab"><?php echo $settings_sms; ?></a></li>
                <li><a href="#settings_analytics" data-toggle="tab"><?php echo $settings_analytics; ?></a></li>
                <li><a href="#text_tab_help" data-toggle="tab"><?php echo $text_tab_help; ?></a></li>
            </ul>
            <div class="tab-content">
                <div id="settings_main" class="tab-pane fade in active">
                    <div class="panel panel-default" style="border-top:0;">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <fieldset id="cookie_days_fieldset" class="number-type number-type-plus-minus">
                                        <label for="cookie_days"><?php echo $cookie_days; ?></label>
                                        <div class="count-item__wrapper">
                                            <a href="#" class="count-item__btn minus">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <g clip-path="url(#clip0_1685_8985)">
                                                        <path d="M19 13H5V11H19V13Z"></path>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_1685_8985">
                                                            <rect width="24" height="24"></rect>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                            </a>
                                            <input type="number" name="xd_onclose[cookie_days]" class="form-control count-item__input" value="<?php echo isset($xd_onclose['cookie_days']) ? $xd_onclose['cookie_days'] : '0'; ?>" data-step="1" data-min-count="0" data-max-count="365" placeholder="">
                                            <a href="#" class="count-item__btn plus">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <g clip-path="url(#clip0_1685_8988)">
                                                        <path d="M19 13H13V19H11V13H5V11H11V5H13V11H19V13Z"></path>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_1685_8988">
                                                            <rect width="24" height="24"></rect>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                            </a>
                                        </div>
                                    </fieldset>
                                    <p class="field-tooltip"><?php echo $cookie_days_tooltip ?></p>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <fieldset id="mobile_seconds_fieldset" class="number-type number-type-plus-minus">
                                        <label for="mobile_seconds"><?php echo $mobile_seconds; ?></label>
                                        <div class="count-item__wrapper">
                                            <a href="#" class="count-item__btn minus">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <g clip-path="url(#clip0_1685_8985)">
                                                        <path d="M19 13H5V11H19V13Z"></path>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_1685_8985">
                                                            <rect width="24" height="24"></rect>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                            </a>
                                            <input type="number" name="xd_onclose[mobile_seconds]" class="form-control count-item__input" value="<?php echo isset($xd_onclose['mobile_seconds']) ? $xd_onclose['mobile_seconds'] : '0'; ?>" data-step="1" data-min-count="0" data-max-count="365" placeholder="">
                                            <a href="#" class="count-item__btn plus">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <g clip-path="url(#clip0_1685_8988)">
                                                        <path d="M19 13H13V19H11V13H5V11H11V5H13V11H19V13Z"></path>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_1685_8988">
                                                            <rect width="24" height="24"></rect>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                            </a>
                                        </div>
                                    </fieldset>
                                    <p class="field-tooltip"><?php echo $mobile_seconds_tooltip ?></p>
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label mb-10"><?php echo $entry_desktop_header; ?></label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_onclose[desktop_header][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_desktop_header; ?>" value="<?php echo isset($xd_onclose['desktop_header'][$language_id]) ? $xd_onclose['desktop_header'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label mb-10"><?php echo $entry_mobile_header; ?></label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_onclose[mobile_header][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_mobile_header; ?>" value="<?php echo isset($xd_onclose['mobile_header'][$language_id]) ? $xd_onclose['mobile_header'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $entry_desktop_text; ?></label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_onclose[desktop_text][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_desktop_text; ?>" value="<?php echo isset($xd_onclose['desktop_text'][$language_id]) ? $xd_onclose['desktop_text'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $entry_mobile_text; ?></label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_onclose[mobile_text][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_mobile_text; ?>" value="<?php echo isset($xd_onclose['mobile_text'][$language_id]) ? $xd_onclose['mobile_text'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $entry_success_type; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[success_type]" id="xd_onclose_success_type" class="form-control custom">
                                            <?php if (isset($xd_onclose['success_type']) && boolval($xd_onclose['success_type'])) { ?>
                                                <option value="0"><?php echo $success_type0; ?></option>
                                                <option value="1" selected="selected"><?php echo $success_type1; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $success_type0; ?></option>
                                                <option value="1"><?php echo $success_type1; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12" id="xd_onclose_success_text" style="<?php if (isset($xd_onclose['success_type']) && boolval($xd_onclose['success_type'])) { ?>display:none;<?php } ?>">
                                    <label class="control-label"><?php echo $entry_success_field; ?> (<?php echo $success_field_tooltip; ?>)</label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_onclose[success_field][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_success_field; ?>" value="<?php echo isset($xd_onclose['success_field'][$language_id]) ? $xd_onclose['success_field'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="col-lg-6 col-xs-12" id="xd_onclose_success_utm" style="<?php if (!isset($xd_onclose['success_type']) || !boolval($xd_onclose['success_type'])) { ?>display:none;<?php } ?>">
                                    <label class="control-label"><?php echo $entry_success_utm; ?></label>
                                    <input type="text" name="xd_onclose[success_utm]" value="<?php echo isset($xd_onclose['success_utm']) ? $xd_onclose['success_utm'] : ''; ?>" class="form-control" />
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field1_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[field1_status]" class="form-control custom">
                                            <?php if ($xd_onclose['field1_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_onclose['field1_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field2_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[field2_status]" class="form-control">
                                            <?php if ($xd_onclose['field2_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_onclose['field2_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field3_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[field3_status]" class="form-control">
                                            <?php if ($xd_onclose['field3_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_onclose['field3_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field4_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[captcha]" class="form-control">
                                            <?php if (!isset($xd_onclose['captcha']) || $xd_onclose['captcha'] === '') { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                            <?php foreach ($captchas as $captcha) { ?>
                                                <?php if (isset($xd_onclose['captcha']) && ($captcha['value'] === $xd_onclose['captcha'])) { ?>
                                                    <option value="<?php echo $captcha['value']; ?>" selected="selected"><?php echo $captcha['text']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $captcha['value']; ?>"><?php echo $captcha['text']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label" for="agree_status"><?php echo $agree_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[agree_status]" id="agree_status" class="form-control">
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php foreach ($informations as $information) { ?>
                                                <?php if ($information['information_id'] === $xd_onclose['agree_status']) { ?>
                                                    <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label" for="spam_protection"><?php echo $entry_spam_protection; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[spam_protection]" id="spam_protection" class="form-control">
                                            <?php if ($xd_onclose['spam_protection'] === '0') { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                            <?php } else { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label" for="validation_type"><?php echo $entry_validation_type; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_onclose[validation_type]" id="validation_type" class="form-control">
                                            <?php if ($xd_onclose['validation_type'] == $value_validation_type1) { ?>
                                                <option value="0"><?php echo $text_validation_type0; ?></option>
                                                <option value="<?php echo $value_validation_type1; ?>" selected="selected"><?php echo $text_validation_type1; ?></option>
                                                <option value="<?php echo $value_validation_type2; ?>"><?php echo $text_validation_type2; ?></option>
                                            <?php } else if ($xd_onclose['validation_type'] == $value_validation_type2) { ?>
                                                <option value="0"><?php echo $text_validation_type0; ?></option>
                                                <option value="<?php echo $value_validation_type1; ?>"><?php echo $text_validation_type1; ?></option>
                                                <option value="<?php echo $value_validation_type2; ?>" selected="selected"><?php echo $text_validation_type2; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_validation_type0; ?></option>
                                                <option value="<?php echo $value_validation_type1; ?>"><?php echo $text_validation_type1; ?></option>
                                                <option value="<?php echo $value_validation_type2; ?>"><?php echo $text_validation_type2; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_status; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_onclose[module_xd_onclose_status]" value="1" id="module_xd_onclose_status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_onclose['module_xd_onclose_status']) && $xd_onclose['module_xd_onclose_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="module_xd_onclose_status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="settings_style" class="tab-pane fade">
                    <div class="panel panel-default" style="border-top:0;">
                        <div class="panel-heading hidden">
                            <h2><?php echo $tab_styles; ?></h2>
                        </div>
                        <div class="panel-body">
                            <div class="row inline-input-group">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label" for="modal_style"><?php echo $tab_styles_modal_style; ?></label>
                                    <div class="custom-select">
                                        <select name="xd_onclose[modal_style]" id="modal_style" class="form-control">
                                            <option value="default" <?php echo (isset($xd_onclose['modal_style']) && $xd_onclose['modal_style'] === 'default') ? ' selected' : '' ?>><?php echo $tab_styles_modal_style_default; ?></option>
                                            <option value="modal-custom" <?php echo (isset($xd_onclose['modal_style']) && $xd_onclose['modal_style'] === 'modal-custom') ? ' selected' : '' ?>><?php echo $tab_styles_modal_style_custom; ?></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="settings_sms" class="tab-pane fade">
                    <div class="panel panel-default" style="border-top:0;">
                        <div class="panel-body" style="padding-top:0;">
                        </div>
                    </div>
                </div>
                <div id="settings_analytics" class="tab-pane fade">
                    <div class="panel panel-default" style="border-top:0;">
                        <!---------- Analytics settings ------------>
                        <div class="panel-body">
                            <!---------- Extended analytics (sourcebuster.js) ------------>
                            <h3 class="text-center mb-15"><?php echo $exan_form_title; ?></h3>
                            <div class="row">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $exan_status_title; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_onclose[exan_status]" value="1" id="exan_status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_onclose['exan_status']) && $xd_onclose['exan_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="exan_status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <!---------- Google.com ------------>
                            <hr class="main" />
                            <h3 class="text-center mb-15"><?php echo $google_form_title; ?></h3>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_category_btn"><?php echo $google_category_btn_title; ?></label>
                                    <input type="text" name="xd_onclose[google_category_btn]" value="<?php echo isset($xd_onclose['google_category_btn']) ? $xd_onclose['google_category_btn'] : ''; ?>" placeholder="<?php echo $google_category_btn_title; ?>" id="google_category_btn" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_action_btn"><?php echo $google_action_btn_title; ?></label>
                                    <input type="text" name="xd_onclose[google_action_btn]" value="<?php echo isset($xd_onclose['google_action_btn']) ? $xd_onclose['google_action_btn'] : ''; ?>" placeholder="<?php echo $google_action_btn_title; ?>" id="google_action_btn" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_category_send"><?php echo $google_category_send_title; ?></label>
                                    <input type="text" name="xd_onclose[google_category_send]" value="<?php echo isset($xd_onclose['google_category_send']) ? $xd_onclose['google_category_send'] : ''; ?>" placeholder="<?php echo $google_category_send_title; ?>" id="google_category_send" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_action_send"><?php echo $google_action_send_title; ?></label>
                                    <input type="text" name="xd_onclose[google_action_send]" value="<?php echo isset($xd_onclose['google_action_send']) ? $xd_onclose['google_action_send'] : ''; ?>" placeholder="<?php echo $google_action_send_title; ?>" id="google_action_send" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_category_success"><?php echo $google_category_success_title; ?></label>
                                    <input type="text" name="xd_onclose[google_category_success]" value="<?php echo isset($xd_onclose['google_category_success']) ? $xd_onclose['google_category_success'] : ''; ?>" placeholder="<?php echo $google_category_success_title; ?>" id="google_category_success" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_action_success"><?php echo $google_action_success_title; ?></label>
                                    <input type="text" name="xd_onclose[google_action_success]" value="<?php echo isset($xd_onclose['google_action_success']) ? $xd_onclose['google_action_success'] : ''; ?>" placeholder="<?php echo $google_action_success_title; ?>" id="google_action_success" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $google_target_status_title; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_onclose[google_status]" value="1" id="google_status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_onclose['google_status']) && $xd_onclose['google_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="google_status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <!---------- Yandex.ru ------------>
                            <hr class="main" />
                            <h3 class="text-center mb-15"><?php echo $ya_form_title; ?></h3>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="ya_counter"><?php echo $ya_counter_title; ?></label>
                                    <input type="text" name="xd_onclose[ya_counter]" value="<?php echo isset($xd_onclose['ya_counter']) ? $xd_onclose['ya_counter'] : ''; ?>" placeholder="<?php echo $ya_counter_title; ?>" id="ya_counter" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="ya_identifier"><?php echo $ya_identifier_title; ?></label>
                                    <input type="text" name="xd_onclose[ya_identifier]" value="<?php echo isset($xd_onclose['ya_identifier']) ? $xd_onclose['ya_identifier'] : ''; ?>" placeholder="<?php echo $ya_identifier_title; ?>" id="ya_identifier" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="ya_identifier_send"><?php echo $ya_identifier_send_title; ?></label>
                                    <input type="text" name="xd_onclose[ya_identifier_send]" value="<?php echo (isset($xd_onclose['ya_identifier_send'])) ? $xd_onclose['ya_identifier_send'] : ''; ?>" placeholder="<?php echo $ya_identifier_send_title; ?>" id="ya_identifier_send" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="ya_identifier_success"><?php echo $ya_identifier_success_title; ?></label>
                                    <input type="text" name="xd_onclose[ya_identifier_success]" value="<?php echo (isset($xd_onclose['ya_identifier_success'])) ? $xd_onclose['ya_identifier_success'] : ''; ?>" placeholder="<?php echo $ya_identifier_success_title; ?>" id="ya_identifier_success" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $ya_target_status_title; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_onclose[ya_status]" value="1" id="ya-status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_onclose['ya_status']) && $xd_onclose['ya_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="ya-status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="text_tab_help" class="tab-pane fade">
                    <div class="col-xs-12" style="border: 1px solid #ddd; border-top: none;">
                        <div class="h4 text-primary mb-0">
                            <strong><?php echo $text_tab_help_title; ?></strong>
                        </div>
                        <div class="text_help" style="margin-top:2em;"><?php echo $text_help; ?></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        let xd_onclose_success_type = document.getElementById('xd_onclose_success_type');
        let xd_onclose_success_text = document.getElementById('xd_onclose_success_text');
        let xd_onclose_success_utm = document.getElementById('xd_onclose_success_utm');
        if (xd_onclose_success_type && xd_onclose_success_text && xd_onclose_success_utm) {
            xd_onclose_success_type.addEventListener('change', function() {
                if (this.value === '0') {
                    xd_onclose_success_text.style.display = 'block';
                    xd_onclose_success_utm.style.display = 'none';
                } else {
                    xd_onclose_success_text.style.display = 'none';
                    xd_onclose_success_utm.style.display = 'block';
                }
            });
        }
    });

    document.querySelectorAll(".count-item__btn").forEach(button => {
        button.addEventListener("click", countPlusMinus);
    });

    function countPlusMinus(event) {
        event.preventDefault(); // Prevent default link behavior

        console.log('countPlusMinus', event);

        let btn = event.currentTarget; // Ensure we always get the button
        let count_wrapper = btn.closest('.count-item__wrapper'); // More reliable than parentElement
        let input = count_wrapper.querySelector('.count-item__input');

        let step = parseInt(input.getAttribute('data-step')) || 1;
        let min_count = parseInt(input.getAttribute('data-min-count')) || 0;
        let max_count = parseInt(input.getAttribute('data-max-count')) || 1000;
        let value = parseInt(input.value) || 0; // Prevent NaN issues

        if (btn.classList.contains('minus')) {
            input.value = Math.max(value - step, min_count); // Ensure it doesn't go below min
        } else if (btn.classList.contains('plus')) {
            input.value = Math.min(value + step, max_count); // Ensure it doesn't go above max
        }
    }
</script>