ccmValidateBlockForm = function() {
	
	if ($('#field_2_textbox_text').val() == '') {
		ccm_addError('Missing required text: Service Link (For example: retirement-planning)');
	}

	if ($('#field_3_textbox_text').val() == '') {
		ccm_addError('Missing required text: Service Title (For example: "Retirement Planning")');
	}

	if ($('#field_4_textbox_text').val() == '') {
		ccm_addError('Missing required text: Service Link (Repeated)');
	}

	if ($('select[name=field_8_select_value]').val() == '' || $('select[name=field_8_select_value]').val() == 0) {
		ccm_addError('Missing required selection: Embedded content area?');
	}


	return false;
}
