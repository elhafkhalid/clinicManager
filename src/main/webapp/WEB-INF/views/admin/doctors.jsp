<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Médecins | ClinicManager</title>
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
                <h1 class="text-3xl font-extrabold text-gray-900">Médecins</h1>
                <p class="text-gray-500 text-sm mt-1">Gérez les médecins de la clinique.</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/doctors/new"
               class="inline-flex items-center gap-2 bg-[#00A8E8] hover:bg-[#0090c9]
                      text-white font-bold px-5 py-3 transition-colors text-sm uppercase tracking-wider">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                </svg>
                Nouveau médecin
            </a>
        </div>

        <%-- MESSAGES --%>
        <c:if test="${not empty sessionScope.success}">
            <div class="mb-6 bg-green-50 border-l-4 border-green-500 text-green-700 p-4" role="alert">
                <p class="text-sm font-medium"><c:out value="${sessionScope.success}"/></p>
            </div>
            <c:remove var="success" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.error}">
            <div class="mb-6 bg-red-50 border-l-4 border-red-500 text-red-700 p-4" role="alert">
                <p class="text-sm font-medium"><c:out value="${sessionScope.error}"/></p>
            </div>
            <c:remove var="error" scope="session"/>
        </c:if>

        <%-- TABLEAU --%>
        <div class="bg-white shadow-md overflow-hidden">

            <c:choose>

                <%-- Vide --%>
                <c:when test="${empty doctors}">
                    <div class="p-12 text-center">
                        <div class="w-16 h-16 mx-auto bg-gray-100 flex items-center justify-center mb-4">
                            <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-1">Aucun médecin</h3>
                        <p class="text-sm text-gray-500 mb-6">Commencez par créer votre premier médecin.</p>
                        <a href="${pageContext.request.contextPath}/admin/doctors/new"
                           class="inline-flex items-center gap-2 bg-[#00A8E8] hover:bg-[#0090c9]
                                  text-white font-bold px-5 py-3 transition-colors text-sm">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                            </svg>
                            Créer un médecin
                        </a>
                    </div>
                </c:when>

                <%-- Rempli --%>
                <c:otherwise>
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b border-gray-100">
                            <tr>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Nom</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Matricule</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Titre</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Spécialité</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Statut</th>
                                <th class="text-right px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            <c:forEach items="${doctors}" var="doc">
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="w-9 h-9 rounded-full bg-[#00A8E8] text-white font-bold flex items-center justify-center flex-shrink-0 text-xs">
                                                ${doc.nom.substring(0,1).toUpperCase()}
                                            </div>
                                            <div>
                                                <p class="text-sm font-semibold text-gray-800">
                                                    <c:out value="${doc.nom}"/>
                                                </p>
                                                <p class="text-xs text-gray-500">
                                                    <c:out value="${doc.email}"/>
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 font-mono">
                                        <c:out value="${doc.matricule}"/>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600">
                                        <c:out value="${doc.titre}"/>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600">
                                        <span class="inline-flex items-center gap-1.5">
                                            <span class="w-2 h-2 rounded-full bg-[#00A8E8]"></span>
                                            <c:out value="${doc.specialty.name}"/>
                                        </span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${doc.enabled}">
                                                <span class="inline-flex px-3 py-1 text-xs font-bold bg-green-100 text-green-700 rounded-full">
                                                    Actif
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="inline-flex px-3 py-1 text-xs font-bold bg-red-100 text-red-700 rounded-full">
                                                    Inactif
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4 text-right space-x-3">
                                        <a href="${pageContext.request.contextPath}/admin/doctors/edit?id=${doc.id}"
                                           class="text-sm font-bold text-[#00A8E8] hover:text-[#0090c9]">
                                            Modifier
                                        </a>
                                        <c:if test="${doc.enabled}">
                                            <form method="post"
                                                  action="${pageContext.request.contextPath}/admin/doctors/desactiver"
                                                  class="inline"
                                                  onsubmit="return confirm('Désactiver ce médecin ?');">
                                                <input type="hidden" name="id" value="${doc.id}"/>
                                                <button type="submit"
                                                        class="text-sm font-bold text-red-600 hover:text-red-700">
                                                    Désactiver
                                                </button>
                                            </form>
                                        </c:if>
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