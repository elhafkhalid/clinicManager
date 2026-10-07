<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<aside class="fixed top-0 left-0 h-screen w-64 bg-white shadow-xl flex flex-col z-40">

    <%-- ============ LOGO ============ --%>
    <div class="px-6 py-5 border-b border-gray-100 flex items-center gap-2">
        <div class="w-10 h-10 bg-emerald-500 rounded-lg flex items-center justify-center flex-shrink-0">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
            </svg>
        </div>
        <span class="text-lg font-extrabold text-emerald-500 tracking-tight">
            Clinic<span class="text-gray-900">Manager</span>
        </span>
    </div>

    <%-- ============ PROFIL ============ --%>
    <div class="px-6 py-4 bg-gray-50 border-b border-gray-100 flex items-center gap-3">
        <div class="w-10 h-10 rounded-full bg-emerald-500 text-white font-bold flex items-center justify-center flex-shrink-0 text-sm">
            <c:choose>
                <c:when test="${not empty sessionScope.userNom}">
                    ${fn:substring(sessionScope.userNom, 0, 1).toUpperCase()}
                </c:when>
                <c:otherwise>D</c:otherwise>
            </c:choose>
        </div>
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-gray-800 truncate">
                <c:out value="${sessionScope.userNom != null ? sessionScope.userNom : 'Médecin'}" />
            </p>
            <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-bold bg-emerald-100 text-emerald-700 mt-0.5 uppercase tracking-wider">
                <c:out value="${sessionScope.role != null ? sessionScope.role : 'DOCTOR'}" />
            </span>
        </div>
    </div>

    <%-- ============ MENU ============ --%>
    <nav class="flex-1 overflow-y-auto px-3 py-4 space-y-1">

        <a href="${pageContext.request.contextPath}/doctor/dashboard"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-emerald-500 hover:text-white transition-all border-l-4 border-transparent hover:border-teal-400">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
            </svg>
            Tableau de bord
        </a>

        <a href="${pageContext.request.contextPath}/doctor/agenda"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-emerald-500 hover:text-white transition-all border-l-4 border-transparent hover:border-teal-400">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
            </svg>
            Mon agenda
        </a>

        <a href="${pageContext.request.contextPath}/doctor/availabilities"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-emerald-500 hover:text-white transition-all border-l-4 border-transparent hover:border-teal-400">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            Mes disponibilités
        </a>

        <a href="${pageContext.request.contextPath}/doctor/absences"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-emerald-500 hover:text-white transition-all border-l-4 border-transparent hover:border-teal-400">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"/>
            </svg>
            Mes absences
        </a>

        <a href="${pageContext.request.contextPath}/doctor/appointments"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-emerald-500 hover:text-white transition-all border-l-4 border-transparent hover:border-teal-400">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"/>
            </svg>
            Mes rendez-vous
        </a>

        <a href="${pageContext.request.contextPath}/doctor/notes"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-emerald-500 hover:text-white transition-all border-l-4 border-transparent hover:border-teal-400">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
            </svg>
            Notes médicales
        </a>
    </nav>

    <%-- ============ DÉCONNEXION ============ --%>
    <div class="p-3 border-t border-gray-100">
        <a href="${pageContext.request.contextPath}/logout"
           class="flex items-center gap-3 px-4 py-3 text-sm font-bold text-red-600
                  hover:bg-red-500 hover:text-white transition-all">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
            </svg>
            Déconnexion
        </a>
    </div>
</aside>