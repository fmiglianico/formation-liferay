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

<%@ include file="/html/portlet/loan_calculator/init.jsp" %>

<%
int loanAmount = ParamUtil.get(request, "loanAmount", 200000);
double interest = ParamUtil.get(request, "interest", 7.00);
int years = ParamUtil.get(request, "years", 30);
int paymentsPerYear = ParamUtil.get(request, "paymentsPerYear", 12);

double tempValue = Math.pow((1 + (interest / 100 / paymentsPerYear)), (years * paymentsPerYear));
double amountPerPayment = (loanAmount * tempValue * (interest / 100 / paymentsPerYear)) / (tempValue - 1);
double totalPaid = amountPerPayment * years * paymentsPerYear;
double interestPaid = totalPaid - loanAmount;

NumberFormat doubleFormat = NumberFormat.getNumberInstance(locale);

doubleFormat.setMaximumFractionDigits(2);
doubleFormat.setMinimumFractionDigits(2);

NumberFormat integerFormat = NumberFormat.getNumberInstance(locale);

integerFormat.setMaximumFractionDigits(0);
integerFormat.setMinimumFractionDigits(0);
%>

<form action="<liferay-portlet:renderURL windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"><portlet:param name="struts_action" value="/loan_calculator/view" /></liferay-portlet:renderURL>" id="<portlet:namespace />fm" method="post" name="<portlet:namespace />fm">

<table class="lfr-table">
<tr>
	<td>
		<liferay-ui:message key="loan-amount" />
	</td>
	<td>
		<input name="<portlet:namespace />loanAmount" size="5" type="text" value="<%= integerFormat.format(loanAmount) %>" />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="interest-rate" />
	</td>
	<td>
		<input name="<portlet:namespace />interest" size="5" type="text" value="<%= doubleFormat.format(interest) %>" />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="years" />
	</td>
	<td>
		<input name="<portlet:namespace />years" size="5" type="text" value="<%= years %>" />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="monthly-payment" />
	</td>
	<td>
		<strong><%= integerFormat.format(amountPerPayment) %></strong>
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="interest-paid" />
	</td>
	<td>
		<strong><%= integerFormat.format(interestPaid) %></strong>
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="total-paid" />
	</td>
	<td>
		<strong><%= integerFormat.format(totalPaid) %></strong>
	</td>
</tr>
</table>

<br />

<input type="submit" value="<liferay-ui:message key="calculate" />" />

</form>

<c:if test="<%= windowState.equals(WindowState.MAXIMIZED) %>">
	<aui:script>
		Liferay.Util.focusFormField(document.<portlet:namespace />fm.<portlet:namespace />loanAmount);
	</aui:script>
</c:if>

<aui:script use="aui-io-request,aui-parse-content">
	var form = A.one('#<portlet:namespace />fm');
	var parentNode = form.get('parentNode');

	parentNode.plug(A.Plugin.ParseContent);

	form.on(
		'submit',
		function(event) {
			var uri = form.getAttribute('action');

			A.io.request(
				uri,
				{
					form: {
						id: form
					},
					on: {
						success: function(event, id, obj) {
							var responseData = this.get('responseData');

							parentNode.setContent(responseData);
						}
					}
				}
			);

			event.halt();
		}
	);
</aui:script>