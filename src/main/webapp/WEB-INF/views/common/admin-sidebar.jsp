<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<aside class="fixed top-0 left-0 h-screen w-64 bg-white shadow-xl flex flex-col z-40">

    <%-- LOGO --%>
    <div class="px-6 py-5 border-b border-gray-100 flex items-center gap-2">
        <div class="w-10 h-10 bg-[#00A8E8] rounded-lg flex items-center justify-center flex-shrink-0">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"/>
            </svg>
        </div>
        <span class="text-lg font-extrabold text-[#00A8E8] tracking-tight">
            Clinic<span class="text-gray-900">Manager</span>
        </span>
    </div>

    <%-- PROFIL --%>
    <div class="px-6 py-4 bg-gray-50 border-b border-gray-100 flex items-center gap-3">
        <div class="w-10 h-10 rounded-full bg-[#00A8E8] text-white font-bold flex items-center justify-center flex-shrink-0 text-sm">
            <c:choose>
                <c:when test="${not empty sessionScope.userNom}">
                    ${fn:substring(sessionScope.userNom, 0, 1).toUpperCase()}
                </c:when>
                <c:otherwise>A</c:otherwise>
            </c:choose>
        </div>
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-gray-800 truncate">
                <c:out value="${sessionScope.userNom != null ? sessionScope.userNom : 'Administrateur'}" />
            </p>
            <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-bold bg-[#00A8E8]/10 text-[#00A8E8] mt-0.5 uppercase tracking-wider">
                <c:out value="${sessionScope.role != null ? sessionScope.role : 'ADMIN'}" />
            </span>
        </div>
    </div>

    <%-- MENU --%>
    <nav class="flex-1 overflow-y-auto px-3 py-4 space-y-1">

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-[#00A8E8] hover:text-white transition-all border-l-4 border-transparent hover:border-[#FF8800]">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
            </svg>
            Tableau de bord
        </a>

        <a href="${pageContext.request.contextPath}/admin/doctors"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-[#00A8E8] hover:text-white transition-all border-l-4 border-transparent hover:border-[#FF8800]">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
            Médecins
        </a>

        <a href="${pageContext.request.contextPath}/admin/patients"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-[#00A8E8] hover:text-white transition-all border-l-4 border-transparent hover:border-[#FF8800]">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/>
            </svg>
            Patients
        </a>

        <a href="${pageContext.request.contextPath}/admin/specialties"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-[#00A8E8] hover:text-white transition-all border-l-4 border-transparent hover:border-[#FF8800]">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
            </svg>
            Spécialités
        </a>

        <a href="${pageContext.request.contextPath}/admin/departments"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-[#00A8E8] hover:text-white transition-all border-l-4 border-transparent hover:border-[#FF8800]">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"/>
            </svg>
            Départements
        </a>

        <a href="${pageContext.request.contextPath}/admin/users"
           class="group flex items-center gap-3 px-4 py-3 text-sm font-semibold text-gray-700
                  hover:bg-[#00A8E8] hover:text-white transition-all border-l-4 border-transparent hover:border-[#FF8800]">
            <svg class="w-5 h-5 text-gray-400 group-hover:text-white" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/>
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
            </svg>
            Utilisateurs
        </a>
    </nav>

    <%-- DÉCONNEXION --%>
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