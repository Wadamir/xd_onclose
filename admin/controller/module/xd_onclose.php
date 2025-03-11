<?php
class ControllerModuleXDOnclose extends Controller
{
    private $error = array();
    public function index()
    {
        $this->load->language('module/xd_onclose');
        $this->document->setTitle($this->language->get('heading_name'));
        $this->document->addStyle('view/stylesheet/xd_onclose.css');
        $this->load->model('setting/setting');
        if (($this->request->server['REQUEST_METHOD'] === 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('xd_onclose', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }
        // Heading
        $data['heading_title'] = $this->language->get('heading_title');
        $data['heading_name'] = $this->language->get('heading_name');
        // Text
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        //Buttons
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        // Nav tabs
        $data['settings_main'] = $this->language->get('settings_main');
        $data['settings_style'] = $this->language->get('settings_style');
        $data['settings_sms'] = $this->language->get('settings_sms');
        $data['settings_analytics'] = $this->language->get('settings_analytics');
        $data['text_tab_help'] = $this->language->get('text_tab_help');
        // Cookie
        $data['cookie_days'] = $this->language->get('cookie_days');
        $data['cookie_days_tooltip'] = $this->language->get('cookie_days_tooltip');
        $data['mobile_seconds'] = $this->language->get('mobile_seconds');
        $data['mobile_seconds_tooltip'] = $this->language->get('mobile_seconds_tooltip');
        // Fields
        $data['field1_title'] = $this->language->get('field1_title');
        $data['field2_title'] = $this->language->get('field2_title');
        $data['field3_title'] = $this->language->get('field3_title');
        $data['field4_title'] = $this->language->get('field4_title');
        $data['agree_title'] = $this->language->get('agree_title');
        $data['field_required'] = $this->language->get('field_required');
        // Phone validation
        $data['entry_validation_type'] = $this->language->get('entry_validation_type');
        $data['text_validation_type0'] = $this->language->get('text_validation_type0');
        $data['text_validation_type1'] = $this->language->get('text_validation_type1');
        $data['text_validation_type2'] = $this->language->get('text_validation_type2');
        $data['value_validation_type1'] = $this->language->get('value_validation_type1');
        $data['value_validation_type2'] = $this->language->get('value_validation_type2');
        // Spam protection
        $data['entry_spam_protection'] = $this->language->get('entry_spam_protection');
        // Entry
        $data['entry_desktop_header'] = $this->language->get('entry_desktop_header');
        $data['entry_desktop_text'] = $this->language->get('entry_desktop_text');
        $data['entry_mobile_header'] = $this->language->get('entry_mobile_header');
        $data['entry_mobile_text'] = $this->language->get('entry_mobile_text');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_redirect'] = $this->language->get('entry_redirect');
        $data['entry_success_field'] = $this->language->get('entry_success_field');
        $data['success_field_tooltip'] = htmlspecialchars($this->language->get('success_field_tooltip'));
        // Success
        $data['entry_success_type'] = $this->language->get('entry_success_type');
        $data['entry_success_utm'] = $this->language->get('entry_success_utm');
        $data['success_type0'] = $this->language->get('success_type0');
        $data['success_type1'] = $this->language->get('success_type1');
        $data['success_type_tooltip'] = $this->language->get('success_type_tooltip');

        // Tab Styles
        $data['tab_styles'] = $this->language->get('tab_styles');
        $data['tab_styles_button_color'] = $this->language->get('tab_styles_button_color');
        $data['tab_styles_button_position'] = $this->language->get('tab_styles_button_position');
        $data['tab_styles_button_position_hide'] = $this->language->get('tab_styles_button_position_hide');
        $data['tab_styles_button_position_top_left'] = $this->language->get('tab_styles_button_position_top_left');
        $data['tab_styles_button_position_top_right'] = $this->language->get('tab_styles_button_position_top_right');
        $data['tab_styles_button_position_bottom_left'] = $this->language->get('tab_styles_button_position_bottom_left');
        $data['tab_styles_button_position_bottom_right'] = $this->language->get('tab_styles_button_position_bottom_right');
        $data['tab_styles_modal_style'] = $this->language->get('tab_styles_modal_style');
        $data['tab_styles_modal_style_default'] = $this->language->get('tab_styles_modal_style_default');
        $data['tab_styles_modal_style_custom'] = $this->language->get('tab_styles_modal_style_custom');



        // Extended analytics
        $data['exan_form_title'] = $this->language->get('exan_form_title');
        $data['exan_status_title'] = $this->language->get('exan_status_title');

        // Yandex
        $data['ya_form_title'] = $this->language->get('ya_form_title');
        $data['ya_counter_title'] = $this->language->get('ya_counter_title');
        $data['ya_identifier_title'] = $this->language->get('ya_identifier_title');
        $data['ya_identifier_send_title'] = $this->language->get('ya_identifier_send_title');
        $data['ya_identifier_success_title'] = $this->language->get('ya_identifier_success_title');
        $data['ya_target_status_title'] = $this->language->get('ya_target_status_title');

        // Google
        $data['google_form_title'] = $this->language->get('google_form_title');
        $data['google_category_btn_title'] = $this->language->get('google_category_btn_title');
        $data['google_action_btn_title'] = $this->language->get('google_action_btn_title');
        $data['google_category_send_title'] = $this->language->get('google_category_send_title');
        $data['google_action_send_title'] = $this->language->get('google_action_send_title');
        $data['google_category_success_title'] = $this->language->get('google_category_success_title');
        $data['google_action_success_title'] = $this->language->get('google_action_success_title');
        $data['google_target_status_title'] = $this->language->get('google_target_status_title');

        // Help tab
        $data['text_tab_help'] = $this->language->get('text_tab_help');
        $data['text_tab_help_title'] = $this->language->get('text_tab_help_title');
        $data['text_help'] = $this->language->get('text_help');



        $this->load->model('catalog/information');
        $data['informations'] = $this->model_catalog_information->getInformations();
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_name'),
            'href' => $this->url->link('module/xd_onclose', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['action'] = $this->url->link('module/xd_onclose', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        // New var
        if (isset($this->request->post['xd_onclose'])) {
            $data['xd_onclose'] = $this->request->post['xd_onclose'];
        } else {
            $data['xd_onclose'] = $this->config->get('xd_onclose');
        }

        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();
        $languages = $this->model_localisation_language->getLanguages();
        foreach ($languages as $language) {
            $language_id = $language['language_id'];
            if (isset($this->request->post['xd_onclose'])) {
                $post_data = $this->request->post['xd_onclose'];
                $data['xd_onclose']['desktop_header'][$language['language_id']] = strip_tags($post_data['desktop_header'][$language['language_id']]);
                $data['xd_onclose']['desktop_text'][$language['language_id']] = htmlspecialchars($post_data['desktop_text'][$language['language_id']]);
                $data['xd_onclose']['mobile_header'][$language['language_id']] = strip_tags($post_data['mobile_header'][$language['language_id']]);
                $data['xd_onclose']['mobile_text'][$language['language_id']] = htmlspecialchars($post_data['mobile_text'][$language['language_id']]);
                $data['xd_onclose']['success_field'][$language['language_id']] = htmlspecialchars($post_data['success_field'][$language['language_id']]);
            } else {
                if (isset($this->config->get('xd_onclose')['desktop_header'][$language['language_id']]) && $this->config->get('xd_onclose')['desktop_header'][$language['language_id']] != '') {
                    $data['xd_onclose']['desktop_header'][$language['language_id']] = $this->config->get('xd_onclose')['desktop_header'][$language['language_id']];
                } else {
                    // Set default values
                    if ($language_id == $this->config->get('config_language_id')) {
                        $data['xd_onclose']['desktop_header'][$language['language_id']] = $this->language->get('default_desktop_header');
                    }
                }
                if (isset($this->config->get('xd_onclose')['desktop_text'][$language['language_id']]) && $this->config->get('xd_onclose')['desktop_text'][$language['language_id']] != '') {
                    $data['xd_onclose']['desktop_text'][$language['language_id']] = $this->config->get('xd_onclose')['desktop_text'][$language['language_id']];
                } else {
                    // Set default values
                    if ($language_id == $this->config->get('config_language_id')) {
                        $data['xd_onclose']['desktop_text'][$language['language_id']] = $this->language->get('default_desktop_text');
                    }
                }
                if (isset($this->config->get('xd_onclose')['mobile_header'][$language['language_id']]) && $this->config->get('xd_onclose')['mobile_header'][$language['language_id']] != '') {
                    $data['xd_onclose']['mobile_header'][$language['language_id']] = $this->config->get('xd_onclose')['mobile_header'][$language['language_id']];
                } else {
                    // Set default values
                    if ($language_id == $this->config->get('config_language_id')) {
                        $data['xd_onclose']['mobile_header'][$language['language_id']] = $this->language->get('default_mobile_header');
                    }
                }
                if (isset($this->config->get('xd_onclose')['mobile_text'][$language['language_id']]) && $this->config->get('xd_onclose')['mobile_text'][$language['language_id']] != '') {
                    $data['xd_onclose']['mobile_text'][$language['language_id']] = $this->config->get('xd_onclose')['mobile_text'][$language['language_id']];
                } else {
                    // Set default values
                    if ($language_id == $this->config->get('config_language_id')) {
                        $data['xd_onclose']['mobile_text'][$language['language_id']] = $this->language->get('default_mobile_text');
                    }
                }
                if (isset($this->config->get('xd_onclose')['success_field'][$language['language_id']]) && $this->config->get('xd_onclose')['success_field'][$language['language_id']] != '') {
                    $data['xd_onclose']['success_field'][$language['language_id']] = $this->config->get('xd_onclose')['success_field'][$language['language_id']];
                } else {
                    // Set default values
                    if ($language_id == $this->config->get('config_language_id')) {
                        $data['xd_onclose']['success_field'][$language['language_id']] = $this->language->get('default_success_field');
                    }
                }
            }
        }



        // Set default values
        if (!isset($data['xd_onclose']['button_color']) || $data['xd_onclose']['button_color'] == '') {
            $data['xd_onclose']['button_color'] = '#003366';
        }
        if (!isset($data['xd_onclose']['button_position']) || $data['xd_onclose']['button_position'] == '') {
            $data['xd_onclose']['button_position'] = 'bottom_right';
        }
        if (!isset($data['xd_onclose']['spam_protection']) || $data['xd_onclose']['spam_protection'] == '') {
            $data['xd_onclose']['spam_protection'] = '0';
        }

        /********************* Captchas ********************************/
        $this->load->model('extension/extension');

        $data['captchas'] = array();

        // Get a list of installed captchas
        $extensions = $this->model_extension_extension->getInstalled('captcha');

        foreach ($extensions as $code) {
            $this->load->language('captcha/' . $code);

            if ($this->config->has($code . '_status')) {
                $data['captchas'][] = array(
                    'text'  => $this->language->get('heading_title'),
                    'value' => $code
                );
            }
        }

        /********************* Modal window fields *********************/
        if (isset($this->request->post['xd_onclose_field1_status'])) {
            $data['xd_onclose_field1_status'] = $this->request->post['xd_onclose_field1_status'];
        } else {
            $data['xd_onclose_field1_status'] = $this->config->get('xd_onclose_field1_status');
        }
        if (isset($this->request->post['xd_onclose_field1_required'])) {
            $data['xd_onclose_field1_required'] = $this->request->post['xd_onclose_field1_required'];
        } else {
            $data['xd_onclose_field1_required'] = $this->config->get('xd_onclose_field1_required');
        }
        if (isset($this->request->post['xd_onclose_field2_status'])) {
            $data['xd_onclose_field2_status'] = $this->request->post['xd_onclose_field2_status'];
        } else {
            $data['xd_onclose_field2_status'] = $this->config->get('xd_onclose_field2_status');
        }
        if (isset($this->request->post['xd_onclose_field2_required'])) {
            $data['xd_onclose_field2_required'] = $this->request->post['xd_onclose_field2_required'];
        } else {
            $data['xd_onclose_field2_required'] = $this->config->get('xd_onclose_field2_required');
        }
        if (isset($this->request->post['xd_onclose_field3_status'])) {
            $data['xd_onclose_field3_status'] = $this->request->post['xd_onclose_field3_status'];
        } else {
            $data['xd_onclose_field3_status'] = $this->config->get('xd_onclose_field3_status');
        }
        if (isset($this->request->post['xd_onclose_field3_required'])) {
            $data['xd_onclose_field3_required'] = $this->request->post['xd_onclose_field3_required'];
        } else {
            $data['xd_onclose_field3_required'] = $this->config->get('xd_onclose_field3_required');
        }

        if (isset($this->request->post['xd_onclose_agree_status'])) {
            $data['xd_onclose_agree_status'] = $this->request->post['xd_onclose_agree_status'];
        } else {
            $data['xd_onclose_agree_status'] = $this->config->get('xd_onclose_agree_status');
        }
        if (isset($this->request->post['xd_onclose_validation_type'])) {
            $data['xd_onclose_validation_type'] = $this->request->post['xd_onclose_validation_type'];
        } else {
            $data['xd_onclose_validation_type'] = $this->config->get('xd_onclose_validation_type');
        }
        /********************* STATUS *********************/
        if (isset($this->request->post['xd_onclose_status'])) {
            $data['xd_onclose_status'] = $this->request->post['xd_onclose_status'];
        } else {
            $data['xd_onclose_status'] = $this->config->get('xd_onclose_status');
        }
        /*
		if (isset($this->request->post['xd_onclose_style_status'])) {
			$data['xd_onclose_style_status'] = $this->request->post['xd_onclose_style_status'];
		} else {
			$data['xd_onclose_style_status'] = $this->config->get('xd_onclose_style_status');
		}
		*/
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('module/xd_onclose.tpl', $data));
    }
    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'module/xd_onclose')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        return !$this->error;
    }
}
