<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <c:choose>
        <c:when test="${not empty specialty and not empty specialty.id}">
            <title>Modifier spécialité | ClinicManager</title>
        </c:when>
        <c:otherwise>
            <title>Nouvelle spécialité | ClinicManager</title>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Poppins', sans-serif; } </style>
</head>
<body class="bg-gray-50 text-gray-900">

    <jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp" />

    <main class="ml-64 p-8 min-h-screen">

        <%-- Mode : Update si specialty a un id --%>
        <c:set var="isEdit" value="${not empty specialty and not empty specialty.id}"/>

        <%-- BREADCRUMB --%>
        <nav class="flex items-center gap-2 text-sm text-gray-500 mb-6">
            <a href="${pageContext.request.contextPath}/admin/specialties"
               class="hover:text-[#00A8E8] transition-colors">
                Spécialités
            </a>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
            </svg>
            <span class="text-gray-800 font-semibold">
                <c:choose>
                    <c:when test="${isEdit}">Modifier</c:when>
                    <c:otherwise>Nouvelle</c:otherwise>
                </c:choose>
            </span>
        </nav>

        <%-- TOPBAR --%>
        <div class="mb-8">
            <h1 class="text-3xl font-extrabold text-gray-900">
                <c:choose>
                    <c:when test="${isEdit}">Modifier la spécialité</c:when>
                    <c:otherwise>Nouvelle spécialité</c:otherwise>
                </c:choose>
            </h1>
            <p class="text-gray-500 text-sm mt-1">
                <c:choose>
                    <c:when test="${isEdit}">Modifiez les informations de la spécialité.</c:when>
                    <c:otherwise>Créez une nouvelle spécialité médicale.</c:otherwise>
                </c:choose>
            </p>
        </div>

        <%-- MESSAGE D'ERREUR --%>
        <c:if test="${not empty requestScope.error}">
            <div class="mb-6 bg-red-50 border-l-4 border-red-500 text-red-700 p-4" role="alert">
                <p class="text-sm font-medium"><c:out value="${requestScope.error}"/></p>
            </div>
        </c:if>

        <%-- FORMULAIRE --%>
        <div class="bg-white shadow-md max-w-2xl">

            <c:set var="formAction" value="${isEdit ? 'edit' : 'new'}"/>

            <form action="${pageContext.request.contextPath}/admin/specialties/${formAction}"
                  method="POST"
                  class="p-8 space-y-6">

                <%-- Champ caché id (mode Update) --%>
                <c:if test="${isEdit}">
                    <input type="hidden" name="id" value="${specialty.id}"/>
                </c:if>

                <%-- Champ Nom --%>
                <div>
                    <label for="name" class="block text-sm font-semibold text-gray-700 mb-2">
                        Nom de la spécialité <span class="text-red-500">*</span>
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                            </svg>
                        </div>
                        <input type="text"
                               id="name"
                               name="name"
                               required
                               maxlength="100"
                               value="<c:out value='${specialty.name}'/>"
                               placeholder="Ex : Cardiologie, Pédiatrie..."
                               class="w-full pl-11 pr-4 py-3 border border-gray-300
                                      focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                      outline-none transition-all text-sm"/>
                    </div>
                </div>

                <%-- Champ Département (SELECT) --%>
                <div>
                    <label for="departmentId" class="block text-sm font-semibold text-gray-700 mb-2">
                        Département <span class="text-red-500">*</span>
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none z-10">
                            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                      d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"/>
                            </svg>
                        </div>
                        <select id="departmentId"
                                name="departmentId"
                                required
                                class="w-full pl-11 pr-10 py-3 border border-gray-300
                                       focus:border-[#00A8E8] focus:ring-2 focus:ring-[#00A8E8]/30
                                       outline-none transition-all text-sm appearance-none
                                       bg-white cursor-pointer">
                            <option value="">-- Sélectionner un département --</option>
                            <c:forEach items="${departments}" var="dep">
                                <option value="${dep.id}"
                                        ${not empty specialty and not empty specialty.department
                                          and specialty.department.id == dep.id ? 'selected' : ''}>
                                    <c:out value="${dep.name}"/>
                                </option>
                            </c:forEach>
                        </select>
                        <%-- Flèche dropdown custom --%>
                        <div class="absolute inset-y-0 right-0 pr-4 flex items-center pointer-events-none">
                            <svg class="h-4 w-4 text-gray-400" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7"/>
                            </svg>
                        </div>
                    </div>
                    <p class="text-xs text-gray-400 mt-2">
                        Sélectionnez le département auquel appartient cette spécialité.
                    </p>
                </div>

                <%-- BOUTONS --%>
                <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-100">
                    <a href="${pageContext.request.contextPath}/admin/specialties"
                       class="px-6 py-3 text-sm font-bold text-gray-600
                              hover:bg-gray-100 transition-colors uppercase tracking-wider">
                        Annuler
                    </a>
                    <button type="submit"
                            class="inline-flex items-center gap-2 bg-[#00A8E8] hover:bg-[#0090c9]
                                   text-white font-bold px-6 py-3 transition-colors
                                   text-sm uppercase tracking-wider shadow-lg shadow-[#00A8E8]/30">
                        <c:choose>
                            <c:when test="${isEdit}">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                </svg>
                                Modifier
                            </c:when>
                            <c:otherwise>
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                                </svg>
                                Enregistrer
                            </c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>