<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h1>
    Chiffre d'affaire :
    <fmt:formatNumber value="${chiffre}" type="number" groupingUsed="true" maxFractionDigits="0"/>
</h1>
