<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/taglib/ui/search_toggle/init.jsp" %>

		<c:if test="<%= Validator.isNotNull(buttonLabel) %>">
			<aui:button type="submit" value="<%= buttonLabel %>" />
		</c:if>

		<div class="<%= id %>toggle-link">
			<aui:a href="javascript:;" tabindex="-1">&laquo; <liferay-ui:message key="basic" /></aui:a>
		</div>
	</div>
</div>

<aui:script>
	var <%= id %>curClickValue = '<%= clickValue %>';
</aui:script>

<aui:script use="aui-io-request">
	var basicForm = A.one('#<%= id %>basic');
	var advancedForm = A.one('#<%= id %>advanced');

	var basicControls = basicForm.all('input:not(:submit), select');
	var advancedControls = advancedForm.all('input:not(:submit), select');

	if (<%= id %>curClickValue == 'basic') {
		advancedControls.attr('disabled', 'disabled');
	}
	else {
		basicControls.attr('disabled', 'disabled');
	}

	A.all('.<%= id %>toggle-link a').on(
		'click',
		function() {
			basicForm.toggle();
			advancedForm.toggle();

			var advancedSearchObj = A.one('#<%= namespace %><%= id %><%= displayTerms.ADVANCED_SEARCH %>');

			if (<%= id %>curClickValue == 'basic') {
				<%= id %>curClickValue = 'advanced';

				advancedSearchObj.val(true);

				basicControls.attr('disabled', 'disabled');
				advancedControls.attr('disabled', '');
			}
			else {
				<%= id %>curClickValue = 'basic';

				advancedSearchObj.val(false);

				basicControls.attr('disabled', '');
				advancedControls.attr('disabled', 'disabled');
			}

			A.io.request(
				'<%= themeDisplay.getPathMain() %>/portal/session_click',
				{
					data: {
						'<%= id %>': <%= id %>curClickValue
					}
				}
			);
		}
	);
</aui:script>