<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon espace | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/doctor-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- ============ TOPBAR ============ --%>
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
            <div>
                <h1 class="text-3xl font-extrabold text-gray-900">
                    Bonjour, <c:out value="${sessionScope.userNom}"/> 👋
                </h1>
                <p class="text-gray-500 text-sm mt-1">Voici votre espace médecin.</p>
            </div>
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-500">Lundi, 5 Octobre 2026</span>
                <div class="w-10 h-10 rounded-full bg-emerald-500 text-white font-bold flex items-center justify-center">
                    ${sessionScope.userNom.substring(0,1).toUpperCase()}
                </div>
            </div>
        </div>

        <%-- ============ CARTE PROCHAIN RDV ============ --%>
        <div class="relative bg-gradient-to-r from-emerald-600 to-teal-500 shadow-xl p-8 mb-8 overflow-hidden">
            <div class="absolute top-[-50%] right-[-10%] w-96 h-96 bg-white opacity-10 rounded-full blur-3xl"></div>
            <div class="relative z-10 flex flex-col md:flex-row md:items-center md:justify-between gap-6">
                <div class="text-white">
                    <div class="flex items-center gap-2 mb-3">
                        <div class="w-10 h-10 rounded-lg bg-white/20 backdrop-blur flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <span class="text-xs font-bold uppercase tracking-widest text-emerald-100">Prochain rendez-vous</span>
                    </div>
                    <p class="text-2xl font-extrabold mt-2">Aucun rendez-vous imminent</p>
                    <p class="text-emerald-100 text-sm mt-1">Consultez votre agenda pour la journée.</p>
                </div>
                <a href="${pageContext.request.contextPath}/doctor/agenda"
                   class="inline-flex items-center gap-2 bg-white text-emerald-600 font-bold px-6 py-3
                          hover:bg-gray-100 transition-colors self-start md:self-center flex-shrink-0">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                    Voir mon agenda
                </a>
            </div>
        </div>

        <%-- ============ STATS ============ --%>
        <h2 class="text-xl font-extrabold text-gray-900 mb-4">Mes statistiques</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

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
                <div class="text-3xl font-extrabold text-gray-900 mt-4">0</div>
                <div class="text-sm text-gray-500 font-medium mt-1">Rendez-vous</div>
            </div>

            <%-- Patients --%>
            <div class="bg-white border-l-4 border-[#00A8E8] shadow-md p-6 hover:shadow-lg transition-shadow">
                <div class="flex items-start justify-between">
                    <div class="w-12 h-12 rounded-lg bg-[#00A8E8]/10 flex items-center justify-center">
                        <svg class="w-6 h-6 text-[#00A8E8]" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
                        </svg>
                    </div>
                    <span class="text-xs font-bold text-gray-600 bg-gray-50 px-2 py-1 rounded">Total</span>
                </div>
                <div class="text-3xl font-extrabold text-gray-900 mt-4">0</div>
                <div class="text-sm text-gray-500 font-medium mt-1">Patients suivis</div>
            </div>

            <%-- Disponibilités --%>
            <div class="bg-white border-l-4 border-amber-500 shadow-md p-6 hover:shadow-lg transition-shadow">
                <div class="flex items-start justify-between">
                    <div class="w-12 h-12 rounded-lg bg-amber-50 flex items-center justify-center">
                        <svg class="w-6 h-6 text-amber-600" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <span class="text-xs font-bold text-amber-600 bg-amber-50 px-2 py-1 rounded">Cette semaine</span>
                </div>
                <div class="text-3xl font-extrabold text-gray-900 mt-4">0</div>
                <div class="text-sm text-gray-500 font-medium mt-1">Créneaux ouverts</div>
            </div>

            <%-- Notes --%>
            <div class="bg-white border-l-4 border-purple-500 shadow-md p-6 hover:shadow-lg transition-shadow">
                <div class="flex items-start justify-between">
                    <div class="w-12 h-12 rounded-lg bg-purple-50 flex items-center justify-center">
                        <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                    </div>
                    <span class="text-xs font-bold text-purple-600 bg-purple-50 px-2 py-1 rounded">Total</span>
                </div>
                <div class="text-3xl font-extrabold text-gray-900 mt-4">0</div>
                <div class="text-sm text-gray-500 font-medium mt-1">Notes médicales</div>
            </div>
        </div>

        <%-- ============ ACTIONS RAPIDES ============ --%>
        <h2 class="text-xl font-extrabold text-gray-900 mb-4">Actions rapides</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

            <a href="${pageContext.request.contextPath}/doctor/availabilities"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-emerald-500 transition-all">
                <div class="w-12 h-12 rounded-lg bg-emerald-50 group-hover:bg-emerald-500 flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-emerald-600 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Mes disponibilités</h3>
                <p class="text-sm text-gray-500 mt-1">Gérer mes horaires de travail</p>
                <div class="flex items-center gap-1 text-emerald-600 font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/doctor/absences"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-amber-500 transition-all">
                <div class="w-12 h-12 rounded-lg bg-amber-50 group-hover:bg-amber-500 flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-amber-600 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Mes absences</h3>
                <p class="text-sm text-gray-500 mt-1">Déclarer congés et absences</p>
                <div class="flex items-center gap-1 text-emerald-600 font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/doctor/appointments"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-[#00A8E8] transition-all">
                <div class="w-12 h-12 rounded-lg bg-[#00A8E8]/10 group-hover:bg-[#00A8E8] flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-[#00A8E8] group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Mes rendez-vous</h3>
                <p class="text-sm text-gray-500 mt-1">Voir tous mes RDV</p>
                <div class="flex items-center gap-1 text-emerald-600 font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/doctor/notes"
               class="group bg-white border border-gray-100 p-6 shadow-sm hover:shadow-lg
                      hover:border-purple-500 transition-all">
                <div class="w-12 h-12 rounded-lg bg-purple-50 group-hover:bg-purple-500 flex items-center justify-center transition-colors">
                    <svg class="w-6 h-6 text-purple-600 group-hover:text-white transition-colors" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                    </svg>
                </div>
                <h3 class="text-base font-bold text-gray-900 mt-4">Notes médicales</h3>
                <p class="text-sm text-gray-500 mt-1">Rédiger des notes de consultation</p>
                <div class="flex items-center gap-1 text-emerald-600 font-bold text-xs uppercase mt-4 group-hover:gap-2 transition-all">
                    Ouvrir
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                    </svg>
                </div>
            </a>
        </div>

        <%-- ============ AGENDA DU JOUR ============ --%>
        <h2 class="text-xl font-extrabold text-gray-900 mb-4">Aujourd'hui</h2>
        <div class="bg-white shadow-md overflow-hidden mb-8">
            <div class="p-12 text-center">
                <div class="w-16 h-16 mx-auto bg-gray-100 flex items-center justify-center mb-4">
                    <svg class="w-8 h-8 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                </div>
                <h3 class="text-lg font-bold text-gray-800 mb-1">Aucun rendez-vous aujourd'hui</h3>
                <p class="text-sm text-gray-500">Votre journée est libre.</p>
            </div>
        </div>

        <%-- ============ CONSEIL ============ --%>
        <div class="bg-emerald-50 border-l-4 border-emerald-500 p-5 flex items-start gap-3">
            <svg class="w-6 h-6 text-emerald-600 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            <div>
                <p class="font-bold text-emerald-800">Astuce</p>
                <p class="text-sm text-gray-700 mt-0.5">
                    Pensez à mettre à jour vos disponibilités régulièrement pour permettre à vos patients de prendre rendez-vous.
                </p>
            </div>
        </div>
    </main>
</body>
</html>