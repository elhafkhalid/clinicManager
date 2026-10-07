<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Départements | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- TOPBAR --%>
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
            <div>
                <h1 class="text-3xl font-extrabold text-gray-900">Départements</h1>
                <p class="text-gray-500 text-sm mt-1">Gérez les départements de la clinique.</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/departments/new"
               class="inline-flex items-center gap-2 bg-[#00A8E8] hover:bg-[#0090c9]
                      text-white font-bold px-5 py-3 transition-colors text-sm uppercase tracking-wider">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                </svg>
                Nouveau département
            </a>
        </div>

        <%-- MESSAGE DE SUCCÈS --%>
        <c:if test="${not empty sessionScope.success}">
            <div class="mb-6 bg-green-50 border-l-4 border-green-500 text-green-700 p-4" role="alert">
                <p class="text-sm font-medium"><c:out value="${sessionScope.success}"/></p>
            </div>
            <c:remove var="success" scope="session"/>
        </c:if>

        <%-- TABLEAU --%>
        <div class="bg-white shadow-md overflow-hidden">

            <c:choose>

                <%-- CAS 1 : Liste vide --%>
                <c:when test="${empty departments}">
                    <div class="p-12 text-center">
                        <div class="w-16 h-16 mx-auto bg-gray-100 flex items-center justify-center mb-4">
                            <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"/>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-1">Aucun département</h3>
                        <p class="text-sm text-gray-500 mb-6">Commencez par créer votre premier département.</p>
                        <a href="${pageContext.request.contextPath}/admin/departments/new"
                           class="inline-flex items-center gap-2 bg-[#00A8E8] hover:bg-[#0090c9]
                                  text-white font-bold px-5 py-3 transition-colors text-sm">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                            </svg>
                            Créer un département
                        </a>
                    </div>
                </c:when>

                <%-- CAS 2 : Liste avec des départements --%>
                <c:otherwise>
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b border-gray-100">
                            <tr>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider w-20">ID</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Nom</th>
                                <th class="text-right px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            <c:forEach items="${departments}" var="dep">
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-4 text-sm text-gray-500 font-mono">
                                        #<c:out value="${dep.id}"/>
                                    </td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-800">
                                        <c:out value="${dep.name}"/>
                                    </td>
                                    <td class="px-6 py-4 text-right space-x-3">
                                        <a href="${pageContext.request.contextPath}/admin/departments/edit?id=${dep.id}"
                                           class="text-sm font-bold text-[#00A8E8] hover:text-[#0090c9]">
                                            Modifier
                                        </a>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>

        </div>
    </main>
</body>
</html>