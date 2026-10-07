<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes disponibilités | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/doctor-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- TOPBAR --%>
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
            <div>
                <h1 class="text-3xl font-extrabold text-gray-900">Mes disponibilités</h1>
                <p class="text-gray-500 text-sm mt-1">Gérez vos horaires de travail hebdomadaires.</p>
            </div>
            <a href="${pageContext.request.contextPath}/doctor/availabilities/new"
               class="inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-600
                      text-white font-bold px-5 py-3 transition-colors text-sm uppercase tracking-wider">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                </svg>
                Ajouter une disponibilité
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

                <%-- Cas : aucune dispo --%>
                <c:when test="${empty availabilities}">
                    <div class="p-12 text-center">
                        <div class="w-16 h-16 mx-auto bg-gray-100 flex items-center justify-center mb-4">
                            <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-1">Aucune disponibilité</h3>
                        <p class="text-sm text-gray-500 mb-6">Ajoutez vos horaires de travail pour permettre à vos patients de prendre rendez-vous.</p>
                        <a href="${pageContext.request.contextPath}/doctor/availabilities/new"
                           class="inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-600
                                  text-white font-bold px-5 py-3 transition-colors text-sm">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                            </svg>
                            Ajouter ma première disponibilité
                        </a>
                    </div>
                </c:when>

                <%-- Cas : liste --%>
                <c:otherwise>
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b border-gray-100">
                            <tr>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Jour</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Heure début</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Heure fin</th>
                                <th class="text-right px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            <c:forEach items="${availabilities}" var="a">
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-4">
                                        <span class="inline-flex items-center gap-2">
                                            <span class="w-2 h-2 rounded-full bg-emerald-500"></span>
                                            <span class="text-sm font-semibold text-gray-800">
                                                <c:out value="${a.jour}"/>
                                            </span>
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 font-mono">
                                        <c:out value="${a.heureDebut}"/>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 font-mono">
                                        <c:out value="${a.heureFin}"/>
                                    </td>
                                    <td class="px-6 py-4 text-right space-x-3">
                                        <a href="${pageContext.request.contextPath}/doctor/availabilities/edit?id=${a.id}"
                                           class="text-sm font-bold text-emerald-600 hover:text-emerald-700">
                                            Modifier
                                        </a>
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/doctor/availabilities/delete"
                                              class="inline"
                                              onsubmit="return confirm('Supprimer cette disponibilité ?');">
                                            <input type="hidden" name="id" value="${a.id}"/>
                                            <button type="submit"
                                                    class="text-sm font-bold text-red-600 hover:text-red-700">
                                                Supprimer
                                            </button>
                                        </form>
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