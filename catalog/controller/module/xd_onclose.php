<?php
class ControllerModuleXDOnclose extends Controller
{
    private $error = array();

    private $field1_status = null;
    private $field2_status = null;
    private $field3_status = null;
    private $phone_validation_type = null;
    private $captcha = null;
    private $spam_protection = null;
    private $exan_status = null;

    public function index()
    {
        $data = [];
        $xd_onclose_setting = $this->config->get('xd_onclose');
        $data['status'] = false;
        if ($xd_onclose_setting) {
            $data['status'] = boolval($xd_onclose_setting['module_xd_onclose_status']);
            if ($data['status']) {
                // Get language data
                $this->load->language('module/xd_onclose');
                $data['modal_title'] = $this->language->get('modal_title');
                $data['required_text'] = $this->language->get('required_text');
                $data['error_required'] = $this->language->get('error_required');
                $data['error_sending'] = $this->language->get('error_sending');
                $data['submit_button'] = $this->language->get('submit_button');

                $current_language_id = $this->config->get('config_language_id');
                $data['desktop_header'] = (isset($xd_onclose_setting['desktop_header'][$current_language_id])) ? $xd_onclose_setting['desktop_header'][$current_language_id] : '';
                if ($data['desktop_header'] == '') {
                    $data['desktop_header'] = $this->language->get('desktop_header');
                }
                $data['desktop_text'] = (isset($xd_onclose_setting['desktop_text'][$current_language_id])) ? html_entity_decode($xd_onclose_setting['desktop_text'][$current_language_id], ENT_QUOTES, 'UTF-8') : '';
                if ($data['desktop_text'] == '') {
                    $data['desktop_text'] = $this->language->get('desktop_text');
                }
                $data['mobile_header'] = (isset($xd_onclose_setting['mobile_header'][$current_language_id])) ? $xd_onclose_setting['mobile_header'][$current_language_id] : '';
                if ($data['mobile_header'] == '') {
                    $data['mobile_header'] = $this->language->get('mobile_header');
                }
                $data['mobile_text'] = (isset($xd_onclose_setting['mobile_text'][$current_language_id])) ? html_entity_decode($xd_onclose_setting['mobile_text'][$current_language_id], ENT_QUOTES, 'UTF-8') : '';
                if ($data['mobile_text'] == '') {
                    $data['mobile_text'] = $this->language->get('mobile_text');
                }
                $data['success_field'] = (isset($xd_onclose_setting['success_field'][$current_language_id])) ? html_entity_decode($xd_onclose_setting['success_field'][$current_language_id], ENT_QUOTES, 'UTF-8') : '';
                if ($data['success_field'] == '') {
                    $data['success_field'] = $this->language->get('success_field');
                }

                // Fields
                $data['field1_status'] = intval($xd_onclose_setting['field1_status']); // Name status
                $this->field1_status = $data['field1_status'];
                $data['field1_title'] = $this->language->get('field1_title'); // Name title
                $data['field2_status'] = intval($xd_onclose_setting['field2_status']); // Phone status
                $this->field2_status = $data['field2_status'];
                $data['field2_title'] = $this->language->get('field2_title'); // Phone title
                $data['field3_status'] = intval($xd_onclose_setting['field3_status']); // Message status
                $this->field3_status = $data['field3_status'];
                $data['field3_title'] = $this->language->get('field3_title'); // Message title

                // Captcha
                $data['captcha'] = (isset($xd_onclose_setting['captcha'])) ? $xd_onclose_setting['captcha'] : 0; // Captcha
                $this->captcha = $data['captcha'];
                $data['captcha_class'] = $xd_onclose_setting['captcha'];
                if ($this->config->get($data['captcha'] . '_status')) {
                    $data['captcha'] = $this->load->controller('captcha/' . $data['captcha'], $this->error);
                }

                // Agreement
                $data['agree_status'] = (isset($xd_onclose_setting['agree_status'])) ? intval($xd_onclose_setting['agree_status']) : 0;
                if ($data['agree_status'] !== 0) {
                    $this->load->model('catalog/information');
                    $information_info = $this->model_catalog_information->getInformation($data['agree_status']);
                    if ($information_info) {
                        $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information', 'information_id=' . $data['agree_status'], 'SSL'), $information_info['title']);
                    } else {
                        $data['text_agree'] = '';
                    }
                }

                $data['spam_protection'] = (isset($xd_onclose_setting['spam_protection'])) ? boolval($xd_onclose_setting['spam_protection']) : false;
                $this->spam_protection = $data['spam_protection'];
                $data['validation_type'] = (isset($xd_onclose_setting['validation_type'])) ? $xd_onclose_setting['validation_type'] : 0;
                $this->phone_validation_type = $data['validation_type'];

                // Success
                $data['success_type'] = (isset($xd_onclose_setting['success_type'])) ? $xd_onclose_setting['success_type'] : 0;
                $data['success_utm'] = (isset($xd_onclose_setting['success_utm'])) ? 'utm_source=' . trim($xd_onclose_setting['success_utm']) : '';

                // Cookie
                $data['cookie_days'] = (isset($xd_onclose_setting['cookie_days'])) ? intval($xd_onclose_setting['cookie_days']) : 0;
                $data['cookie_days'] = $data['cookie_days'] * 24 * 60 * 60;
                $data['mobile_seconds'] = (isset($xd_onclose_setting['mobile_seconds'])) ? intval($xd_onclose_setting['mobile_seconds']) : 0;
                $data['mobile_seconds'] = $data['mobile_seconds'] * 1000;

                // Styles
                $data['modal_style'] = (isset($xd_onclose_setting['modal_style'])) ? $xd_onclose_setting['modal_style'] : 'default';

                // Analytics
                $data['exan_status'] = (isset($xd_onclose_setting['exan_status'])) ? boolval($xd_onclose_setting['exan_status']) : false;
                $this->exan_status = $data['exan_status'];
            }
        }
        return $this->load->view('default/template/module/xd_onclose.tpl', $data);
    }

    public function submit()
    {
        if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {

            $xd_onclose_setting = $this->config->get('xd_onclose');
            $this->load->language('module/xd_onclose');
            $json = array();
            $mail_text = '';

            $json['data'] = $this->request->post;

            if (isset($this->request->post['xd_onclose_name'])) {
                $xd_onclose_name = $this->request->post['xd_onclose_name'];
                $mail_text .= $this->language->get('text_name') . $xd_onclose_name . " \r\n";
            }

            if (isset($this->request->post['xd_onclose_phone'])) {
                $xd_onclose_phone = $this->request->post['xd_onclose_phone'];
                $mail_text .= $this->language->get('text_phone') . $xd_onclose_phone . " \r\n";
            }

            if (isset($this->request->post['xd_onclose_message'])) {
                $xd_onclose_message = $this->request->post['xd_onclose_message'];
                $mail_text .= $this->language->get('text_message') . $xd_onclose_message . " \r\n";
            }

            $mail_text .= " \r\n";

            // Private data
            $mail_text .= " \r\n" . $this->language->get('xd_onclose_sb_private_title') . " \r\n";
            if (!empty($this->request->server['REMOTE_ADDR'])) {
                $ip = $this->request->server['REMOTE_ADDR'];
                $mail_text .= $this->language->get('text_ip') . $ip . " \r\n";
            }

            if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                $forwarded_ip = $this->request->server['HTTP_X_FORWARDED_FOR'];
                $mail_text .= $this->language->get('text_forwarded_ip') . $forwarded_ip . " \r\n";
            } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                $forwarded_ip = $this->request->server['HTTP_CLIENT_IP'];
                $mail_text .= $this->language->get('text_forwarded_ip') . $forwarded_ip . " \r\n";
            }

            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                $user_agent = $this->request->server['HTTP_USER_AGENT'];
                $mail_text .= $this->language->get('text_user_agent') . $user_agent . " \r\n";
            }

            $data['exan_status'] = (isset($xd_onclose_setting['exan_status'])) ? boolval($xd_onclose_setting['exan_status']) : false;
            $this->exan_status = $data['exan_status'];
            if ($this->exan_status) {
                if (isset($this->request->post['xd_onclose_sb_udata_vst']) && $this->request->post['xd_onclose_sb_udata_vst'] != '') {
                    $xd_onclose_sb_udata_vst = $this->request->post['xd_onclose_sb_udata_vst'];
                    $mail_text .= $this->language->get('xd_onclose_sb_udata_vst') . $xd_onclose_sb_udata_vst . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_promo_code']) && $this->request->post['xd_onclose_sb_promo_code'] != '' && $this->request->post['xd_onclose_sb_promo_code'] != 'undefined') {
                    $xd_onclose_sb_promo_code = $this->request->post['xd_onclose_sb_promo_code'];
                    $mail_text .= $this->language->get('xd_onclose_sb_promo_code') . $xd_onclose_sb_promo_code . " \r\n";
                }
                // Private data end

                // Source first visit
                $mail_text .= " \r\n" . $this->language->get('xd_onclose_sb_first_visit_title') . " \r\n";
                if (isset($this->request->post['xd_onclose_sb_first_typ']) && $this->request->post['xd_onclose_sb_first_typ'] != '') {
                    $xd_onclose_sb_first_typ = $this->request->post['xd_onclose_sb_first_typ'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_typ') . $xd_onclose_sb_first_typ . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_src']) && $this->request->post['xd_onclose_sb_first_src'] != '') {
                    $xd_onclose_sb_first_src = $this->request->post['xd_onclose_sb_first_src'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_src') . $xd_onclose_sb_first_src . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_mdm']) && $this->request->post['xd_onclose_sb_first_mdm'] != '') {
                    $xd_onclose_sb_first_mdm = $this->request->post['xd_onclose_sb_first_mdm'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_mdm') . $xd_onclose_sb_first_mdm . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_cmp']) && $this->request->post['xd_onclose_sb_first_cmp'] != '') {
                    $xd_onclose_sb_first_cmp = $this->request->post['xd_onclose_sb_first_cmp'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_cmp') . $xd_onclose_sb_first_cmp . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_cnt']) && $this->request->post['xd_onclose_sb_first_cnt'] != '') {
                    $xd_onclose_sb_first_cnt = $this->request->post['xd_onclose_sb_first_cnt'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_cnt') . $xd_onclose_sb_first_cnt . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_trm']) && $this->request->post['xd_onclose_sb_first_trm'] != '') {
                    $xd_onclose_sb_first_trm = $this->request->post['xd_onclose_sb_first_trm'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_trm') . $xd_onclose_sb_first_trm . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_add_fd']) && $this->request->post['xd_onclose_sb_first_add_fd'] != '') {
                    $xd_onclose_sb_first_add_fd = $this->request->post['xd_onclose_sb_first_add_fd'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_add_fd') . $xd_onclose_sb_first_add_fd . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_add_ep']) && $this->request->post['xd_onclose_sb_first_add_ep'] != '') {
                    $xd_onclose_sb_first_add_ep = $this->request->post['xd_onclose_sb_first_add_ep'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_add_ep') . $xd_onclose_sb_first_add_ep . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_first_add_rf']) && $this->request->post['xd_onclose_sb_first_add_rf'] != '') {
                    $xd_onclose_sb_first_add_rf = $this->request->post['xd_onclose_sb_first_add_rf'];
                    $mail_text .= $this->language->get('xd_onclose_sb_first_add_rf') . $xd_onclose_sb_first_add_rf . " \r\n";
                }
                // Source first visit end

                // Source current visit
                $mail_text .= " \r\n" . $this->language->get('xd_onclose_sb_current_visit_title') . " \r\n";
                if (isset($this->request->post['xd_onclose_sb_current_typ']) && $this->request->post['xd_onclose_sb_current_typ'] != '') {
                    $xd_onclose_sb_current_typ = $this->request->post['xd_onclose_sb_current_typ'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_typ') . $xd_onclose_sb_current_typ . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_src']) && $this->request->post['xd_onclose_sb_current_src'] != '') {
                    $xd_onclose_sb_current_src = $this->request->post['xd_onclose_sb_current_src'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_src') . $xd_onclose_sb_current_src . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_mdm']) && $this->request->post['xd_onclose_sb_current_mdm'] != '') {
                    $xd_onclose_sb_current_mdm = $this->request->post['xd_onclose_sb_current_mdm'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_mdm') . $xd_onclose_sb_current_mdm . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_cmp']) && $this->request->post['xd_onclose_sb_current_cmp'] != '') {
                    $xd_onclose_sb_current_cmp = $this->request->post['xd_onclose_sb_current_cmp'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_cmp') . $xd_onclose_sb_current_cmp . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_cnt']) && $this->request->post['xd_onclose_sb_current_cnt'] != '') {
                    $xd_onclose_sb_current_cnt = $this->request->post['xd_onclose_sb_current_cnt'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_cnt') . $xd_onclose_sb_current_cnt . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_trm']) && $this->request->post['xd_onclose_sb_current_trm'] != '') {
                    $xd_onclose_sb_current_trm = $this->request->post['xd_onclose_sb_current_trm'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_trm') . $xd_onclose_sb_current_trm . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_add_fd']) && $this->request->post['xd_onclose_sb_current_add_fd'] != '') {
                    $xd_onclose_sb_current_add_fd = $this->request->post['xd_onclose_sb_current_add_fd'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_add_fd') . $xd_onclose_sb_current_add_fd . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_add_ep']) && $this->request->post['xd_onclose_sb_current_add_ep'] != '') {
                    $xd_onclose_sb_current_add_ep = $this->request->post['xd_onclose_sb_current_add_ep'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_add_ep') . $xd_onclose_sb_current_add_ep . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_current_add_rf']) && $this->request->post['xd_onclose_sb_current_add_rf'] != '') {
                    $xd_onclose_sb_current_add_rf = $this->request->post['xd_onclose_sb_current_add_rf'];
                    $mail_text .= $this->language->get('xd_onclose_sb_current_add_rf') . $xd_onclose_sb_current_add_rf . " \r\n";
                }
                // Source current visit end

                // Current session
                $mail_text .= " \r\n" . $this->language->get('xd_onclose_sb_session_title') . " \r\n";
                if (isset($this->request->post['xd_onclose_sb_session_pgs']) && $this->request->post['xd_onclose_sb_session_pgs'] != '') {
                    $xd_onclose_sb_session_pgs = $this->request->post['xd_onclose_sb_session_pgs'];
                    $mail_text .= $this->language->get('xd_onclose_sb_session_pgs') . $xd_onclose_sb_session_pgs . " \r\n";
                }
                if (isset($this->request->post['xd_onclose_sb_session_cpg']) && $this->request->post['xd_onclose_sb_session_cpg'] != '') {
                    $xd_onclose_sb_session_cpg = $this->request->post['xd_onclose_sb_session_cpg'];
                    $mail_text .= $this->language->get('xd_onclose_sb_session_cpg') . $xd_onclose_sb_session_cpg . " \r\n";
                }
                // Current session end
            }

            $from_email = 'xd_onclose@' . $_SERVER['SERVER_NAME'];
            $sender_name = $this->config->get('config_name');
            $mail_title = sprintf($this->language->get('text_mail_title'), $this->config->get('config_name'));

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            // $mail->setTo('domus159@gmail.com');
            $mail->setFrom($from_email);
            $mail->setSender($sender_name);
            $mail->setSubject($mail_title);
            $mail->setText($mail_text);
            $mail_result = $mail->send();

            if (!$mail_result) {
                $json['success'] = 'Success sending';
                // Success
                $data['success_type'] = (isset($xd_onclose_setting['success_type'])) ? intval($xd_onclose_setting['success_type']) : 0;
                $data['success_utm'] = (isset($xd_onclose_setting['success_utm']) && trim($xd_onclose_setting['success_utm']) !== '') ? 'utm_source=' . trim($xd_onclose_setting['success_utm']) : '';
                if ($data['success_type'] === 1 && $data['success_utm'] !== '') {
                    $json['redirect'] = $this->url->link('checkout/success', 'utm_source=' . $data['success_utm'], 'SSL');
                } else if ($data['success_type'] === 1) {
                    $json['redirect'] = $this->url->link('checkout/success', '', 'SSL');
                }
            } else {
                $json['error'] = 'Error sending';
            }
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            $json['error'] = $this->error;
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        }
    }

    protected function validate()
    {
        $xd_onclose_setting = $this->config->get('xd_onclose');
        $this->load->language('module/xd_onclose');

        // Validate spam protection
        $this->spam_protection = boolval($xd_onclose_setting['spam_protection']);
        if ($this->spam_protection && (strlen(trim($this->request->post['xd_onclose_email'])) > 0 || strlen(trim($this->request->post['xd_onclose_surname'])) > 0)) {
            $this->error['message'] = $this->language->get('spam_protection');
            $this->error['input'] = 'spam_protection';
            return false;
        }

        // Validate name
        $this->field1_status = intval($xd_onclose_setting['field1_status']);
        if ($this->field1_status === 2) {
            if (strlen($this->request->post['xd_onclose_name']) < 1 || strlen($this->request->post['xd_onclose_name']) > 64) {
                $this->error['message'] = $this->language->get('error_name');
                $this->error['input'] = 'xd_onclose_name';
                return false;
            }
        }

        // Validate phone number
        $this->field2_status = intval($xd_onclose_setting['field2_status']);
        if ($this->field2_status === 2) {
            $min_length = 9;
            $max_length = 20;
            $this->phone_validation_type = $xd_onclose_setting['validation_type'];
            if ($this->phone_validation_type) {
                $min_length = utf8_strlen($this->phone_validation_type);
                $max_length = utf8_strlen($this->phone_validation_type);
            }
            if ((utf8_strlen($this->request->post['xd_onclose_phone']) < $min_length) || (utf8_strlen($this->request->post['xd_onclose_phone']) > $max_length)) {
                $this->error['message'] = $this->language->get('error_phone');
                $this->error['input'] = 'xd_onclose_phone';
                return false;
            }

            $phone_number_validation_regex = "/^\\+?\\d{1,4}?[-.\\s]?\\(?\\d{1,3}?\\)?[-.\\s]?\\d{1,4}[-.\\s]?\\d{1,4}[-.\\s]?\\d{1,9}$/";
            if (!preg_match($phone_number_validation_regex, $this->request->post['xd_onclose_phone'])) {
                $this->error['message'] = $this->language->get('error_phone');
                $this->error['input'] = 'xd_onclose_phone';
                return false;
            }
        }

        // Validate message
        $this->field3_status = intval($xd_onclose_setting['field3_status']);
        if ($this->field3_status === 2) {
            if (strlen($this->request->post['xd_onclose_message']) < 1 || strlen($this->request->post['xd_onclose_message']) > 9000) {
                $this->error['message'] = $this->language->get('error_message');
                $this->error['input'] = 'xd_onclose_message';
                return false;
            }
        }

        // Captcha
        $data['captcha'] = (isset($xd_onclose_setting['captcha'])) ? $xd_onclose_setting['captcha'] : 0; // Captcha
        $this->captcha = $data['captcha'];
        if ($this->captcha && $this->config->get($this->captcha . '_status')) {
            $captcha = $this->load->controller('captcha/' . $this->captcha . '/validate');
            if ($captcha) {
                $this->error['message'] = $this->language->get('error_captcha');
                $this->error['input'] = 'xd_onclose_captcha';
                return false;
            }
        }

        return !$this->error;
    }
}
