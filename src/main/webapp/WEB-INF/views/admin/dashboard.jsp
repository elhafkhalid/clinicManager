<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord Admin | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- ============ TOPBAR ============ --%>
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
            <div>
                <h1 class="text-3xl font-extrabold text-gray-900">Tableau de bord</h1>
                <p class="text-gray-500 text-sm mt-1">
                    Bienvenue, <span class="font-semibold text-gray-700"><c:out value="${sessionScope.userNom}"/></span>
                </p>
            </div>
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-500">Lundi, 5 Octobre 2026</span>
                <div class="w-10 h-10 rounded-full bg-[#00A8E8] text-white font-bold flex items-center justify-center">
                    ${sessionScope.userNom.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>

        <%-- ============ MESSAGES ============ --%>
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

        <%-- ============ STATS ============ --%>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

            <%-- Patients --%>
            <div class="bg-white border-l-4 border-[#00A8E8] shadow-md p-6 hover:shadow-lg transition-shadow">
                <div class="flex items-start justify-between">
                    <div class="w-12 h-12 rounded-lg bg-[#00A8E8]/10 flex items-center justify-center">
                        <svg class="w-6 h-6 text-[#00A8E8]" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
                        </svg>
                    </div>
                    <span class="text-xs font-bold text-[#00A8E8] bg-[#00A8E8]/10 px-2 py-1 rounded">Total</span>
                </div>
                <div class="text-3xl font-extrabold text-gray-900 mt-4">
                    <c:out value="${totalPatients}"/>
                </div>
                <div class="text-sm text-gray-500 font-medium mt-1">Patients</div>
            </div>

            <%-- Médecins --%>
            <div class="bg-white border-l-4 border-[#FF8800] shadow-md p-6 hover:shadow-lg transition-shadow">
                <div class="flex items-start justify-between">
                    <div class="w-12 h-12 rounded-lg bg-[#FF8800]/10 flex items-center justify-center">
                        <svg class="w-6 h-6 text-[#FF8800]" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                    </div>
                    <span class="text-xs font-bold text-[#FF8800] bg-[#FF8800]/10 px-2 py-1 rounded">Actifs</span>
                </div>
                <div class="text-3xl font-extrabold text-gray-900 mt-4">
                    <c:out value="${totalDoctors}"/>
                </div>
                <div class="text-sm text-gray-500 font-medium mt-1">Médecins</div>
            </div>

            <%-- RDV aujourd'hui --%>
            <div class="bg-white border-l-4 border-emerald-500 shadow-md p-6 hover:shadow-lg transition-shadow">
                <div class="flex items-start justify-between">
                    <div class="w-12 h-12 rounded-lg bg-emerald-50 flex items-center justify-center">
                        <svg class="w-6 h-6 text-emerald-600" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                        </svg>
                    </div>
                    <span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-1 rounded">Aujourd'hui</span>
                </div>
                <div class="text-3xl font-extrabold text-gray-900 mt-4">
                    <c:out value="${totalAppointmentsToday}"/>
                </div>
                <div class="text-sm text-gray-500 font-medium mt-1">Rendez-vous</div>
            </div>

            <%-- Départements --%>
            <div class="bg-white border-l-4 border-purple-500 shadow-md p-6 hover:shadow-lg transition-shadow">
                <div class="flex items-start justify-between">
                    <div class="w-12 h-12 rounded-lg bg-purple-50 flex items-center justify-center">
                        <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"/>
                        </svg>
                    </div>
                    <span class="text-xs font-bold text-purple-600 bg-purple-50 px-2 py-1 rounded">Total</span>
                </div>
                <div class="text-3xl font-extrabold text-gray-900 mt-4">
                    <c:out value="${totalDepartments}"/>
                </div>
                <div class="text-sm text-gray-500 font-medium mt-1">Départements</div>
            </div>
        </div>

        <%-- ============ ACTIONS RAPIDES ============ --%>
        <h2 class="text-xl font-extrabold text-gray-900 mb-4">Actions rapides</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

            <a href="${pageContext.request.contextPath}/admin/doctors"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-[#00A8E8]/10 group-hover:bg-[#00A8E8] flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-[#00A8E8] group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Gérer les médecins</h3>
                <p class="text-sm text-gray-500 mt-1">Ajouter, modifier ou supprimer des médecins</p>
                <div class="flex items-center gap-1 text-[#00A8E8] font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/admin/patients"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-[#FF8800]/10 group-hover:bg-[#FF8800] flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-[#FF8800] group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Gérer les patients</h3>
                <p class="text-sm text-gray-500 mt-1">Consulter et gérer les dossiers patients</p>
                <div class="flex items-center gap-1 text-[#00A8E8] font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/admin/specialties"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-emerald-50 group-hover:bg-emerald-500 flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-emerald-600 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Gérer les spécialités</h3>
                <p class="text-sm text-gray-500 mt-1">Organiser les spécialités médicales</p>
                <div class="flex items-center gap-1 text-[#00A8E8] font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/admin/departments"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-purple-50 group-hover:bg-purple-500 flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-purple-600 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Gérer les départements</h3>
                <p class="text-sm text-gray-500 mt-1">Structurer les départements</p>
                <div class="flex items-center gap-1 text-[#00A8E8] font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>
        </div>

        <%-- ============ DERNIERS UTILISATEURS ============ --%>
        <h2 class="text-xl font-extrabold text-gray-900 mb-4">Derniers utilisateurs inscrits</h2>
        <div class="bg-white shadow-md overflow-hidden mb-8">

            <c:choose>

                <%-- Cas : aucun user --%>
                <c:when test="${empty derniersUsers}">
                    <div class="p-12 text-center">
                        <div class="w-16 h-16 mx-auto bg-gray-100 flex items-center justify-center mb-4">
                            <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
                            </svg>
                        </div>
                        <p class="text-sm text-gray-500">Aucun utilisateur inscrit.</p>
                    </div>
                </c:when>

                <%-- Cas : liste --%>
                <c:otherwise>
                    <table class="w-full">
                        <thead class="bg-gray-50 border-b border-gray-100">
                            <tr>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Nom</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Email</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Rôle</th>
                                <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Statut</th>
                                <th class="text-right px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Action</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            <c:forEach items="${derniersUsers}" var="u">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="w-8 h-8 rounded-full bg-[#00A8E8] text-white font-bold flex items-center justify-center flex-shrink-0 text-xs">
                                                ${u.nom.substring(0,1).toUpperCase()}
                                            </div>
                                            <span class="text-sm font-semibold text-gray-800">
                                                <c:out value="${u.nom}"/>
                                            </span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600">
                                        <c:out value="${u.email}"/>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600">
                                        <c:out value="${u.roleName}"/>
                                    </td>
                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${u.enabled}">
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
                                    <td class="px-6 py-4 text-right">
                                        <a href="#" class="text-sm font-bold text-[#00A8E8] hover:text-[#0090c9]">Voir</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- ============ ALERTE SÉCURITÉ ============ --%>
        <div class="bg-[#FF8800]/10 border-l-4 border-[#FF8800] p-5 flex items-start gap-3">
            <svg class="w-6 h-6 text-[#FF8800] flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
            </svg>
            <div>
                <p class="font-bold text-[#FF8800]">Sécurité</p>
                <p class="text-sm text-gray-700 mt-0.5">
                    Pensez à changer le mot de passe administrateur par défaut.
                    <a href="#" class="font-bold text-[#FF8800] hover:underline">Modifier maintenant</a>
                </p>
            </div>
        </div>
    </main>
</body>
</html>