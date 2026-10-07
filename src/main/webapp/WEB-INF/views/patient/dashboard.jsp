<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon espace santé | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/patient-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- TOPBAR --%>
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
            <div>
                <h1 class="text-3xl font-extrabold text-gray-900">
                    Bonjour, <c:out value="${sessionScope.userNom}"/> 👋
                </h1>
                <p class="text-gray-500 text-sm mt-1">Voici un résumé de votre espace santé.</p>
            </div>
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-500">Lundi, 5 Octobre 2026</span>
                <div class="w-10 h-10 rounded-full bg-[#FF8800] text-white font-bold flex items-center justify-center">
                    ${sessionScope.userNom.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>

        <%-- CARTE PROCHAIN RDV --%>
        <div class="relative bg-gradient-to-r from-[#0a4d68] to-[#00A8E8] shadow-xl p-8 mb-8 overflow-hidden">
            <div class="absolute top-[-50%] right-[-10%] w-96 h-96 bg-white opacity-10 rounded-full blur-3xl"></div>
            <div class="relative z-10 flex flex-col md:flex-row md:items-center md:justify-between gap-6">
                <div class="text-white">
                    <div class="flex items-center gap-2 mb-3">
                        <div class="w-10 h-10 rounded-lg bg-white/20 backdrop-blur flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                            </svg>
                        </div>
                        <span class="text-xs font-bold uppercase tracking-widest text-blue-100">Prochain rendez-vous</span>
                    </div>
                    <p class="text-2xl font-extrabold mt-2">Aucun rendez-vous à venir</p>
                    <p class="text-blue-100 text-sm mt-1">Prenez rendez-vous avec un médecin dès maintenant.</p>
                </div>
                <a href="${pageContext.request.contextPath}/patient/book-appointment"
                   class="inline-flex items-center gap-2 bg-white text-[#00A8E8] font-bold px-6 py-3
                          hover:bg-gray-100 transition-colors self-start md:self-center flex-shrink-0">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                    </svg>
                    Prendre un rendez-vous
                </a>
            </div>
        </div>

        <%-- ACTIONS RAPIDES --%>
        <h2 class="text-xl font-extrabold text-gray-900 mb-4">Actions rapides</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

            <a href="${pageContext.request.contextPath}/patient/book-appointment"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-[#00A8E8]/10 group-hover:bg-[#00A8E8] flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-[#00A8E8] group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Prendre un RDV</h3>
                <p class="text-sm text-gray-500 mt-1">Réserver un créneau</p>
            </a>

            <a href="${pageContext.request.contextPath}/patient/my-appointments"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-[#FF8800]/10 group-hover:bg-[#FF8800] flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-[#FF8800] group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Mes rendez-vous</h3>
                <p class="text-sm text-gray-500 mt-1">Voir tous mes RDV</p>
            </a>

            <a href="${pageContext.request.contextPath}/patient/profile"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-emerald-50 group-hover:bg-emerald-500 flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-emerald-600 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Mon profil</h3>
                <p class="text-sm text-gray-500 mt-1">Gérer mes informations</p>
            </a>

            <a href="${pageContext.request.contextPath}/patient/history"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-purple-50 group-hover:bg-purple-500 flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-purple-600 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Historique médical</h3>
                <p class="text-sm text-gray-500 mt-1">Consulter mes notes</p>
            </a>
        </div>

        <%-- DERNIÈRES CONSULTATIONS --%>
        <h2 class="text-xl font-extrabold text-gray-900 mb-4">Mes dernières consultations</h2>
        <div class="bg-white shadow-md overflow-hidden mb-8">
            <table class="w-full">
                <thead class="bg-gray-50 border-b border-gray-100">
                    <tr>
                        <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Date</th>
                        <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Médecin</th>
                        <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Type</th>
                        <th class="text-left px-6 py-3 text-xs font-bold text-gray-500 uppercase tracking-wider">Statut</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 text-sm text-gray-700">15/09/2026</td>
                        <td class="px-6 py-4 text-sm font-semibold text-gray-800">Dr. Sarah Martin</td>
                        <td class="px-6 py-4 text-sm text-gray-600">Consultation</td>
                        <td class="px-6 py-4">
                            <span class="inline-flex px-3 py-1 text-xs font-bold bg-green-100 text-green-700 rounded-full">Terminé</span>
                        </td>
                    </tr>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 text-sm text-gray-700">22/08/2026</td>
                        <td class="px-6 py-4 text-sm font-semibold text-gray-800">Dr. Paul Bernard</td>
                        <td class="px-6 py-4 text-sm text-gray-600">Suivi</td>
                        <td class="px-6 py-4">
                            <span class="inline-flex px-3 py-1 text-xs font-bold bg-green-100 text-green-700 rounded-full">Terminé</span>
                        </td>
                    </tr>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 text-sm text-gray-700">10/10/2026</td>
                        <td class="px-6 py-4 text-sm font-semibold text-gray-800">Dr. Sarah Martin</td>
                        <td class="px-6 py-4 text-sm text-gray-600">Consultation</td>
                        <td class="px-6 py-4">
                            <span class="inline-flex px-3 py-1 text-xs font-bold bg-blue-100 text-blue-700 rounded-full">Planifié</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <%-- CONSEIL SANTÉ --%>
        <div class="bg-emerald-50 border-l-4 border-emerald-500 p-5 flex items-start gap-3">
            <svg class="w-6 h-6 text-emerald-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/>
            </svg>
            <div>
                <p class="font-bold text-emerald-800">Conseil santé du jour</p>
                <p class="text-sm text-gray-700 mt-0.5">
                    Buvez au moins 1,5 L d'eau par jour et pensez à faire 30 minutes d'activité physique.
                </p>
            </div>
        </div>
    </main>
</body>
</html>