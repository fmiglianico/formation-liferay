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

<%@ include file="/html/portlet/shopping/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

ShoppingItem item = (ShoppingItem)request.getAttribute(WebKeys.SHOPPING_ITEM);

item = item.toEscapedModel();

ShoppingItemField[] itemFields = (ShoppingItemField[])ShoppingItemFieldLocalServiceUtil.getItemFields(item.getItemId()).toArray(new ShoppingItemField[0]);
ShoppingItemPrice[] itemPrices = (ShoppingItemPrice[])ShoppingItemPriceLocalServiceUtil.getItemPrices(item.getItemId()).toArray(new ShoppingItemPrice[0]);

String orderByCol = portalPreferences.getValue(PortletKeys.SHOPPING, "items-order-by-col", "sku");
String orderByType = portalPreferences.getValue(PortletKeys.SHOPPING, "items-order-by-type", "asc");

OrderByComparator orderByComparator = ShoppingUtil.getItemOrderByComparator(orderByCol, orderByType);

ShoppingItem[] prevAndNext = ShoppingItemServiceUtil.getItemsPrevAndNext(item.getItemId(), orderByComparator);
%>

<portlet:actionURL var="cartURL">
	<portlet:param name="struts_action" value="/shopping/cart" />
</portlet:actionURL>

<portlet:renderURL var="redirectURL">
	<portlet:param name="struts_action" value="/shopping/cart" />
	<portlet:param name="redirect" value="<%= currentURL %>" />
</portlet:renderURL>

<aui:form action="<%= cartURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.ADD %>" />
	<aui:input name="redirect" type="hidden" value="<%= redirectURL %>" />
	<aui:input name="itemId" type="hidden" value="<%= item.getItemId() %>" />
	<aui:input name="fields" type="hidden" />

	<liferay-ui:header
		backURL="<%= redirect %>"
		title="item"
	/>

	<div class="breadcrumbs">
		<%= ShoppingUtil.getBreadcrumbs(item.getCategoryId(), pageContext, renderRequest, renderResponse) %>
	</div>

	<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="lfr-top">
			<strong><%= item.getSku() %></strong>

			<br /><br />

			<c:if test="<%= item.isMediumImage() %>">
				<img alt="<liferay-ui:message key="image" />" src='<%= Validator.isNotNull(item.getMediumImageURL()) ? item.getMediumImageURL() : themeDisplay.getPathImage() + "/shopping/item?img_id=" + item.getMediumImageId() + "&t=" + WebServerServletTokenUtil.getToken(item.getMediumImageId()) %>' vspace="0" />
			</c:if>

			<c:if test="<%= item.isLargeImage() %>">
				<br />

				<aui:a href='<%= Validator.isNotNull(item.getLargeImageURL()) ? item.getLargeImageURL() : themeDisplay.getPathImage() + "/shopping/item?img_id=" + item.getLargeImageId() + "&t=" + WebServerServletTokenUtil.getToken(item.getLargeImageId()) %>' style="font-size: xx-small;" target="_blank"><liferay-ui:message key="see-large-photo" /></aui:a>
			</c:if>
		</td>
		<td style="padding-left: 30px;"></td>
		<td class="lfr-top">
			<span style="font-size: small;">
			<strong><%= item.getName() %></strong><br />
			</span>

			<c:if test="<%= Validator.isNotNull(item.getDescription()) %>">
				<br />

				<%= item.getDescription() %>
			</c:if>

			<%
			Properties props = new OrderedProperties();

			PropertiesUtil.load(props, item.getProperties());

			Enumeration enu = props.propertyNames();

			while (enu.hasMoreElements()) {
				String propsKey = (String)enu.nextElement();
				String propsValue = props.getProperty(propsKey, StringPool.BLANK);
			%>

				<br />

				<%= propsKey %>: <%= propsValue %>

			<%
			}
			%>

			<br /><br />

			<%
			for (int i = 0; i < itemPrices.length; i++) {
				ShoppingItemPrice itemPrice = itemPrices[i];

				if (itemPrice.getStatus() == ShoppingItemPriceConstants.STATUS_INACTIVE) {
					continue;
				}
			%>

				<c:choose>
					<c:when test="<%= (itemPrice.getMinQuantity()) == 0 && (itemPrice.getMaxQuantity() == 0) %>">
						<liferay-ui:message key="price" />:
					</c:when>
					<c:when test="<%= itemPrice.getMaxQuantity() != 0 %>">
						<liferay-ui:message arguments='<%= new Object[] {"<strong>" + itemPrice.getMinQuantity() + "</strong>", "<strong>" + itemPrice.getMaxQuantity() + "</strong>"} %>' key="price-for-x-to-x-items" translateArguments="<%= false %>" />
					</c:when>
					<c:when test="<%= itemPrice.getMaxQuantity() == 0 %>">
						<liferay-ui:message arguments='<%= "<strong>" + itemPrice.getMinQuantity() + "</strong>" %>' key="price-for-x-items-and-above" translateArguments="<%= false %>" />
					</c:when>
				</c:choose>

				<c:if test="<%= itemPrice.getDiscount() <= 0 %>">
					<%= currencyFormat.format(itemPrice.getPrice()) %><br />
				</c:if>

				<c:if test="<%= itemPrice.getDiscount() > 0 %>">
					<strike><%= currencyFormat.format(itemPrice.getPrice()) %></strike> <div class="portlet-msg-success"><%= currencyFormat.format(ShoppingUtil.calculateActualPrice(itemPrice)) %></div> / <liferay-ui:message key="you-save" />: <div class="portlet-msg-error"><%= currencyFormat.format(ShoppingUtil.calculateDiscountPrice(itemPrice)) %> (<%= percentFormat.format(itemPrice.getDiscount()) %>)</div><br />
				</c:if>

			<%
			}
			%>

			<br />

			<c:if test="<%= PrefsPropsUtil.getBoolean(company.getCompanyId(), PropsKeys.SHOPPING_ITEM_SHOW_AVAILABILITY) %>">
				<c:choose>
					<c:when test="<%= ShoppingUtil.isInStock(item) %>">
						<liferay-ui:message key="availability" />: <div class="portlet-msg-success"><liferay-ui:message key="in-stock" /></div><br />
					</c:when>
					<c:otherwise>
						<liferay-ui:message key="availability" />: <div class="portlet-msg-error"><liferay-ui:message key="out-of-stock" /></div><br />
					</c:otherwise>
				</c:choose>

				<br />
			</c:if>

			<%
			for (int i = 0; i < itemFields.length; i++) {
				ShoppingItemField itemField = itemFields[i];

				String fieldName = itemField.getName();
				String[] fieldValues = itemField.getValuesArray();
				String fieldDescription = itemField.getDescription();
			%>

				<aui:fieldset>
					<aui:select label="<%= fieldName %>" name='<%= "fieldName" + fieldName %>'>
						<aui:option label="select-option" value="" />

						<%
						for (int j = 0; j < fieldValues.length; j++) {
						%>

							<aui:option label="<%= fieldValues[j] %>" />

						<%
						}
						%>

					</aui:select>

					<c:if test="<%= Validator.isNotNull(fieldDescription) %>">
						<%= fieldDescription %>
					</c:if>
				</aui:fieldset>

			<%
			}
			%>

			<aui:button onClick='<%= renderResponse.getNamespace() + "addToCart();" %>' value="add-to-shopping-cart" />

			<aui:button-row>
				<c:if test="<%= (prevAndNext[0] != null) || (prevAndNext[2] != null) %>">
					<c:if test="<%= prevAndNext[0] != null %>">
						<portlet:renderURL var="viewPreviousPageURL">
							<portlet:param name="struts_action" value="/shopping/view_item" />
							<portlet:param name="itemId" value="<%= String.valueOf(prevAndNext[0].getItemId()) %>" />
						</portlet:renderURL>

						<aui:button href="<%= viewPreviousPageURL %>" value="previous" />
					</c:if>

					<c:if test="<%= prevAndNext[2] != null %>">
						<portlet:renderURL var="viewNextPageURL">
							<portlet:param name="struts_action" value="/shopping/view_item" />
							<portlet:param name="itemId" value="<%= String.valueOf(prevAndNext[2].getItemId()) %>" />
						</portlet:renderURL>

						<aui:button href="<%= viewNextPageURL %>" value="next" />
					</c:if>
				</c:if>
			</aui:button-row>
		</td>
	</tr>
	</table>
</aui:form>

<aui:script>
	function <portlet:namespace />addToCart() {
		document.<portlet:namespace />fm.<portlet:namespace />fields.value = "";

		<%
		for (int i = 0; i < itemFields.length; i++) {
			ShoppingItemField itemField = itemFields[i];

			String fieldName = itemField.getName();
			String[] fieldValues = itemField.getValuesArray();
		%>

			if (document.<portlet:namespace />fm.<portlet:namespace />fieldName<%= fieldName %>.value == "") {
				alert("<%= UnicodeLanguageUtil.get(pageContext, "please-select-all-options") %>");

				return;
			}

			document.<portlet:namespace />fm.<portlet:namespace />fields.value = document.<portlet:namespace />fm.<portlet:namespace />fields.value + '<%= fieldName %>=' + document.<portlet:namespace />fm.<portlet:namespace />fieldName<%= fieldName %>.value + '&';

		<%
		}
		%>

		submitForm(document.<portlet:namespace />fm);
	}
</aui:script>